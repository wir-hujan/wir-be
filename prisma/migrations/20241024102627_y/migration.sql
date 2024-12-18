/*
  Warnings:

  - The primary key for the `linkmodule` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_module` on the `linkmodule` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "linkmodule" DROP CONSTRAINT "linkmodule_pkey",
DROP COLUMN "id_module",
ADD COLUMN     "id_linkmodule" SERIAL NOT NULL,
ADD CONSTRAINT "linkmodule_pkey" PRIMARY KEY ("id_linkmodule");
