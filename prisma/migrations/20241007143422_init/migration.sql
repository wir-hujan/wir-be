/*
  Warnings:

  - The primary key for the `Product` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_produk` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `kdproduk` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `produk` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the `Logstok` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Productstok` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `cdproduct` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productname` to the `Product` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Logstok" DROP CONSTRAINT "Logstok_location_id_fkey";

-- DropForeignKey
ALTER TABLE "Logstok" DROP CONSTRAINT "Logstok_produk_id_fkey";

-- DropForeignKey
ALTER TABLE "Productstok" DROP CONSTRAINT "Productstok_location_id_fkey";

-- DropForeignKey
ALTER TABLE "Productstok" DROP CONSTRAINT "Productstok_produk_id_fkey";

-- AlterTable
ALTER TABLE "Product" DROP CONSTRAINT "Product_pkey",
DROP COLUMN "id_produk",
DROP COLUMN "kdproduk",
DROP COLUMN "produk",
ADD COLUMN     "cdproduct" TEXT NOT NULL,
ADD COLUMN     "id_product" SERIAL NOT NULL,
ADD COLUMN     "productname" TEXT NOT NULL,
ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("id_product");

-- DropTable
DROP TABLE "Logstok";

-- DropTable
DROP TABLE "Productstok";

-- CreateTable
CREATE TABLE "Productstock" (
    "id_productstock" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "location_id" INTEGER NOT NULL,
    "stockproduct" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "Productstock_pkey" PRIMARY KEY ("id_productstock")
);

-- CreateTable
CREATE TABLE "Logstock" (
    "id_logstock" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "location_id" INTEGER NOT NULL,
    "stockstart" INTEGER NOT NULL,
    "stockend" INTEGER NOT NULL,
    "in" INTEGER NOT NULL,
    "out" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "Logstock_pkey" PRIMARY KEY ("id_logstock")
);

-- AddForeignKey
ALTER TABLE "Productstock" ADD CONSTRAINT "Productstock_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Productstock" ADD CONSTRAINT "Productstock_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id_product") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Logstock" ADD CONSTRAINT "Logstock_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Logstock" ADD CONSTRAINT "Logstock_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id_product") ON DELETE RESTRICT ON UPDATE CASCADE;
