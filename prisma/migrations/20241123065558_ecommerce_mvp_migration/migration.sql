-- CreateTable
CREATE TABLE "ProductEcommerceMvp" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "priceInCents" INTEGER NOT NULL,
    "filePath" TEXT NOT NULL,
    "imagePath" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "isAvailableForPurchase" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProductEcommerceMvp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserEcommerceMvp" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserEcommerceMvp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OrderEcommerceMvp" (
    "id" TEXT NOT NULL,
    "pricePaidInCents" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,

    CONSTRAINT "OrderEcommerceMvp_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DownloadVerificationEcommerceMvp" (
    "id" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "productId" TEXT NOT NULL,

    CONSTRAINT "DownloadVerificationEcommerceMvp_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserEcommerceMvp_email_key" ON "UserEcommerceMvp"("email");

-- AddForeignKey
ALTER TABLE "OrderEcommerceMvp" ADD CONSTRAINT "OrderEcommerceMvp_userId_fkey" FOREIGN KEY ("userId") REFERENCES "UserEcommerceMvp"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OrderEcommerceMvp" ADD CONSTRAINT "OrderEcommerceMvp_productId_fkey" FOREIGN KEY ("productId") REFERENCES "ProductEcommerceMvp"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DownloadVerificationEcommerceMvp" ADD CONSTRAINT "DownloadVerificationEcommerceMvp_productId_fkey" FOREIGN KEY ("productId") REFERENCES "ProductEcommerceMvp"("id") ON DELETE CASCADE ON UPDATE CASCADE;
