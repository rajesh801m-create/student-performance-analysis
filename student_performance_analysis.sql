USE student_analysis;

-- 1. Total Students
SELECT COUNT(*) AS total_students
FROM student_data;

-- 2. Department-wise Student Count
SELECT department, COUNT(*) AS student_count
FROM student_data
GROUP BY department;

-- 3. Department-wise Average Marks
SELECT 
    department,
    ROUND(AVG(maths), 2) AS avg_maths,
    ROUND(AVG(science), 2) AS avg_science,
    ROUND(AVG(english), 2) AS avg_english
FROM student_data
GROUP BY department;

-- 4. Top 5 Students
SELECT 
    student_id,
    name,
    department,
    ROUND((maths + science + english) / 3, 2) AS average_marks
FROM student_data
ORDER BY average_marks DESC
LIMIT 5;

-- 5. Top 5 Attendance
SELECT name, department, attendance
FROM student_data
ORDER BY attendance DESC
LIMIT 5;

-- 6. Students with Attendance Above 90
SELECT name, department, attendance
FROM student_data
WHERE attendance > 90
ORDER BY attendance DESC;

-- 7. Overall Subject Average
SELECT
    ROUND(AVG(maths), 2) AS average_maths,
    ROUND(AVG(science), 2) AS average_science,
    ROUND(AVG(english), 2) AS average_english
FROM student_data;

-- 8. Gender-wise Average
SELECT
    gender,
    ROUND(AVG(maths), 2) AS avg_maths,
    ROUND(AVG(science), 2) AS avg_science,
    ROUND(AVG(english), 2) AS avg_english
FROM student_data
GROUP BY gender;

-- 9. Students with 90+ in Any Subject
SELECT name, maths, science, english
FROM student_data
WHERE maths >= 90
   OR science >= 90
   OR english >= 90;

-- 10. Department with Highest Overall Average
SELECT
    department,
    ROUND(AVG((maths + science + english) / 3), 2) AS overall_average
FROM student_data
GROUP BY department
ORDER BY overall_average DESC
LIMIT 1;