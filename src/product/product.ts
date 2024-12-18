import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";
import { Pool } from "pg";
import { log } from "./../log";
import { swagger } from "@elysiajs/swagger";

const client = new Pool({
  connectionString: process.env.DATABASE_URL,
});
const prisma = new PrismaClient();

export const product = new Elysia()

  .post('/module/product/create', async ({ body }) => {
    try {
      const { productname, cdproduct, employee_id, unit_id } = body;
      const createproduct = await prisma.product.create({
        data: {
          statusenabled: true,
          productname,
          cdproduct,
          employee_id: parseInt(employee_id),
          unit_id: parseInt(unit_id),
        }
      });
      return {
        status: "success",
        message: "Berhasil membuat produk",
        data: createproduct
      };
    } catch (e) {
      return {
        status: "error",
        message: e.message,
      };
    }
  },
  {
    detail: {
      tags: ['App'],
      description: 'asdsadsad',
      responses: {
        info: 'asdsa'
         
      }
    },
    
  })

  .post('/module/product/:id_product/update', async ({ params, body }) => {
    try {
      const { productname, cdproduct, employee_id, statusenabled,unit_id } = body;
      const { id_product } = params;

      const updateproduct = await prisma.product.update({
        where: {
          id_product: parseInt(id_product)
        },
        data: {
          statusenabled: statusenabled == 'true' ? true : false,
          productname: productname,
          cdproduct: cdproduct,
          employee_id: parseInt(employee_id),
          unit_id: parseInt(unit_id)
        }
      });

      const productget =  await prisma.product.findFirst({
        where: {
          id_product: parseInt(id_product)
        }
      })
      // return productget;
      await log({
        activityemployee_id: 2,
        location_id: null,
        description: `Edit produk dengan ID ${id_product}`,
        statusenabled: true,
        data: productget,
        employee_id: parseInt(employee_id),
      });

      return {
        status: "success",
        message: "Berhasil mengubah produk",
        data: updateproduct
      };
    } catch (e) {
      return {
        status: "error",
        message: e.message,
      };
    }
  })


  .get('/module/product/:location', async ({ params }) => {
    const { location } = params;
    try {
      const getproduct = await client.query(`
        select ps.howbuy, ps.howsold, pr.employeename, pr.productname, pr.cdproduct, lo.location, wc.market, sum(ps.stockproduct) as total
        from productstock as ps 
        join location as lo on lo.id_location = ps.location_id 
        join (select pr2.id_product, em.employeename, pr2.productname, pr2.cdproduct from product as pr2 
				join employee as em on pr2.employee_id = em.id_employee) as pr on pr.id_product = ps.product_id
        join wherepurchase as wc on wc.id_wherepurchase = ps.wherepurchase_id 
        where ps.statusenabled = true and lo.id_location = $1
        group by ps.howbuy, ps.howsold, pr.employeename, pr.productname, pr.cdproduct, lo.location, wc.market`, [location]);

      return {
        status: "success",
        message: "Berhasil mengambil data",
        data: getproduct.rows
      };
    } catch (e) {
      return {
        status: "error",
        message: e.message,
      };
    }
  });
