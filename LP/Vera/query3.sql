-- Relationonal DATABASE

/*
* DB  COURSE
*/

CREATE DATABASE COURSE;

CREATE TABLE studentCourses (
  studentID INT NOT NULL,
  courseID INT NOT NULL,
  FOREIGN key (studentID) references student(studentID),
  FOREIGN key (courseID) references couser(courseID)
);

INSERT INTO courses VALUES(10,'SQL'),(11,'ASP'),(12,'Java');