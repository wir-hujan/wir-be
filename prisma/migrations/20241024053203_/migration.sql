/*
  Warnings:

  - You are about to drop the column `module` on the `employee` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `url` on the `module` table. All the data in the column will be lost.
  - You are about to drop the column `module` on the `role` table. All the data in the column will be lost.
  - Added the required column `module_id` to the `activityemployee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `linkmodule` to the `employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `data` to the `log` table without a default value. This is not possible if the table is not empty.
  - Added the required column `linkmodule` to the `role` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "activityemployee" ADD COLUMN     "module_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "employee" DROP COLUMN "module",
ADD COLUMN     "linkmodule" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "log" ADD COLUMN     "data" JSONB NOT NULL;

-- AlterTable
ALTER TABLE "module" DROP COLUMN "description",
DROP COLUMN "url";

-- AlterTable
ALTER TABLE "role" DROP COLUMN "module",
ADD COLUMN     "linkmodule" JSONB NOT NULL;

-- CreateTable
CREATE TABLE "linkmodule" (
    "id_module" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "submodule" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "description" TEXT,
    "module_id" INTEGER NOT NULL,

    CONSTRAINT "linkmodule_pkey" PRIMARY KEY ("id_module")
);

-- AddForeignKey
ALTER TABLE "activityemployee" ADD CONSTRAINT "activityemployee_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "module"("id_module") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "linkmodule" ADD CONSTRAINT "linkmodule_module_id_fkey" FOREIGN KEY ("module_id") REFERENCES "module"("id_module") ON DELETE RESTRICT ON UPDATE CASCADE;
