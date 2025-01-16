/*
  Warnings:

  - You are about to drop the `subModule` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "subModule";

-- CreateTable
CREATE TABLE "SubModule" (
    "id" SERIAL NOT NULL,
    "isActive" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "createdBy" INTEGER,
    "updatedBy" INTEGER,
    "deletedBy" INTEGER,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "SubModule_pkey" PRIMARY KEY ("id")
);
