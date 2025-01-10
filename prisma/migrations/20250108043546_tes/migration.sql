/*
  Warnings:

  - Added the required column `module_id` to the `SubModule` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "SubModule" ADD COLUMN     "module_id" INTEGER NOT NULL;
