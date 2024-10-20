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
  const role = await prisma.role.createMany({
    data: [
      {
        role: "Super Admin",
        statusenabled: true,
      },
      {
        role: "Admin",
        statusenabled: true,
      },
      {
        role: "Pegawai",
        statusenabled: true,
      },
    ],
  });
  const activityemployee = await prisma.activityemployeestatus.createMany({
    data: [
      {
        activityemployee: "Pembuatan produk",
        statusenabled: true,
      },
      {
        activityemployee: "Update produk",
        statusenabled: true,
      },
      {
        activityemployee: "Hapus produk",
        statusenabled: true,
      },
      {
        activityemployee: "Menambahkan stok",
        statusenabled: true,
      },
      {
        activityemployee: "Mengurangi stok",
        statusenabled: true,
      },
      {
        activityemployee: "Menambah lokasi",
        statusenabled: true,
      },
      {
        activityemployee: "Menghapus lokasi",
        statusenabled: true,
      },
      {
        activityemployee: "Membuat module",
        statusenabled: true,
      },
      {
        activityemployee: "Menghapus module",
        statusenabled: true,
      },
      {
        activityemployee: "Menambah employee baru",
        statusenabled: true,
      },
      {
        activityemployee: "Update employee",
        statusenabled: true,
      },
      {
        activityemployee: "Update employee oleh",
        statusenabled: true,
      },
      {
        activityemployee: "Non-aktifkan employee",
        statusenabled: true,
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
      },
    });

    // Create related products
    const product1 = await prisma.product.create({
      data: {
        productname: faker.commerce.productName(), // Random product name
        cdproduct: faker.internet.password(), // Generate unique product code
        statusenabled: true,
        employee_id: employee.id_employee, // Relasi ke User
      },
    });
    const product2 = await prisma.product.create({
      data: {
        productname: faker.commerce.productName(), // Random product name
        cdproduct: faker.internet.password(), // Generate unique product code
        statusenabled: true,
        employee_id: employee.id_employee, // Relasi ke User
      },
    });

    const productstock1 = await prisma.productstock.create({
      data: {
        statusenabled: true,
        stockproduct: 10,
        product_id: product1.id_product,
        location_id: location.id_location,
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
