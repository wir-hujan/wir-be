import { Elysia, t } from "elysia";
import { swagger } from "@elysiajs/swagger";
import { PrismaClient } from "@prisma/client";
import { Pool } from "pg";
import { jwt } from "@elysiajs/jwt";
import { seed } from "./seed";
import { auth } from "./auth";
import { product } from "./product/product";

// import { logstock } from "./stock/logstock";
const prisma = new PrismaClient();
const client = new Pool({
  connectionString: process.env.DATABASE_URL,
});

const app = new Elysia()
  .use(swagger())
  .use(seed)
  .use(auth)
  .use(product)
  .listen(8000);

console.log(
  `🦊 Elysia is running at ${app.server?.hostname}:${app.server?.port}`
);
