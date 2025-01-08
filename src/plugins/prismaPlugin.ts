import { Prisma as Base, PrismaClient } from "@prisma/client";
import { ResponsePagination } from "../interfaces/response";

type PaginationPayload = Required<Pick<ResponsePagination, "page" | "size">>;

export class PrismaPlugin {
  public db = new PrismaClient({
    transactionOptions: {
      timeout: 60,
    },
  });

  public resetDb(params: Base.PrismaClientOptions) {
    this.db = new PrismaClient(params);
  }

  public createPaginationParams(params: PaginationPayload) {
    return {
      skip: (params.page - 1) * params.size,
      take: params.size,
    };
  }
}
