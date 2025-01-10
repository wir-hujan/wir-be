import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";
import { faker, simpleFaker } from "@faker-js/faker";
import { integer } from "aws-sdk/clients/cloudfront";

const prisma = new PrismaClient();

export class dummy {
    async createRole() {
        const result = await prisma.role.findMany();
        if (result.length == 0) {
            await prisma.role.createMany({
                data: [
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'SuperAdmin',
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Admin Cabang',
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Cabang',
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
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Penjualan',
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Produk',
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Suplier',
                        isActive: true
                    }
                ]
            })
        }
    }
    async createSubModule() {
        const result = await prisma.subModule.findMany();
        if (result.length == 0) {
            await prisma.subModule.createMany({
                data: [
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Input Jual',
                        url: '/module/jual',
                        module_id: 1,
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Input suplier',
                        url: '/module/jual',
                        module_id: 3,
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Input Produk',
                        url: '/module/jual',
                        module_id: 2,
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Data Produk',
                        url: '/module/jual',
                        module_id: 2,
                        isActive: true
                    },
                    {
                        createdBy: 1,
                        updatedBy: 1,
                        name: 'Data suplier',
                        url: '/module/jual',
                        module_id: 3,
                        isActive: true
                    },

                ]
            })
        }
    }
    async createUserAccess(userId: number) {
        const result = await prisma.userAccess.findMany();
        if (result.length == 0) {
            await prisma.userAccess.create({
                data: {
                    user_id: userId,
                    submodule_id: 1,
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
                isActive: true
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
                createdBy: 1,
                updatedBy: 1,
                name: faker.internet.userName(),
                province_id: faker.internet.userName(),
                city_id: faker.internet.userName(),
                location: faker.internet.userName(),
                isActive: true
            }
        })
    }
    async createEmployee(storeId: number, roleId: number) {
        return await prisma.employee.create({
            data: {
                createdBy: 1,
                updatedBy: 1,
                name: faker.internet.userName(),
                username: simpleFaker.string.uuid(),
                password: faker.internet.userName(),
                store_id: storeId,
                role_id: roleId,
                token: faker.internet.userName(),
                isActive: true
            }
        })
    }

    async createMarket(storeId: number) {
        return await prisma.market.create({
            data: {
                createdBy: 1,
                updatedBy: 1,
                name: faker.internet.userName(),
                store_id: storeId,
                isActive: true
            }
        })
    }
    async createProduct(storeId: number) {
        return await prisma.product.create({
            data: {
                createdBy: 1,
                updatedBy: 1,
                name: faker.internet.userName(),
                code: simpleFaker.string.uuid(),
                type: 'Makanan',
                unit_id: "botol",
                isActive: true
            }
        })
    }
    async createProductMarket(marketId: number, productId: number) {
        return await prisma.productMarket.create({
            data: {
                createdBy: 1,
                updatedBy: 1,
                market_id: marketId,
                price: 1000,
                product_id: productId,
                isActive: true
            }
        })
    }

}