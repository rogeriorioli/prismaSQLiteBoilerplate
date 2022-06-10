/*
  Warnings:

  - You are about to drop the `SkateParksGalery` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "SkateParksGalery";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "SkateParkGalery" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "images" TEXT NOT NULL,
    "skateParkGaleryid" TEXT NOT NULL,
    CONSTRAINT "SkateParkGalery_skateParkGaleryid_fkey" FOREIGN KEY ("skateParkGaleryid") REFERENCES "SkateParks" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
