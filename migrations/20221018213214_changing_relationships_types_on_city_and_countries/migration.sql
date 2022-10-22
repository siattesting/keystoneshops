/*
  Warnings:

  - You are about to drop the `_Category_shops` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_City_shops` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_Country_city` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Shop" DROP CONSTRAINT "Shop_category_fkey";

-- DropForeignKey
ALTER TABLE "_Category_shops" DROP CONSTRAINT "_Category_shops_A_fkey";

-- DropForeignKey
ALTER TABLE "_Category_shops" DROP CONSTRAINT "_Category_shops_B_fkey";

-- DropForeignKey
ALTER TABLE "_City_shops" DROP CONSTRAINT "_City_shops_A_fkey";

-- DropForeignKey
ALTER TABLE "_City_shops" DROP CONSTRAINT "_City_shops_B_fkey";

-- DropForeignKey
ALTER TABLE "_Country_city" DROP CONSTRAINT "_Country_city_A_fkey";

-- DropForeignKey
ALTER TABLE "_Country_city" DROP CONSTRAINT "_Country_city_B_fkey";

-- DropTable
DROP TABLE "_Category_shops";

-- DropTable
DROP TABLE "_City_shops";

-- DropTable
DROP TABLE "_Country_city";

-- AddForeignKey
ALTER TABLE "Shop" ADD CONSTRAINT "Shop_category_fkey" FOREIGN KEY ("category") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;
