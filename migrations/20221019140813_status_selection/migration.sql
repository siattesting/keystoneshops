/*
  Warnings:

  - The `status` column on the `Shop` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "ShopStatusType" AS ENUM ('published', 'draft');

-- AlterTable
ALTER TABLE "Shop" DROP COLUMN "status",
ADD COLUMN     "status" "ShopStatusType";
