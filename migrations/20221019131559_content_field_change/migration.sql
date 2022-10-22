/*
  Warnings:

  - The `content` column on the `Shop` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Shop" DROP COLUMN "content",
ADD COLUMN     "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]';
