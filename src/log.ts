import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();
// class seed {
//   constructor(public data: string[] = ["Moonhalo"]) {}
// }
export const log = async (body: any) => {
  try {
    const request = body;
    const logstock = prisma.log.create({
      data: {
        activityemployee_id: request.activityemployee_id,
        location_id: request.location_id,
        description: request.description,
        statusenabled: true,
      },
    });
    return logstock;
  } catch (error) {
    return error;
  }
};
