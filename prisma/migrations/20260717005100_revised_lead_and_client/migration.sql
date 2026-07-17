/*
  Warnings:

  - You are about to drop the column `leadId` on the `Client` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[clientId]` on the table `Lead` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `clientId` to the `Lead` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "public"."Client" DROP CONSTRAINT "Client_leadId_fkey";

-- DropIndex
DROP INDEX "public"."Client_leadId_key";

-- AlterTable
ALTER TABLE "public"."Client" DROP COLUMN "leadId";

-- AlterTable
ALTER TABLE "public"."Lead" ADD COLUMN     "clientId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Lead_clientId_key" ON "public"."Lead"("clientId");

-- AddForeignKey
ALTER TABLE "public"."Lead" ADD CONSTRAINT "Lead_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "public"."Client"("id") ON DELETE CASCADE ON UPDATE CASCADE;
