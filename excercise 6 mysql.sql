USE school;

-- =========================================
-- STUDENT TASK SHEET: MYSQL INDEX PERFORMANCE
-- =========================================

-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS student_task;
USE student_task;

-- 2. CREATE SAMPLE TABLE
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    department VARCHAR(100),
    age INT,
    city VARCHAR(100)
);

-- 3. INSERT 1500 ROWS
INSERT INTO students (full_name, department, age, city)
SELECT
    CONCAT('Student ', LPAD(num + 1, 4, '0')),
    CASE MOD(num, 5)
        WHEN 0 THEN 'Computer Science'
        WHEN 1 THEN 'IT'
        WHEN 2 THEN 'Business'
        WHEN 3 THEN 'Networking'
        ELSE 'Database'
    END,
    18 + MOD(num, 15),
    CASE MOD(num, 4)
        WHEN 0 THEN 'Mogadishu'
        WHEN 1 THEN 'Hargeisa'
        WHEN 2 THEN 'Kismayo'
        ELSE 'Garowe'
    END
FROM (
    SELECT
        d1.n + d2.n * 10 + d3.n * 100 AS num
    FROM
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6
         UNION ALL SELECT 7 UNION ALL SELECT 8
         UNION ALL SELECT 9) d1
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6
         UNION ALL SELECT 7 UNION ALL SELECT 8
         UNION ALL SELECT 9) d2
    CROSS JOIN
        (SELECT 0 n UNION ALL SELECT 1 UNION ALL SELECT 2
         UNION ALL SELECT 3 UNION ALL SELECT 4
         UNION ALL SELECT 5 UNION ALL SELECT 6
         UNION ALL SELECT 7 UNION ALL SELECT 8
         UNION ALL SELECT 9) d3
) AS numbers
WHERE num < 1500;

-- VERIFY ROW COUNT
SELECT COUNT(*) AS total_students FROM students;

-- 4. EXPLAIN WITHOUT INDEX
EXPLAIN
SELECT *
FROM students
WHERE full_name = 'Student 0750';

-- 5. CREATE INDEX
CREATE INDEX idx_full_name
ON students(full_name);

-- 6. EXPLAIN WITH INDEX
EXPLAIN
SELECT *
FROM students
WHERE full_name = 'Student 0750';

-- 7. RUN THE QUERY
SELECT *
FROM students
WHERE full_name = 'Student 0750';

-- 8. VIEW THE INDEX
SHOW INDEX FROM students;
