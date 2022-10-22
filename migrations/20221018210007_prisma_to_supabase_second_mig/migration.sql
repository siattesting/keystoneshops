-- CreateTable
CREATE TABLE "Shop" (
    "id" UUID NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',

    CONSTRAINT "Shop_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "City" (
    "id" UUID NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "country" UUID,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" UUID NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Country_city" (
    "A" UUID NOT NULL,
    "B" UUID NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Shop_title_key" ON "Shop"("title");

-- CreateIndex
CREATE UNIQUE INDEX "City_title_key" ON "City"("title");

-- CreateIndex
CREATE INDEX "City_country_idx" ON "City"("country");

-- CreateIndex
CREATE UNIQUE INDEX "Country_title_key" ON "Country"("title");

-- CreateIndex
CREATE UNIQUE INDEX "_Country_city_AB_unique" ON "_Country_city"("A", "B");

-- CreateIndex
CREATE INDEX "_Country_city_B_index" ON "_Country_city"("B");

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_country_fkey" FOREIGN KEY ("country") REFERENCES "Country"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Country_city" ADD CONSTRAINT "_Country_city_A_fkey" FOREIGN KEY ("A") REFERENCES "City"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Country_city" ADD CONSTRAINT "_Country_city_B_fkey" FOREIGN KEY ("B") REFERENCES "Country"("id") ON DELETE CASCADE ON UPDATE CASCADE;
