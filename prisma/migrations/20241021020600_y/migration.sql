/*
  Warnings:

  - Added the required column `shoponline` to the `product` table without a default value. This is not possible if the table is not empty.
  - Added the required column `shoponlineactive` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "product" ADD COLUMN     "shoponline" BOOLEAN NOT NULL,
ADD COLUMN     "shoponlineactive" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "productstock" ADD COLUMN     "discon" DOUBLE PRECISION;
