-- CreateTable
CREATE TABLE "Deck" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,
    CONSTRAINT "Deck_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "Users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_DeckCharacters" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_DeckCharacters_A_fkey" FOREIGN KEY ("A") REFERENCES "Character" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_DeckCharacters_B_fkey" FOREIGN KEY ("B") REFERENCES "Deck" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "_DeckCharacters_AB_unique" ON "_DeckCharacters"("A", "B");

-- CreateIndex
CREATE INDEX "_DeckCharacters_B_index" ON "_DeckCharacters"("B");
