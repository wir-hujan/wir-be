import { PrismaClient } from "@prisma/client";
import { Elysia, t } from "elysia";

const prisma = new PrismaClient();

export class h {
    async findEmployeeUsername(username: string) {
        return await prisma.employee.findFirst({
            select: {
                id: true,
                username: true,
                password: true,
                name: true,
                loginDevice: true,
                store_id: true,
            },
            where: {
                username,
            }
        })
    }
    async findEmployeeToken(dataToken: string) {
        return await prisma.employee.findFirst({
            select: {
                id: true,
                username: true,
                password: true,
                name: true,
                loginDevice: true,
                store_id: true,
            },
            where: {
                token: dataToken,
            }
        })
    }

    async updateTokenEmployee(username: string, token: string | null = null) {
        return await prisma.employee.update({
            where: {
                username,
            },
            data: {
                token
            }
        })
    }
}
