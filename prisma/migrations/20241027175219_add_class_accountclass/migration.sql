-- CreateTable
CREATE TABLE "Class" (
    "id_class" TEXT NOT NULL,
    "start_time" TIMESTAMP(3) NOT NULL,
    "end_time" TIMESTAMP(3) NOT NULL,
    "location" TEXT NOT NULL,
    "id_course" TEXT NOT NULL,

    CONSTRAINT "Class_pkey" PRIMARY KEY ("id_class")
);

-- CreateTable
CREATE TABLE "AccountClass" (
    "id_account" TEXT NOT NULL,
    "id_class" TEXT NOT NULL,

    CONSTRAINT "AccountClass_pkey" PRIMARY KEY ("id_account","id_class")
);

-- AddForeignKey
ALTER TABLE "Class" ADD CONSTRAINT "Class_id_course_fkey" FOREIGN KEY ("id_course") REFERENCES "Course"("id_course") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccountClass" ADD CONSTRAINT "AccountClass_id_account_fkey" FOREIGN KEY ("id_account") REFERENCES "Account"("id_account") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AccountClass" ADD CONSTRAINT "AccountClass_id_class_fkey" FOREIGN KEY ("id_class") REFERENCES "Class"("id_class") ON DELETE RESTRICT ON UPDATE CASCADE;
