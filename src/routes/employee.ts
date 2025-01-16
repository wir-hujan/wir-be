import Elysia, { t } from "elysia";
import { FormatHook } from "../hooks/formatHook";
import { EmployeeService } from "../services/employee.service";

const employee = new Elysia({ prefix: "/employee" })
  .decorate("employeeService", new EmployeeService())
  .decorate("format", new FormatHook())

  .get("/", ({ employeeService, query }) => employeeService.paginate(query), {
    query: t.Optional(
      t.Object({
        page: t.Number(),
        size: t.Number(),
      })
    ),
  })

  .get(
    "/:id",
    ({ employeeService, params: { id } }) => employeeService.get(id),
    {
      params: t.Object({
        id: t.Number({
          error: "id harus number",
        }),
      }),
    }
  );

  // .post(
  //   "/",
  //   ({ employeeService, body }) =>
  //     employeeService.create({
  //       ...body,
  //     }),
  //   {
  //     body: t.Object({
  //       name: t.String(),
  //       username: t.String(),
  //       password: t.String(),
  //     }),
  //   }
  // );

export default employee;
