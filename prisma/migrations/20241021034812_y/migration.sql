/*
  Warnings:

  - You are about to drop the `activityemployeestatus` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "log" DROP CONSTRAINT "log_activityemployee_id_fkey";

-- DropForeignKey
ALTER TABLE "logstock" DROP CONSTRAINT "logstock_activityemployee_id_fkey";

-- DropTable
DROP TABLE "activityemployeestatus";

-- CreateTable
CREATE TABLE "activityemployee" (
    "id_activityemployee" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "activityemployee" TEXT NOT NULL,

    CONSTRAINT "activityemployee_pkey" PRIMARY KEY ("id_activityemployee")
);

-- AddForeignKey
ALTER TABLE "log" ADD CONSTRAINT "log_activityemployee_id_fkey" FOREIGN KEY ("activityemployee_id") REFERENCES "activityemployee"("id_activityemployee") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "logstock" ADD CONSTRAINT "logstock_activityemployee_id_fkey" FOREIGN KEY ("activityemployee_id") REFERENCES "activityemployee"("id_activityemployee") ON DELETE RESTRICT ON UPDATE CASCADE;
