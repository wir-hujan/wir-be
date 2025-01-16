/*
  Warnings:

  - You are about to drop the column `moduleId` on the `submodule` table. All the data in the column will be lost.
  - Added the required column `moduleid` to the `submodule` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "submodule" DROP COLUMN "moduleId",
ADD COLUMN     "moduleid" INTEGER NOT NULL;
