USE school;

-- 1. Total number of students
SELECT COUNT(*) AS total_students
FROM students;

-- 2. Highest and lowest score
SELECT
    MAX(score) AS highest_score,
    MIN(score) AS lowest_score
FROM students;

-- 3. Number of students per email domain
SELECT
    SUBSTRING_INDEX(email, '@', -1) AS domain,
    COUNT(*) AS total_students
FROM students
GROUP BY domain;

-- 4. Average score for each email domain
SELECT
    SUBSTRING_INDEX(email, '@', -1) AS domain,
    AVG(score) AS average_score
FROM students
GROUP BY domain;