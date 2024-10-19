/*
  Warnings:

  - You are about to drop the `Activityuser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Location` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Log` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Logstock` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Module` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Productstock` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Role` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Status` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Log" DROP CONSTRAINT "Log_activityuser_id_fkey";

-- DropForeignKey
ALTER TABLE "Log" DROP CONSTRAINT "Log_location_id_fkey";

-- DropForeignKey
ALTER TABLE "Logstock" DROP CONSTRAINT "Logstock_location_id_fkey";

-- DropForeignKey
ALTER TABLE "Logstock" DROP CONSTRAINT "Logstock_product_id_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Productstock" DROP CONSTRAINT "Productstock_location_id_fkey";

-- DropForeignKey
ALTER TABLE "Productstock" DROP CONSTRAINT "Productstock_product_id_fkey";

-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_location_id_fkey";

-- DropTable
DROP TABLE "Activityuser";

-- DropTable
DROP TABLE "Location";

-- DropTable
DROP TABLE "Log";

-- DropTable
DROP TABLE "Logstock";

-- DropTable
DROP TABLE "Module";

-- DropTable
DROP TABLE "Product";

-- DropTable
DROP TABLE "Productstock";

-- DropTable
DROP TABLE "Role";

-- DropTable
DROP TABLE "Status";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "user" (
    "id_user" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "location_id" INTEGER NOT NULL,

    CONSTRAINT "user_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "product" (
    "id_product" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "productname" TEXT NOT NULL,
    "cdproduct" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "product_pkey" PRIMARY KEY ("id_product")
);

-- CreateTable
CREATE TABLE "productstock" (
    "id_productstock" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "location_id" INTEGER NOT NULL,
    "stockproduct" INTEGER NOT NULL,
    "product_id" INTEGER NOT NULL,

    CONSTRAINT "productstock_pkey" PRIMARY KEY ("id_productstock")
);

-- CreateTable
CREATE TABLE "log" (
    "id_log" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "activityuser_id" INTEGER NOT NULL,
    "location_id" INTEGER NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "log_pkey" PRIMARY KEY ("id_log")
);

-- CreateTable
CREATE TABLE "logstock" (
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

    CONSTRAINT "logstock_pkey" PRIMARY KEY ("id_logstock")
);

-- CreateTable
CREATE TABLE "location" (
    "id_location" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "location_pkey" PRIMARY KEY ("id_location")
);

-- CreateTable
CREATE TABLE "activityuserstatus" (
    "id_activityuser" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "activityuser" TEXT NOT NULL,

    CONSTRAINT "activityuserstatus_pkey" PRIMARY KEY ("id_activityuser")
);

-- CreateTable
CREATE TABLE "status" (
    "id_status" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "status_pkey" PRIMARY KEY ("id_status")
);

-- CreateTable
CREATE TABLE "role" (
    "id_role" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "role" TEXT NOT NULL,

    CONSTRAINT "role_pkey" PRIMARY KEY ("id_role")
);

-- CreateTable
CREATE TABLE "module" (
    "id_module" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "module" TEXT NOT NULL,

    CONSTRAINT "module_pkey" PRIMARY KEY ("id_module")
);

-- CreateIndex
CREATE UNIQUE INDEX "user_username_key" ON "user"("username");

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "user_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "user"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productstock" ADD CONSTRAINT "productstock_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "productstock" ADD CONSTRAINT "productstock_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id_product") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "log" ADD CONSTRAINT "log_activityuser_id_fkey" FOREIGN KEY ("activityuser_id") REFERENCES "activityuserstatus"("id_activityuser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "log" ADD CONSTRAINT "log_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logstock" ADD CONSTRAINT "logstock_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logstock" ADD CONSTRAINT "logstock_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id_product") ON DELETE RESTRICT ON UPDATE CASCADE;
