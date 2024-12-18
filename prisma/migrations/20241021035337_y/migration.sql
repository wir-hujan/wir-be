-- DropForeignKey
ALTER TABLE "log" DROP CONSTRAINT "log_location_id_fkey";

-- AlterTable
ALTER TABLE "log" ALTER COLUMN "location_id" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "log" ADD CONSTRAINT "log_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "location"("id_location") ON DELETE SET NULL ON UPDATE CASCADE;
