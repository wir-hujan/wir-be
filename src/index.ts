import { Elysia, t } from "elysia";
import swagger from "@elysiajs/swagger";
import employee from "./routes/employee";
import { versionStore } from "./stores/versionStore";
import { seed } from "./routes/seed";

const app = new Elysia({ prefix: "/api" })
  // .use(swagger())
  // .use(versionStore)
  // .use(employee)
  .use(seed)
  // .get("/version", ({ store }) => store.version)

  .listen(process.env.PORT!, ({ hostname, port }) =>
    console.log(`🦊 Listening on ${hostname}:${port}`)
  );