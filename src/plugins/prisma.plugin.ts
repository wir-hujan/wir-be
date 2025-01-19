import { Prisma as Base, PrismaClient } from "@prisma/client";
import {
  DbPaginationQuery,
  DbPaginationRawResponse,
  DbResponseInfo,
} from "../interfaces/general/db.interface";

export class PrismaPlugin {
  protected db = new PrismaClient({
    transactionOptions: {
      timeout: 60,
    },
  }).$extends({
    model: {
      $allModels: {
        async paginate<T>(
          this: T,
          paginationParams?: Omit<DbPaginationQuery, "search">,
          where?: Base.Args<T, "findMany">["where"]
        ) {
          const newPaginationParams = {
            page: paginationParams?.page || 1,
            size: paginationParams?.size || 15,
          };
          const context = Base.getExtensionContext(this) as any;

          const total: number = await context.count(where);
          const data = await context.findMany({
            skip: (newPaginationParams.page - 1) * newPaginationParams.size,
            take: newPaginationParams.size,
            where,
          });

          const totalPage = Math.ceil(total / newPaginationParams.size);
          const offsetStart =
            newPaginationParams.size * newPaginationParams.page -
            (newPaginationParams.size - 1);
          const offsetEnd =
            offsetStart +
            (total - offsetStart >= newPaginationParams.size
              ? newPaginationParams.size - 1
              : total - offsetStart);

          return {
            meta: {
              page: {
                current: newPaginationParams.page,
                total: totalPage,
                size: newPaginationParams.size,
              },
              data: {
                total,
                offsetStart,
                offsetEnd,
              },
              has_next: totalPage > newPaginationParams.page,
              has_prev: newPaginationParams.page > 1,
            },
            data,
          } as DbPaginationRawResponse;
        },
      },
    },
  });

  public responsePagination(
    { meta, data }: DbPaginationRawResponse,
    info?: DbResponseInfo
  ) {
    return {
      message: info?.message || "Success",
      meta,
      data,
    };
  }

  public responseData(data: any, info?: DbResponseInfo) {
    return {
      message: info?.message || "Success",
      data,
    };
  }

  public responseNoData(info?: DbResponseInfo) {
    return {
      message: info?.message || "Success",
    };
  }
}
