import { ResponsePagination } from "../interfaces/response";
import { PrismaPlugin } from "../plugins/prismaPlugin";

export class EmployeeService extends PrismaPlugin {
  private employee = this.db.employee;

  public paginate(where?: ResponsePagination) {
    let params = {};

    if (where?.page && where?.size) {
      params = this.createPaginationParams({
        page: where.page,
        size: where.size,
      });
    }

    return this.employee.findMany(params);
  }

  public get(id: number) {
    return this.employee.findUniqueOrThrow({ where: { id } });
  }

  // public create(data: { name: string; username: string; password: string }) {
  //   return this.employee.create({
  //     data,
  //   });
  // }

  // public update(id: number, data: Employee) {
  //   return this.employee.update({
  //     where: { id },
  //     data,
  //   });
  // }

  // public destroy(id: number) {
  //   return this.employee.delete({ where: { id } });
  // }
}
