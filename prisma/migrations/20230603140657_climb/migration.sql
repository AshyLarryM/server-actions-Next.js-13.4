-- CreateTable
CREATE TABLE "Climb" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "grade" TEXT NOT NULL,
    "attempts" INTEGER NOT NULL,
    "completed" BOOLEAN NOT NULL,

    CONSTRAINT "Climb_pkey" PRIMARY KEY ("id")
);
