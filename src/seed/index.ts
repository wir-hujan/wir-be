import { Elysia, t } from "elysia";
import { PrismaClient } from "@prisma/client";
import { faker } from "@faker-js/faker";
import { Pool } from "pg";

const client = new Pool({
  connectionString: process.env.DATABASE_URL,
});
import { logstock } from "./../product/logstock";

const prisma = new PrismaClient();
// class seed {
//   constructor(public data: string[] = ["Moonhalo"]) {}
// }
export const seed = new Elysia().get("/dummy", async () => {
  await prisma.module.createMany({
    data: [
      {
        module: "dashboard admin",
        statusenabled: true,
      }
    ],
  });
  const module = await client.query(
    "select id_module,module from module"
  );
  await prisma.linkmodule.createMany({
    data: [
      {
        module_id: module.rows[0].id_module,
        url: "/module/admin",
        description: "ini dashboard admin",
        submodule: "Pembuatan Produk",
        statusenabled: true,
      }
    ],
  });
  const linkmodule = await client.query(
    "select lm.id_linkmodule, lm.module_id, m.module, lm.url, lm.description from linkmodule as lm join module as m on m.id_module = lm.module_id"
  );

  const status = await prisma.status.createMany({
    data: [
      {
        status: "Tidak ada tindakan",
        statusenabled: true,
      },
      {
        status: "Pending",
        statusenabled: true,
      },
      {
        status: "Selesai",
        statusenabled: true,
      },
      {
        status: "Verif",
        statusenabled: true,
      },
      {
        status: "Kofirmasi",
        statusenabled: true,
      },
      {
        status: "Final",
        statusenabled: true,
      },
    ],
  });


  await prisma.role.createMany({
    data: [
      {
        role: "Super Admin",
        statusenabled: true,
        module_id: 1
        // linkmodule: [{
        //   id_linkmodule: linkmodule.rows[0].id_linkmodule,
        //   module_id: linkmodule.rows[0].module_id,
        //   module: linkmodule.rows[0].module,
        //   submodule: linkmodule.rows[0].submodule,
        //   url: linkmodule.rows[0].url,
        //   description: linkmodule.rows[0].description,
        // }]
      },
    ],
  });
  const role = await client.query(
    "select id_role,role,linkmodule from role"
  );
  await prisma.unit.createMany({
    data: [
      {
        unit: "PCS",
        statusenabled: true,
      },
    ],
  });
  const unitData = await client.query(
    "select id_unit,unit from unit"
  );
  await prisma.wherepurchase.createMany({
    data: [
      {
        market: "Toko abang",
        description: "Deket toko ibu",
        statusenabled: true,
      },
    ],
  });
  const wherepurchase = await client.query(
    "select id_wherepurchase,market,description from wherepurchase"
  );

  const activityemployee = await prisma.activityemployee.createMany({
    data: [
      {
        activityemployee: "Pembuatan produk",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Update produk",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Hapus produk",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Menambahkan stok",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Mengurangi stok",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Menambah lokasi",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Menghapus lokasi",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Membuat module",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Menghapus module",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Menambah employee baru",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Update employee",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Update employee oleh",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
      {
        activityemployee: "Non-aktifkan employee",
        statusenabled: true,
        module_id: module.rows[0].id_module,
      },
    ],
  });
  for (let i = 0; i < 10000; i++) {
    const location = await prisma.location.create({
      data: {
        location: faker.address.city(),
        statusenabled: true,
      },
    });

    const employee = await prisma.employee.create({
      data: {
        employeename: faker.internet.userName(),
        password: faker.internet.password(),
        fullname: faker.internet.userName(),
        statusenabled: true,
        location_id: location.id_location,
        role_id: role.rows[0].id_role
        // linkmodule: [{
        //   id_linkmodule: linkmodule.rows[0].id_linkmodule,
        //   module_id: linkmodule.rows[0].module_id,
        //   module: linkmodule.rows[0].module,
        //   submodule: linkmodule.rows[0].submodule,
        //   url: linkmodule.rows[0].url,
        //   description: linkmodule.rows[0].description,
        // }]
      },
    });

    // Create related products
    const product1 = await prisma.product.create({
      data: {
        productname: faker.commerce.productName(), // Random product name
        cdproduct: faker.internet.password(), // Generate unique product code
        statusenabled: true,
        employee_id: employee.id_employee, // Relasi ke User
        unit_id: unitData.rows[0].id_unit
      },
    });
    const product2 = await prisma.product.create({
      data: {
        productname: faker.commerce.productName(), // Random product name
        cdproduct: faker.internet.password(), // Generate unique product code
        statusenabled: true,
        employee_id: employee.id_employee, // Relasi ke User
        unit_id: unitData.rows[0].id_unit
      },
    });

    const productstock1 = await prisma.productstock.create({
      data: {
        statusenabled: true,
        stockproduct: 10,
        product_id: product1.id_product,
        location_id: location.id_location,
        howbuy: 500,
        howsold: 1000,
        wherepurchase_id: wherepurchase.rows[0].id_wherepurchase
      },
    });

    const stockproduct = await client.query(
      "select coalesce(sum(stockproduct), 0) as stock from productstock where statusenabled = true and location_id = $1 and product_id = $2",
      [location.id_location, product1.id_product]
    );

    // Mengambil nilai stock dari hasil query
    const currentStock = parseInt(stockproduct.rows[0].stock);

    await logstock({
      stockstart: currentStock - 10, // Memulai dengan stok yang ada
      in: 10,
      out: 0,
      stockend: currentStock,
      product_id: product1.id_product,
      location_id: location.id_location,
      employee_id: employee.id_employee,
    });
    const productstock2 = await prisma.productstock.create({
      data: {
        statusenabled: true,
        stockproduct: 10,
        product_id: product1.id_product,
        location_id: location.id_location,
        howbuy: 500,
        howsold: 1000,
        wherepurchase_id: wherepurchase.rows[0].id_wherepurchase
      },
    });

    const stockproduct2 = await client.query(
      "select coalesce(sum(stockproduct), 0) as stock from productstock where statusenabled = true and location_id = $1 and product_id = $2",
      [location.id_location, product1.id_product]
    );

    // Mengambil nilai stock dari hasil query
    const currentStock2 = parseInt(stockproduct2.rows[0].stock);
    await logstock({
      stockstart: currentStock2 - 10, // Memulai dengan stok yang ada
      in: 10,
      out: 0,
      stockend: currentStock2,
      product_id: product1.id_product,
      location_id: location.id_location,
      employee_id: employee.id_employee,
    });

    const productstock3 = await prisma.productstock.create({
      data: {
        statusenabled: true,
        stockproduct: 10,
        product_id: product2.id_product,
        location_id: location.id_location,
        howbuy: 500,
        howsold: 1000,
        wherepurchase_id: wherepurchase.rows[0].id_wherepurchase
      },
    });

    const stockproduct3 = await client.query(
      "select coalesce(sum(stockproduct), 0) as stock from productstock where statusenabled = true and location_id = $1 and product_id = $2",
      [location.id_location, product2.id_product]
    );

    // Mengambil nilai stock dari hasil query
    const currentStock3 = parseInt(stockproduct3.rows[0].stock);

    await logstock({
      stockstart: currentStock3 - 10, // Memulai dengan stok yang ada
      in: 10,
      out: 0,
      stockend: currentStock3,
      product_id: product2.id_product,
      location_id: location.id_location,
      employee_id: employee.id_employee,
    });
    const productstock4 = await prisma.productstock.create({
      data: {
        statusenabled: true,
        stockproduct: 10,
        product_id: product2.id_product,
        location_id: location.id_location,
        howbuy: 500,
        howsold: 1000,
        wherepurchase_id: wherepurchase.rows[0].id_wherepurchase
      },
    });
    const stockproduct4 = await client.query(
      "select coalesce(sum(stockproduct), 0) as stock from productstock where statusenabled = true and location_id = $1 and product_id = $2",
      [location.id_location, product2.id_product]
    );

    // Mengambil nilai stock dari hasil query
    const currentStock4 = parseInt(stockproduct4.rows[0].stock);

    await logstock({
      stockstart: currentStock4 - 10, // Memulai dengan stok yang ada
      in: 10,
      out: 0,
      stockend: currentStock4,
      product_id: product2.id_product,
      location_id: location.id_location,
      employee_id: employee.id_employee,
    });
  }
});
