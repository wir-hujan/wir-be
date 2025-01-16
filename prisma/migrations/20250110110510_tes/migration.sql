/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `Employee` table. All the data in the column will be lost.
  - You are about to drop the column `employeeId` on the `EmployeeAccess` table. All the data in the column will be lost.
  - You are about to drop the column `submoduleId` on the `EmployeeAccess` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Market` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `Market` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `Market` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `Market` table. All the data in the column will be lost.
  - You are about to drop the column `storeId` on the `Market` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Market` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `Market` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `unitId` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `Product` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `storeId` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `ProductInformation` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `marketId` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `productId` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `ProductMarket` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `cityId` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `provinceId` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `Store` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `Unit` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `Unit` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Unit` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `Unit` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `createdAt` on the `submodule` table. All the data in the column will be lost.
  - You are about to drop the column `createdBy` on the `submodule` table. All the data in the column will be lost.
  - You are about to drop the column `deletedAt` on the `submodule` table. All the data in the column will be lost.
  - You are about to drop the column `deletedBy` on the `submodule` table. All the data in the column will be lost.
  - You are about to drop the column `moduleid` on the `submodule` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `submodule` table. All the data in the column will be lost.
  - You are about to drop the column `updatedBy` on the `submodule` table. All the data in the column will be lost.
  - Added the required column `employee_id` to the `EmployeeAccess` table without a default value. This is not possible if the table is not empty.
  - Added the required column `submodule_id` to the `EmployeeAccess` table without a default value. This is not possible if the table is not empty.
  - Added the required column `store_id` to the `Market` table without a default value. This is not possible if the table is not empty.
  - Added the required column `unit_id` to the `Product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `ProductInformation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `store_id` to the `ProductInformation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `market_id` to the `ProductMarket` table without a default value. This is not possible if the table is not empty.
  - Added the required column `product_id` to the `ProductMarket` table without a default value. This is not possible if the table is not empty.
  - Added the required column `city_id` to the `Store` table without a default value. This is not possible if the table is not empty.
  - Added the required column `province_id` to the `Store` table without a default value. This is not possible if the table is not empty.
  - Added the required column `module_id` to the `submodule` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "EmployeeAccess" DROP CONSTRAINT "EmployeeAccess_employeeId_fkey";

-- DropForeignKey
ALTER TABLE "Market" DROP CONSTRAINT "Market_storeId_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_unitId_fkey";

-- DropForeignKey
ALTER TABLE "ProductInformation" DROP CONSTRAINT "ProductInformation_productId_fkey";

-- DropForeignKey
ALTER TABLE "ProductInformation" DROP CONSTRAINT "ProductInformation_storeId_fkey";

-- DropForeignKey
ALTER TABLE "ProductMarket" DROP CONSTRAINT "ProductMarket_marketId_fkey";

-- DropForeignKey
ALTER TABLE "ProductMarket" DROP CONSTRAINT "ProductMarket_productId_fkey";

-- AlterTable
ALTER TABLE "Employee" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "EmployeeAccess" DROP COLUMN "employeeId",
DROP COLUMN "submoduleId",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "employee_id" INTEGER NOT NULL,
ADD COLUMN     "submodule_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "Market" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "storeId",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "store_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "Product" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "unitId",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "unit_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "ProductInformation" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "productId",
DROP COLUMN "storeId",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "product_id" INTEGER NOT NULL,
ADD COLUMN     "store_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "ProductMarket" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "marketId",
DROP COLUMN "productId",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "market_id" INTEGER NOT NULL,
ADD COLUMN     "product_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "Role" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "Store" DROP COLUMN "cityId",
DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "provinceId",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "city_id" INTEGER NOT NULL,
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "province_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "Unit" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "module" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AlterTable
ALTER TABLE "submodule" DROP COLUMN "createdAt",
DROP COLUMN "createdBy",
DROP COLUMN "deletedAt",
DROP COLUMN "deletedBy",
DROP COLUMN "moduleid",
DROP COLUMN "updatedAt",
DROP COLUMN "updatedBy",
ADD COLUMN     "created_at" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "created_by" INTEGER,
ADD COLUMN     "deleted_at" TIMESTAMP(3),
ADD COLUMN     "deleted_by" INTEGER,
ADD COLUMN     "module_id" INTEGER NOT NULL,
ADD COLUMN     "updated_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updated_by" INTEGER;

-- AddForeignKey
ALTER TABLE "Market" ADD CONSTRAINT "Market_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductMarket" ADD CONSTRAINT "ProductMarket_market_id_fkey" FOREIGN KEY ("market_id") REFERENCES "Market"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductMarket" ADD CONSTRAINT "ProductMarket_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_unit_id_fkey" FOREIGN KEY ("unit_id") REFERENCES "Unit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductInformation" ADD CONSTRAINT "ProductInformation_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProductInformation" ADD CONSTRAINT "ProductInformation_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "Store"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmployeeAccess" ADD CONSTRAINT "EmployeeAccess_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "Employee"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
