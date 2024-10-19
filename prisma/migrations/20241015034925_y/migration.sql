/*
  Warnings:

  - Added the required column `wherepurchase_id` to the `productstock` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "productstock" ADD COLUMN     "wherepurchase_id" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "wherepurchase" (
    "id_wherepurchase" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "market" TEXT NOT NULL,

    CONSTRAINT "wherepurchase_pkey" PRIMARY KEY ("id_wherepurchase")
);

-- AddForeignKey
ALTER TABLE "productstock" ADD CONSTRAINT "productstock_wherepurchase_id_fkey" FOREIGN KEY ("wherepurchase_id") REFERENCES "wherepurchase"("id_wherepurchase") ON DELETE RESTRICT ON UPDATE CASCADE;
