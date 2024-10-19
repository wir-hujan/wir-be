-- CreateTable
CREATE TABLE "User" (
    "id_user" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "location_id" INTEGER NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "Product" (
    "id_produk" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "produk" TEXT NOT NULL,
    "kdproduk" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id_produk")
);

-- CreateTable
CREATE TABLE "Productstok" (
    "id_produkstok" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "location_id" INTEGER NOT NULL,
    "stokproduk" INTEGER NOT NULL,
    "produk_id" INTEGER NOT NULL,

    CONSTRAINT "Productstok_pkey" PRIMARY KEY ("id_produkstok")
);

-- CreateTable
CREATE TABLE "Log" (
    "id_log" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "activityuser_id" INTEGER NOT NULL,
    "location_id" INTEGER NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Log_pkey" PRIMARY KEY ("id_log")
);

-- CreateTable
CREATE TABLE "Logstok" (
    "id_logstok" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "location_id" INTEGER NOT NULL,
    "stokstart" INTEGER NOT NULL,
    "stokend" INTEGER NOT NULL,
    "in" INTEGER NOT NULL,
    "out" INTEGER NOT NULL,
    "produk_id" INTEGER NOT NULL,

    CONSTRAINT "Logstok_pkey" PRIMARY KEY ("id_logstok")
);

-- CreateTable
CREATE TABLE "Location" (
    "id_location" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id_location")
);

-- CreateTable
CREATE TABLE "Activityuser" (
    "id_activityuser" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "activityuser" TEXT NOT NULL,

    CONSTRAINT "Activityuser_pkey" PRIMARY KEY ("id_activityuser")
);

-- CreateTable
CREATE TABLE "Status" (
    "id_status" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL,

    CONSTRAINT "Status_pkey" PRIMARY KEY ("id_status")
);

-- CreateTable
CREATE TABLE "Role" (
    "id_role" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "role" TEXT NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id_role")
);

-- CreateTable
CREATE TABLE "Module" (
    "id_module" SERIAL NOT NULL,
    "statusenabled" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "module" TEXT NOT NULL,

    CONSTRAINT "Module_pkey" PRIMARY KEY ("id_module")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Productstok" ADD CONSTRAINT "Productstok_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Productstok" ADD CONSTRAINT "Productstok_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "Product"("id_produk") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Log" ADD CONSTRAINT "Log_activityuser_id_fkey" FOREIGN KEY ("activityuser_id") REFERENCES "Activityuser"("id_activityuser") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Log" ADD CONSTRAINT "Log_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Logstok" ADD CONSTRAINT "Logstok_location_id_fkey" FOREIGN KEY ("location_id") REFERENCES "Location"("id_location") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Logstok" ADD CONSTRAINT "Logstok_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "Product"("id_produk") ON DELETE RESTRICT ON UPDATE CASCADE;
