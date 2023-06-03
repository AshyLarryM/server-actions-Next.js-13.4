/*
  Warnings:

  - You are about to drop the column `name` on the `Climb` table. All the data in the column will be lost.
  - Added the required column `routeName` to the `Climb` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Climb" DROP COLUMN "name",
ADD COLUMN     "routeName" TEXT NOT NULL;
