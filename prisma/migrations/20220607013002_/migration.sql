-- CreateTable
CREATE TABLE "SkateParksGalery" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "images" TEXT NOT NULL,
    "skateParksGaleryid" TEXT NOT NULL,
    CONSTRAINT "SkateParksGalery_skateParksGaleryid_fkey" FOREIGN KEY ("skateParksGaleryid") REFERENCES "SkateParks" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_SkateParks" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "parkname" TEXT NOT NULL,
    "latitude" TEXT NOT NULL,
    "longitude" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "SkateParks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_SkateParks" ("id", "latitude", "longitude", "parkname", "userId") SELECT "id", "latitude", "longitude", "parkname", "userId" FROM "SkateParks";
DROP TABLE "SkateParks";
ALTER TABLE "new_SkateParks" RENAME TO "SkateParks";
CREATE UNIQUE INDEX "SkateParks_parkname_key" ON "SkateParks"("parkname");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
