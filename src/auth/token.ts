import { Elysia } from "elysia";
import { PrismaClient } from "@prisma/client";
import UAParser from 'ua-parser-js';
import { jwt } from "@elysiajs/jwt";
import { h } from "../helper/h";

const prisma = new PrismaClient();

export const savetoken = async (body: { token: string, employee_id: number, information:string }) => {
    const { token, employee_id, information } = body;

    try {
        // Gunakan UAParser untuk mendapatkan informasi perangkat
        const parser = new UAParser();
        parser.setUA(information);  // Set User-Agent
        const deviceInfo = parser.getResult();  // Parsing hasil

        console.log("Parsed device info:", deviceInfo);  // Log untuk debugging

        await prisma.token.create({
            data: {
                token: token,
                employee_id: parseInt(employee_id.toString()),
                information: deviceInfo  // Simpan informasi perangkat
            },
        });

        return deviceInfo;
    } catch (error) {
        console.error("Error saving token:", error);
        throw error;
    }
};

export const tokenapp = new Elysia()
  .use(
    jwt({
        name: 'jwt',
        secret: h.env('SECRET_TOKEN')
    })
  )
.post('check', async({body})=>{
    // return body;
    const { employeename } = body
    const employee = await prisma.employee.findFirst({
        where:{
            employeename: employeename,
            statusenabled: true,
        }
    })
        const tokenCheck = await prisma.token.findMany({
        where:{
            employee_id: employee.id_employee,
        }
    })
    return {tokenCount: tokenCheck.length}
})
.post('check-token', async({headers, body})=>{
    // return h.env('SECRET_TOKEN')
    const { token } = body   


    const profile = await jwt.verify(token)
        if (!profile) {
            return {
                message: 'Unauthorized',
                status: '401'
            }
    }

    const tokenCheck = await prisma.token.findFirst({
        where:{
            token: token,
        }
    })
    return {tokenCount: tokenCheck}
})