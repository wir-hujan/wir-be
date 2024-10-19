/*
  Warnings:

  - You are about to drop the column `username` on the `employee` table. All the data in the column will be lost.
  - You are about to drop the column `activityuser_id` on the `log` table. All the data in the column will be lost.
  - You are about to drop the `activityuserstatus` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[employeename]` on the table `employee` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `employeename` to the `employee` table without a default value. This is not possible if the table is not empty.
  - Added the required column `activityemployee_id` to the `log` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "log" DROP CONSTRAINT "log_activityuser_id_fkey";

-- DropIndex
DROP INDEX "employee_username_key";

-- AlterTable
ALTER TABLE "employee" DROP COLUMN "username",
ADD COLUMN     "employeename" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "log" DROP COLUMN "activityuser_id",
ADD COLUMN     "activityemployee_id" INTEGER NOT NULL;

-- DropTable
DROP TABLE "activityuserstatus";

-- CreateTable
CREATE TABLE "activityemployeestatus" (
    "id_activityemployee" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "activityemployee" TEXT NOT NULL,

    CONSTRAINT "activityemployeestatus_pkey" PRIMARY KEY ("id_activityemployee")
);

-- CreateIndex
CREATE UNIQUE INDEX "employee_employeename_key" ON "employee"("employeename");

-- AddForeignKey
ALTER TABLE "log" ADD CONSTRAINT "log_activityemployee_id_fkey" FOREIGN KEY ("activityemployee_id") REFERENCES "activityemployeestatus"("id_activityemployee") ON DELETE RESTRICT ON UPDATE CASCADE;
