import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";
import { faker, simpleFaker } from "@faker-js/faker";
import bcrypt from "bcrypt";

const prisma = new PrismaClient();

export class dummy {
    async createRole() {
        const result = await prisma.role.findMany();
        if (result.length == 0) {
            await prisma.role.createMany({
                data: [
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'SuperAdmin',
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Admin Cabang',
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Cabang',
                        isActive: true
                    }
                ]
            })
        }
    }
    async createUnit() {
        const result = await prisma.unit.findMany();
        if (result.length == 0) {
            await prisma.unit.createMany({
                data: [
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'PCS',
                        isActive: true
                    }
                ]
            })
        }
    }
    async createModule() {
        const result = await prisma.module.findMany();
        if (result.length == 0) {
            await prisma.module.createMany({
                data: [
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Penjualan',
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Produk',
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Suplier',
                        isActive: true
                    }
                ]
            })
        }
    }
    async createSubmodule() {
        const result = await prisma.submodule.findMany();
        if (result.length == 0) {
            await prisma.submodule.createMany({
                data: [
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Input Jual',
                        url: '/module/jual',
                        module_id: 1,
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Input suplier',
                        url: '/module/jual',
                        module_id: 3,
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Input Produk',
                        url: '/module/jual',
                        module_id: 2,
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Data Produk',
                        url: '/module/jual',
                        module_id: 2,
                        isActive: true
                    },
                    {
                        created_by: 1,
                        updated_by: 1,
                        name: 'Data suplier',
                        url: '/module/jual',
                        module_id: 3,
                        isActive: true
                    },

                ]
            })
        }
        //         return prisma.$queryRaw`
        //         SELECT * FROM submodule as sm 
        // join module as md on md.id = sm.module_id; 
        //         `;
    }
    async createEmployeeAccess(userId: number) {
        const result = await prisma.employeeAccess.findMany();
        if (result.length == 0) {
            await prisma.employeeAccess.create({
                data: {
                    employee_id: userId,
                    submodule_id: 1,
                    isActive: true
                }
            })
        }
    }
    async findRole(r: number) {
        let id
        for (let i = 3; i >= 1; i--) {
            if ((r % i) == 0) {
                id = i
                break;
            }

        }
        const result = await prisma.role.findFirst({
            where: {
                id: id,
            }, select: {
                id: true
            }
        });
        // return id + 1
        return result != null ? result : {
            id: 3
        }
    }
    async createStore() {
        return await prisma.store.create({
            data: {
                created_by: 1,
                updated_by: 1,
                name: faker.internet.userName(),
                province_id: 1,
                city_id: 1,
                location: faker.internet.userName(),
                isActive: true
            }
        })
    }
    async createEmployee(storeId: number, roleId: number) {
        return await prisma.employee.create({
            data: {
                created_by: 1,
                updated_by: 1,
                name: faker.internet.userName(),
                username: simpleFaker.string.uuid(),
                password: "asdsa",
                store_id: storeId,
                roleId: roleId,
                token: faker.internet.userName(),
                isActive: true
            }
        })
    }

    async createMarket(storeId: number) {
        return await prisma.market.create({
            data: {
                created_by: 1,
                updated_by: 1,
                name: faker.internet.userName(),
                store_id: storeId,
                isActive: true
            }
        })
    }
    async createProduct() {
        return await prisma.product.create({
            data: {
                created_by: 1,
                updated_by: 1,
                name: faker.internet.userName(),
                code: simpleFaker.string.uuid(),
                type: 'Makanan',
                unit_id: 1,
                isActive: true
            }
        })
    }
    async createProductMarket(marketId: number, productId: number) {
        return await prisma.productMarket.create({
            data: {
                created_by: 1,
                updated_by: 1,
                market_id: marketId,
                price: 1000,
                product_id: productId,
                isActive: true
            }
        })
    }

}