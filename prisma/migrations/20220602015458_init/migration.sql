-- CreateTable
CREATE TABLE "Manufacturer" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Manufacturer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Model" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "manufacturerId" INTEGER NOT NULL,

    CONSTRAINT "Model_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelYear" (
    "id" SERIAL NOT NULL,
    "year" INTEGER NOT NULL,
    "modelId" INTEGER NOT NULL,

    CONSTRAINT "ModelYear_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Transmission" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Transmission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelTransmission" (
    "modelId" INTEGER NOT NULL,
    "transmissionId" INTEGER NOT NULL,

    CONSTRAINT "ModelTransmission_pkey" PRIMARY KEY ("modelId","transmissionId")
);

-- CreateTable
CREATE TABLE "Color" (
    "id" SERIAL NOT NULL,
    "code" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Color_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelColor" (
    "modelId" INTEGER NOT NULL,
    "colorId" INTEGER NOT NULL,
    "activeStart" TIMESTAMP(3) NOT NULL,
    "activeEnd" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ModelColor_pkey" PRIMARY KEY ("modelId","colorId")
);

-- CreateTable
CREATE TABLE "Vehicle" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "manufacturerId" INTEGER NOT NULL,
    "modelYearId" INTEGER NOT NULL,
    "transmissionId" INTEGER NOT NULL,
    "colorId" INTEGER,

    CONSTRAINT "Vehicle_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ModelColor_activeStart_key" ON "ModelColor"("activeStart");

-- CreateIndex
CREATE UNIQUE INDEX "ModelColor_activeEnd_key" ON "ModelColor"("activeEnd");

-- AddForeignKey
ALTER TABLE "Model" ADD CONSTRAINT "Model_manufacturerId_fkey" FOREIGN KEY ("manufacturerId") REFERENCES "Manufacturer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelYear" ADD CONSTRAINT "ModelYear_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelTransmission" ADD CONSTRAINT "ModelTransmission_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelTransmission" ADD CONSTRAINT "ModelTransmission_transmissionId_fkey" FOREIGN KEY ("transmissionId") REFERENCES "Transmission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelColor" ADD CONSTRAINT "ModelColor_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelColor" ADD CONSTRAINT "ModelColor_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES "Color"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_manufacturerId_fkey" FOREIGN KEY ("manufacturerId") REFERENCES "Manufacturer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_modelYearId_fkey" FOREIGN KEY ("modelYearId") REFERENCES "ModelYear"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_transmissionId_fkey" FOREIGN KEY ("transmissionId") REFERENCES "Transmission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vehicle" ADD CONSTRAINT "Vehicle_colorId_fkey" FOREIGN KEY ("colorId") REFERENCES "Color"("id") ON DELETE SET NULL ON UPDATE CASCADE;
