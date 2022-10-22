-- AlterTable
ALTER TABLE "Shop" ADD COLUMN     "category" UUID,
ADD COLUMN     "city" UUID,
ADD COLUMN     "publishedAt" TIMESTAMP(3),
ADD COLUMN     "status" TEXT;

-- CreateTable
CREATE TABLE "Category" (
    "id" UUID NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Category_shops" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateTable
CREATE TABLE "_City_shops" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Category_title_key" ON "Category"("title");

-- CreateIndex
CREATE UNIQUE INDEX "_Category_shops_AB_unique" ON "_Category_shops"("A", "B");

-- CreateIndex
CREATE INDEX "_Category_shops_B_index" ON "_Category_shops"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_City_shops_AB_unique" ON "_City_shops"("A", "B");

-- CreateIndex
CREATE INDEX "_City_shops_B_index" ON "_City_shops"("B");

-- CreateIndex
CREATE INDEX "Shop_city_idx" ON "Shop"("city");

-- CreateIndex
CREATE INDEX "Shop_category_idx" ON "Shop"("category");

-- AddForeignKey
ALTER TABLE "Shop" ADD CONSTRAINT "Shop_city_fkey" FOREIGN KEY ("city") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Shop" ADD CONSTRAINT "Shop_category_fkey" FOREIGN KEY ("category") REFERENCES "City"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Category_shops" ADD CONSTRAINT "_Category_shops_A_fkey" FOREIGN KEY ("A") REFERENCES "Category"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Category_shops" ADD CONSTRAINT "_Category_shops_B_fkey" FOREIGN KEY ("B") REFERENCES "Shop"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_City_shops" ADD CONSTRAINT "_City_shops_A_fkey" FOREIGN KEY ("A") REFERENCES "City"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_City_shops" ADD CONSTRAINT "_City_shops_B_fkey" FOREIGN KEY ("B") REFERENCES "Shop"("id") ON DELETE CASCADE ON UPDATE CASCADE;
