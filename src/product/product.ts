import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";
import { Pool } from "pg";
import { logstock } from "./logstock";

const client = new Pool({
  connectionString: process.env.DATABASE_URL,
});
const prisma = new PrismaClient();

export const product = new Elysia()
.post('/module/product/create', ({ body })=>{
    const { productname,cdproduct,employee_id } = body
    const createproduct = prisma.product.create({
      data:{
        statusenabled: true,
        productname: productname,
        cdproduct: cdproduct,
        employee_id: employee_id
      }
    })
    return {
      status: "success",
      message: "Berhasil membuat data",
      data:createproduct
    }
})
.post('/module/product/:id_product/update', async ({ params,body })=>{
    const { productname,cdproduct,employee_id,statusenabled } = body
    const { id_product } = params
    const updateproduct = await prisma.product.update({
      where:{
        id_product: id_product
      },
      data:{
        statusenabled: statusenabled,
        productname: productname,
        cdproduct: cdproduct,
        employee_id: employee_id
      }
    })
    await log({
      stockstart: currentStock3 - 10,
      in: 10,
      out: 0,
      stockend: currentStock3,
      product_id: product2.id_product,
      location_id: location.id_location,
      employee_id: employee.id_employee,
      description: employee.description,
    });
    return {
      status: "success",
      message: "Berhasil mengubah data",
      data: updateproduct
    }
})
.get('/module/product/:location', ({ params })=>{
    const { location } = params
    const getproduct = client.query(`select ps.hargabeli, ps.hargajual,pr.employeename, pr.productname,pr.cdproduct, lo.location, wc.market, sum(ps.stockproduct) as total
      from productstock as ps 
      join location as lo on lo.id_location = ps.location_id 
      join (select pr2.id_product, em.employeename, pr2.productname,pr2.cdproduct from product as pr2 join employee as em on pr2.employee_id = em.id_employee) as pr on pr.id_product = ps.product_id
      join wherepurchase as wc on wc.id_wherepurchase = ps.wherepurchase_id 
      where ps.statusenabled = true
      group by ps.hargabeli, ps.hargajual,pr.employeename, pr.productname,pr.cdproduct, lo.location, wc.market`)
    return {
      status: "success",
      message: "Berhasil mengubah data",
      data: getproduct
    }
})
