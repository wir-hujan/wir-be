/*
  Warnings:

  - Added the required column `isActive` to the `EmployeeAccess` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isActive` to the `Module` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isActive` to the `ProductMarket` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isActive` to the `Role` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isActive` to the `Store` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isActive` to the `Submodule` table without a default value. This is not possible if the table is not empty.
  - Added the required column `isActive` to the `Unit` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "EmployeeAccess" ADD COLUMN     "isActive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "Module" ADD COLUMN     "isActive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "ProductMarket" ADD COLUMN     "isActive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "Role" ADD COLUMN     "isActive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "Store" ADD COLUMN     "isActive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "Submodule" ADD COLUMN     "isActive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "Unit" ADD COLUMN     "isActive" BOOLEAN NOT NULL;
