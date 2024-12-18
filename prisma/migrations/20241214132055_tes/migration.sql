/*
  Warnings:

  - You are about to drop the column `linkmodule` on the `role` table. All the data in the column will be lost.
  - Added the required column `module_id` to the `role` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "role" DROP COLUMN "linkmodule",
ADD COLUMN     "module_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "role" ADD CONSTRAINT "role_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "module"("id_module") ON DELETE RESTRICT ON UPDATE CASCADE;
