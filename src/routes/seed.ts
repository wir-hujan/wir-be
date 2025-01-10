import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";
import { faker } from "@faker-js/faker";

import { dummy } from "../services/seed.service";

const prisma = new PrismaClient();
// class seed {
//   constructor(public data: string[] = ["Moonhalo"]) {}
// }
export const seed = new Elysia().get("/dummy", async () => {
  // return "asdsad";
  const dummyClass = new dummy();
  const createRole = dummyClass.createRole()
  const createModule = dummyClass.createModule()
  const createSubModule = dummyClass.createSubmodule()
  const createUnit = dummyClass.createUnit()
  // return createSubModule;
  for (let i: number = 0; i < 10; i++) {
    const roleid = await dummyClass.findRole(i)
    const createStore = await dummyClass.createStore()
    for (let i: number = 0; i < 10; i++) {
      const createMarket = await dummyClass.createMarket(createStore.id)
      for (let i: number = 0; i < 10; i++) {
        const createProduct = await dummyClass.createProduct()
        const createProductmarket = await dummyClass.createProductMarket(createMarket.id, createProduct.id)
      }
    }
    const emlopyeecreate = await dummyClass.createEmployee(createStore.id, roleid.id == null ? 1 : 1)
    const createUserAccess = await dummyClass.createEmployeeAccess(emlopyeecreate.id)
  }
  return {
    message: "Seeder berhasil dibuat"
  }
});
