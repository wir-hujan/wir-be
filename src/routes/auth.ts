import { Elysia, t } from "elysia";
import { jwt } from '@elysiajs/jwt';
import { h } from "../services/h.service";
import { AuthFormat, employeeFormat } from "../interfaces/auth.interface";


export const auth = new Elysia({ prefix: "/auth" })
    .use(jwt({
        name: 'jwt',
        secret: Bun.env.SECRET_TOKEN!
    }))
    .post('/login/post', async ({ jwt, cookie: { auth }, body }) => {
        const helper = new h()
        const findEmployee = (await helper.findEmployeeUsername(body.username))!;
        if (findEmployee !== null) {
            const checkPassword = await Bun.password.verify(body.password, findEmployee.password);
            if (checkPassword) {
                delete findEmployee.password;
                auth.set({
                    value: await jwt.sign(findEmployee)
                })
                await helper.updateTokenEmployee(body.username, auth.value)
                return {
                    token: auth.value,
                    message: "Login berhasil"
                };
            }
            return {
                message: "Username tidak ditemukan"
            }
        }
        return {
            message: "Username tidak ditemukan"
        }
    }, {
        body: t.Object({
            password: t.String(),
            username: t.String()
        })
    })
    .get('/token/get', async ({ jwt, cookie: { auth } }) => {
        const helper = new h()
        const secret = Bun.env.SECRET_TOKEN;
        const dataToken = await jwt.verify(auth.value, secret)
        if (dataToken != false) {
            const checkTokenLoginDB = await helper.findEmployeeToken(auth.value)
            // return checkTokenLoginDB == null
            if (checkTokenLoginDB != null) {
                return {
                    token: auth.value,
                }
            } else {
                await helper.updateTokenEmployee(dataToken.username)
                auth.remove()
                return {
                    message: "Token tidak di kenali"
                }
            }

        } else {
            auth.remove()
            return {
                message: "Token tidak di kenali"
            }
        }
    }, {
        cookie: t.Cookie({
            auth: t.String()
        })
    })
    .get('/profile/get', async ({ jwt, cookie: { auth } }) => {
        const helper = new h()
        const secret = Bun.env.SECRET_TOKEN;
        const dataToken = await jwt.verify(auth.value, secret)
        if (dataToken != false) {
            const checkTokenLoginDB = await helper.findEmployeeToken(auth.value)
            if (checkTokenLoginDB != null) {
                return dataToken
            } else {
                await helper.updateTokenEmployee(dataToken.username)
                auth.remove()

                return {
                    message: {
                        message: "Token tidak di kenali"
                    }
                }
            }

        } else {
            auth.remove()
            return {
                message: "Token tidak di kenali"
            }
        }
    }, {
        cookie: t.Cookie({
            auth: t.String()
        })
    })
    .post('/logout/post', async ({ jwt, cookie: { auth } }) => {
        const helper = new h()
        const secret = Bun.env.SECRET_TOKEN;
        const dataToken = await jwt.verify(auth.value, secret)
        const findEmployee = await helper.findEmployeeToken(auth.value)
        if (findEmployee !== null) {
            await helper.updateTokenEmployee(findEmployee.username)
        }
        auth.remove()
        return {
            message: "Berhasil logout"
        }
    }, {
        cookie: t.Cookie({
            auth: t.String()
        })
    })

