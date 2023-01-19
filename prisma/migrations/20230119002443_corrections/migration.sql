/*
  Warnings:

  - You are about to drop the column `data` on the `days` table. All the data in the column will be lost.
  - Added the required column `date` to the `days` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_days" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "date" DATETIME NOT NULL
);
INSERT INTO "new_days" ("id") SELECT "id" FROM "days";
DROP TABLE "days";
ALTER TABLE "new_days" RENAME TO "days";
CREATE INDEX "days_date_idx" ON "days"("date");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
