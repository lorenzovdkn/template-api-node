/*
  Warnings:

  - You are about to drop the column `onePieceId` on the `Character` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Character" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "affiliationId" INTEGER NOT NULL,
    "lifePoints" INTEGER NOT NULL,
    "size" REAL,
    "age" INTEGER,
    "weight" REAL,
    "imageUrl" TEXT,
    CONSTRAINT "Character_affiliationId_fkey" FOREIGN KEY ("affiliationId") REFERENCES "Affiliation" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Character" ("affiliationId", "age", "id", "imageUrl", "lifePoints", "name", "size", "weight") SELECT "affiliationId", "age", "id", "imageUrl", "lifePoints", "name", "size", "weight" FROM "Character";
DROP TABLE "Character";
ALTER TABLE "new_Character" RENAME TO "Character";
CREATE UNIQUE INDEX "Character_name_key" ON "Character"("name");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
