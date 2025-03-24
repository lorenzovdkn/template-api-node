/*
  Warnings:

  - You are about to drop the `Type` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Type";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Character" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "onePieceId" INTEGER NOT NULL,
    "affiliationId" INTEGER NOT NULL,
    "lifePoints" INTEGER NOT NULL,
    "size" REAL,
    "weight" REAL,
    "imageUrl" TEXT,
    CONSTRAINT "Character_affiliationId_fkey" FOREIGN KEY ("affiliationId") REFERENCES "Affiliation" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Affiliation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Character_name_key" ON "Character"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Character_onePieceId_key" ON "Character"("onePieceId");

-- CreateIndex
CREATE UNIQUE INDEX "Affiliation_name_key" ON "Affiliation"("name");
