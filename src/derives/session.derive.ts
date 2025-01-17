import Elysia from "elysia";

export const session = new Elysia().derive(({ cookie }) => ({
  session: cookie,
}));
