import { Prisma } from "@prisma/client";
import { PrismaPlugin } from "../plugins/prisma.plugin";
import { DbPaginationQuery } from "../interfaces/general/db.interface";

export class EmployeeService extends PrismaPlugin {
  private employee = this.db.employee;

  public async paginate(pagination: DbPaginationQuery) {
    return this.responsePagination(
      await this.employee.paginate(
        {
          page: pagination?.page,
          size: pagination?.size,
        },
        {
          name: {
            contains: pagination?.search,
          },
        }
      ),

      { message: "Employee berhasil diambil" }
    );
  }

  public async get(id: number) {
    return this.responseData(
      await this.employee.findUniqueOrThrow({ where: { id } }),
      { message: "Employee berhasil diambil" }
    );
  }

  public async create(data: Prisma.EmployeeCreateArgs["data"]) {
    return this.responseData(
      await this.employee.create({
        data,
      }),
      { message: "Employee berhasil dibuat" }
    );
  }

  public async update(id: number, data: Prisma.EmployeeUpdateArgs["data"]) {
    return this.responseData(
      this.employee.update({
        where: { id },
        data,
      }),
      { message: "Employee berhasil diupdate" }
    );
  }

  public async destroy(id: number) {
    await this.employee.delete({ where: { id } });
    return this.responseNoData({ message: "Employee berhasil dihapus" });
  }
}
