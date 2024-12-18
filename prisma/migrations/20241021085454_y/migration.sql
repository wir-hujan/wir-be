-- AlterTable
ALTER TABLE "log" ADD COLUMN     "product_id" INTEGER;

-- AlterTable
ALTER TABLE "product" ADD COLUMN     "shoponlinediscon" DOUBLE PRECISION,
ADD COLUMN     "shoponlineprice" INTEGER;

-- CreateTable
CREATE TABLE "attachment" (
    "id_attachment" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "name" TEXT,
    "routename" TEXT NOT NULL,
    "route" TEXT,
    "size" TEXT,
    "model" TEXT NOT NULL,

    CONSTRAINT "attachment_pkey" PRIMARY KEY ("id_attachment")
);

-- AddForeignKey
ALTER TABLE "log" ADD CONSTRAINT "log_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "product"("id_product") ON DELETE SET NULL ON UPDATE CASCADE;
