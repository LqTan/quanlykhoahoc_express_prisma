/*
  Warnings:

  - You are about to drop the `AccountClass` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "AccountClass" DROP CONSTRAINT "AccountClass_id_account_fkey";

-- DropForeignKey
ALTER TABLE "AccountClass" DROP CONSTRAINT "AccountClass_id_class_fkey";

-- DropTable
DROP TABLE "AccountClass";

-- CreateTable
CREATE TABLE "Enrollment" (
    "id_enrollment" TEXT NOT NULL,
    "id_account" TEXT NOT NULL,
    "id_class" TEXT NOT NULL,

    CONSTRAINT "Enrollment_pkey" PRIMARY KEY ("id_enrollment")
);

-- CreateTable
CREATE TABLE "Post" (
    "id_post" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "timestamp" TEXT NOT NULL,
    "attachedFile" TEXT,
    "id_enrollment" TEXT NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id_post")
);

-- CreateTable
CREATE TABLE "Comment" (
    "id_comment" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "timestamp" TEXT NOT NULL,
    "attachedFile" TEXT,
    "id_post" TEXT NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id_comment")
);

-- AddForeignKey
ALTER TABLE "Enrollment" ADD CONSTRAINT "Enrollment_id_account_fkey" FOREIGN KEY ("id_account") REFERENCES "Account"("id_account") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Enrollment" ADD CONSTRAINT "Enrollment_id_class_fkey" FOREIGN KEY ("id_class") REFERENCES "Class"("id_class") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_id_enrollment_fkey" FOREIGN KEY ("id_enrollment") REFERENCES "Enrollment"("id_enrollment") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_id_post_fkey" FOREIGN KEY ("id_post") REFERENCES "Post"("id_post") ON DELETE RESTRICT ON UPDATE CASCADE;
