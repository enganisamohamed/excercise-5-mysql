USE school;

-- 1. Create and select database
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- 2. Drop old tables
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

-- 3. Create students table
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100)
);

-- 4. Create courses table
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100)
);

-- 5. Create enrollments table
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id)
);

-- 6. Insert students
INSERT INTO students (student_name, email)
VALUES
('Khalid Said', 'khalid@yahoo.com'),
('Nasteexo Abdi', 'nasteexo@gmail.com'),
('Sagal Osman', 'sagal@live.com');

-- 7. Insert courses
INSERT INTO courses (course_name)
VALUES
('MySQL'),
('React'),
('Python');

-- 8. Insert enrollments
INSERT INTO enrollments (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 3);

-- 9. INNER JOIN
SELECT students.student_name, courses.course_name
FROM students
INNER JOIN enrollments
    ON students.student_id = enrollments.student_id
INNER JOIN courses
    ON enrollments.course_id = courses.course_id;

-- 10. LEFT JOIN
SELECT students.student_name, courses.course_name
FROM students
LEFT JOIN enrollments
    ON students.student_id = enrollments.student_id
LEFT JOIN courses
    ON enrollments.course_id = courses.course_id;

-- 11. Count students per course
SELECT
    courses.course_name,
    COUNT(enrollments.student_id) AS total_students
FROM courses
LEFT JOIN enrollments
    ON courses.course_id = enrollments.course_id
GROUP BY courses.course_id, courses.course_name;
