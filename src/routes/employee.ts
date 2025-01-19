import Elysia, { t } from "elysia";
import { EmployeeService } from "../services/employee.service";

const employee = new Elysia({ prefix: "/employee" })
  .decorate("employeeService", new EmployeeService())

  .get("/", ({ employeeService, query }) => employeeService.paginate(query), {
    query: t.Optional(
      t.Object({
        search: t.String(),
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
        id: t.Number(),
      }),
    }
  )

  .post("/", ({ employeeService, body }) => employeeService.create(body), {
    body: t.Object({
      name: t.String(),
      username: t.String(),
      password: t.String(),
      store_id: t.Number(),
      role_id: t.Number(),
    }),
  })

  .patch(
    "/:id",
    ({ employeeService, body, params: { id } }) =>
      employeeService.update(id, body),
    {
      params: t.Object({
        id: t.Number(),
      }),
      body: t.Object({
        name: t.Optional(t.String()),
        username: t.Optional(t.String()),
        password: t.Optional(t.String()),
        store_id: t.Optional(t.Number()),
        role_id: t.Optional(t.Number()),
      }),
    }
  )

  .delete(
    "/:id",
    ({ employeeService, params: { id } }) => employeeService.destroy(id),
    {
      params: t.Object({
        id: t.Number(),
      }),
    }
  );
export default employee;
