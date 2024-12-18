/*
  Warnings:

  - You are about to drop the column `linkmodule` on the `employee` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "employee" DROP COLUMN "linkmodule";

-- CreateTable
CREATE TABLE "employeemodule" (
    "id_employeemodule" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "linkmodule_id" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "description" TEXT,
    "module_id" INTEGER NOT NULL,
    "employee_id" INTEGER NOT NULL,

    CONSTRAINT "employeemodule_pkey" PRIMARY KEY ("id_employeemodule")
);

-- AddForeignKey
ALTER TABLE "employeemodule" ADD CONSTRAINT "employeemodule_linkmodule_id_fkey" FOREIGN KEY ("linkmodule_id") REFERENCES "linkmodule"("id_linkmodule") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employeemodule" ADD CONSTRAINT "employeemodule_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "module"("id_module") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "employeemodule" ADD CONSTRAINT "employeemodule_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employee"("id_employee") ON DELETE RESTRICT ON UPDATE CASCADE;
