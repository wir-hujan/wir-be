/*
  Warnings:

  - Added the required column `employee_id` to the `log` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "log" ADD COLUMN     "employee_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "log" ADD CONSTRAINT "log_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id_employee") ON DELETE RESTRICT ON UPDATE CASCADE;
