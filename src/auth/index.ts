import { Elysia } from "elysia";
import { jwt } from "@elysiajs/jwt";
import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
import { Pool } from "pg";
import { edenFetch } from '@elysiajs/eden'
import { savetoken } from './token'


const client = new Pool({
  connectionString: process.env.DATABASE_URL,
});

const prisma = new PrismaClient();

export const auth = new Elysia()
  .use(
    jwt({
        name: 'jwt',
        secret: 'HunsSAaSAksa@.dasdasd%%%%'
    })
  )
  .post("/login", async ({ jwt, cookie: { auth },body }) => {

    const { employeename, password, information } = body;
    

    // Cari user berdasarkan employeename dan statusenabled
    const employee = await prisma.employee.findFirst({
      where: {
        employeename: employeename,
        statusenabled: true,
      },
    });
    await prisma.token.deleteMany({
      where:{
          employee_id: employee.id_employee,
      }
    })
    if (employee != undefined) {
      const check = await bcrypt.compare(password, employee.password);
      if (!check) {
        return {
          status: "error",
          message: "Username atau password salah",
        };
      }
      const token = await jwt.sign({ employeename: employee.employeename });
      auth.set({
        value: token, 
        httpOnly: true,
        maxAge: 7 * 86400,
        path: '/profile',
      })
      const savetokenaa = await savetoken({
        token: token,
        employee_id: employee.id_employee,
        information: information,
      })
      // return savetokenaa
      // Jika employee ditemukan, lakukan pengecekan password (bisa tambahkan bcrypt)
      return {
        status: "success",
        message: `Berhasil login`,
        token: token,
      };
    } else {
      // Jika user tidak ditemukan atau statusenabled = false
      return {
        status: "error",
        message: "Username atau password salah",
      };
    }
  })
  .post("/register", async ({ body }) => {
    const { employeename, password, fullname, location_id, role_id } = body;

    const checkemployee = await prisma.employee.findFirst({
      where: {
        employeename: employeename,
        statusenabled: true,
      },
    });

    if (checkemployee == undefined) {

      const hashedPassword = await bcrypt.hash(password, 10);
      const role = await client.query(
        "select id_role,role,linkmodule from role where id_role = $1",
        [role_id]
      );
      // const jsonObject = JSON.parse(role.rows[0].module)
      const newemployee = await prisma.employee.create({
        data: {
          statusenabled: true,
          fullname: fullname,
          location_id: parseInt(location_id),
          employeename: employeename,
          password: hashedPassword,
          linkmodule: [
            ...role.rows[0].linkmodule
          ],
          role_id: parseInt(role.rows[0].id_role),
        },
      });
      return {
        status: "success",
        message: `Akun berhasil dibuat`,
        data: newemployee,
      };
    } else {
      // Jika user tidak ditemukan atau statusenabled = false
      return {
        status: "error",
        message: "Akun gagal dibuat",
      };
    }
  })
  .get('/profile', async ({ jwt, set, cookie: { auth } }) => {
      try{
        const profile = await jwt.verify(auth.value)
        if (!profile) {
          set.status = 401
          return 'Unauthorized'
        }

        const employee = await client.query(
          `SELECT em.id_employee,em.fullname,em.employeename,lo.location, em.location_id
          FROM employee as em 
          JOIN location as lo ON lo.id_location = em.location_id 
          WHERE em.statusenabled = true AND em.employeename = $1`,
          [profile.employeename]
        );
        await prisma.token.findMany({
          where:{
              employee_id: employee.id_employee,
          }
        })
      // return employee.rows;

        return {
            status: "success",
            message: "Pengambilan data sukes",
            data: employee.rows,
        };
      }catch(err){
          return {
          status: "error",
          message: "gagal mengambil data",
        };
      }
    });
