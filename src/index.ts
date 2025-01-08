import Elysia, { t } from "elysia";
import swagger from "@elysiajs/swagger";
import employee from "./routes/employee";
import { versionStore } from "./stores/versionStore";

new Elysia({ prefix: "/api" })
  .use(swagger())
  .use(versionStore)
  .use(employee)

  .get("/version", ({ store }) => store.version)

  .listen(process.env.PORT!, ({ hostname, port }) =>
    console.log(`Listening on ${hostname}:${port}`)
  );
