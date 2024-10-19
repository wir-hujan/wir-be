import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
// class seed {
//   constructor(public data: string[] = ["Moonhalo"]) {}
// }
export const logstock = async (body: any) => {
  try {
    const request = body;
    // return request;

    // Contoh
    // await logstock({
    //   stockstart: currentStock3 - 10,
    //   in: 10,
    //   out: 0,
    //   stockend: currentStock3,
    //   product_id: product2.id_product,
    //   location_id: location.id_location,
    //   employee_id: employee.id_employee,
    //   description: employee.description,
    // });

    const logstock = await prisma.logstock.create({
      data: {
        stockstart: request.stockstart,
        in: request.in,
        out: request.out,
        stockend: request.stockend,
        product_id: request.product_id,
        location_id: request.location_id,
        employee_id: request.employee_id,
        description: request.description,
        statusenabled: true,
      },
    });
    return logstock;
  } catch (error) {
    return error;
  }
};
