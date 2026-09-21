USE school;
INSERT INTO students (name, email)
VALUES
  ('Khalid Said', 'khalid@yahoo.com'),
  ('Nasteexo Abdi', 'nasteexo@gmail.com'),
  ('Sagal Osman', 'sagal@live.com');
  SELECT * FROM students;

  -- Exercise 1
SELECT * FROM students
WHERE name LIKE '%d';

-- Exercise 2
SELECT * FROM students
WHERE email LIKE '%@gmail.com';

-- Exercise 3
SELECT * FROM students
WHERE email LIKE '%o%';

-- Exercise 4
SELECT * FROM students
WHERE name LIKE '____';

-- Exercise 5
SELECT * FROM students
WHERE name LIKE 'S%';