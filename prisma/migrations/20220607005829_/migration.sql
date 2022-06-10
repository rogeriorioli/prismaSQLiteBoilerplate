-- CreateTable
CREATE TABLE "SkateParks" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "parkname" TEXT NOT NULL,
    "latitude" TEXT NOT NULL,
    "longitude" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    CONSTRAINT "SkateParks_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "SkateParks_parkname_key" ON "SkateParks"("parkname");
