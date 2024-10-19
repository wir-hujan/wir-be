/*
  Warnings:

  - You are about to drop the column `productstockId_productstock` on the `purchase` table. All the data in the column will be lost.
  - You are about to drop the column `productstock_id` on the `purchase` table. All the data in the column will be lost.
  - Added the required column `productstock` to the `purchase` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "purchase" DROP CONSTRAINT "purchase_productstockId_productstock_fkey";

-- AlterTable
ALTER TABLE "purchase" DROP COLUMN "productstockId_productstock",
DROP COLUMN "productstock_id",
ADD COLUMN     "productstock" JSONB NOT NULL;
