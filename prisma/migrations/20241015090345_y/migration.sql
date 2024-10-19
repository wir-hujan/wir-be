/*
  Warnings:

  - Added the required column `hargabeli` to the `productstock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `hargajual` to the `productstock` table without a default value. This is not possible if the table is not empty.
  - Added the required column `productstock_id` to the `purchase` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "productstock" ADD COLUMN     "hargabeli" INTEGER NOT NULL,
ADD COLUMN     "hargajual" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "purchase" ADD COLUMN     "productstockId_productstock" INTEGER,
ADD COLUMN     "productstock_id" JSONB NOT NULL;

-- AddForeignKey
ALTER TABLE "purchase" ADD CONSTRAINT "purchase_productstockId_productstock_fkey" FOREIGN KEY ("productstockId_productstock") REFERENCES "productstock"("id_productstock") ON DELETE SET NULL ON UPDATE CASCADE;
