import { Prisma, PrismaClient } from "@prisma/client";

export class DB {
  protected db = new PrismaClient({
    transactionOptions: {
      timeout: 60 * 60,
    },
  });

  protected resetDb(params: Prisma.PrismaClientOptions) {
    this.db = new PrismaClient(params);
  }
}
