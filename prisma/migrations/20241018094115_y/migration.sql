/*
  Warnings:

  - You are about to drop the column `hargabeli` on the `productstock` table. All the data in the column will be lost.
  - You are about to drop the column `hargajual` on the `productstock` table. All the data in the column will be lost.
  - You are about to drop the column `productstock` on the `purchase` table. All the data in the column will be lost.
  - You are about to drop the column `statusenabled` on the `token` table. All the data in the column will be lost.
  - Added the required column `module` to the `employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `role_id` to the `employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `activityemployee_id` to the `logstock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `module` table without a default value. This is not possible if the table is not empty.
  - Added the required column `url` to the `module` table without a default value. This is not possible if the table is not empty.
  - Added the required column `unit_id` to the `product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `howbuy` to the `productstock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `howsold` to the `productstock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employee_id` to the `purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productstock_id` to the `purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `qty` to the `purchase` table without a default value. This is not possible if the table is not empty.
  - Added the required column `module` to the `role` table without a default value. This is not possible if the table is not empty.
  - Added the required column `descriptionborrow` to the `sale` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isborrow` to the `sale` table without a default value. This is not possible if the table is not empty.
  - Added the required column `qty` to the `sale` table without a default value. This is not possible if the table is not empty.
  - Added the required column `code` to the `status` table without a default value. This is not possible if the table is not empty.
  - Added the required column `employee_id` to the `token` table without a default value. This is not possible if the table is not empty.
  - Added the required column `information` to the `token` table without a default value. This is not possible if the table is not empty.
  - Added the required column `description` to the `wherepurchase` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "employee" ADD COLUMN     "module" JSONB NOT NULL,
ADD COLUMN     "role_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "log" ALTER COLUMN "description" DROP NOT NULL;

-- AlterTable
ALTER TABLE "logstock" ADD COLUMN     "activityemployee_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "module" ADD COLUMN     "description" TEXT NOT NULL,
ADD COLUMN     "url" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "product" ADD COLUMN     "unit_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "productstock" DROP COLUMN "hargabeli",
DROP COLUMN "hargajual",
ADD COLUMN     "howbuy" INTEGER NOT NULL,
ADD COLUMN     "howsold" INTEGER NOT NULL,
ADD COLUMN     "ppn" DOUBLE PRECISION;

-- AlterTable
ALTER TABLE "purchase" DROP COLUMN "productstock",
ADD COLUMN     "employee_id" INTEGER NOT NULL,
ADD COLUMN     "productstock_id" INTEGER NOT NULL,
ADD COLUMN     "qty" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "role" ADD COLUMN     "module" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "sale" ADD COLUMN     "descriptionborrow" TEXT NOT NULL,
ADD COLUMN     "isborrow" BOOLEAN NOT NULL,
ADD COLUMN     "qty" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "status" ADD COLUMN     "code" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "token" DROP COLUMN "statusenabled",
ADD COLUMN     "employee_id" INTEGER NOT NULL,
ADD COLUMN     "information" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "wherepurchase" ADD COLUMN     "description" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "unexpectedload" (
    "id_unexpectedload" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "how" INTEGER NOT NULL,
    "product_id" INTEGER,
    "qty" INTEGER,

    CONSTRAINT "unexpectedload_pkey" PRIMARY KEY ("id_unexpectedload")
);

-- CreateTable
CREATE TABLE "unit" (
    "id_unit" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "unit" TEXT NOT NULL,

    CONSTRAINT "unit_pkey" PRIMARY KEY ("id_unit")
);

-- AddForeignKey
ALTER TABLE "employee" ADD CONSTRAINT "employee_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "role"("id_role") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product" ADD CONSTRAINT "product_unit_id_fkey" FOREIGN KEY ("unit_id") REFERENCES "unit"("id_unit") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logstock" ADD CONSTRAINT "logstock_activityemployee_id_fkey" FOREIGN KEY ("activityemployee_id") REFERENCES "activityemployeestatus"("id_activityemployee") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "token" ADD CONSTRAINT "token_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id_employee") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id_employee") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_productstock_id_fkey" FOREIGN KEY ("productstock_id") REFERENCES "productstock"("id_productstock") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "unexpectedload" ADD CONSTRAINT "unexpectedload_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id_product") ON DELETE SET NULL ON UPDATE CASCADE;
