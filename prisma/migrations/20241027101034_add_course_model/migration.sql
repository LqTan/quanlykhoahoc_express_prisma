-- CreateTable
CREATE TABLE "Course" (
    "id_course" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "opening_day" TIMESTAMP(3) NOT NULL,
    "original_fee" DOUBLE PRECISION NOT NULL,
    "current_fee" DOUBLE PRECISION NOT NULL,
    "course_thumbnail" TEXT,
    "id_curriculum" TEXT NOT NULL,

    CONSTRAINT "Course_pkey" PRIMARY KEY ("id_course")
);

-- AddForeignKey
ALTER TABLE "Course" ADD CONSTRAINT "Course_id_curriculum_fkey" FOREIGN KEY ("id_curriculum") REFERENCES "Curriculum"("id_curriculum") ON DELETE RESTRICT ON UPDATE CASCADE;
