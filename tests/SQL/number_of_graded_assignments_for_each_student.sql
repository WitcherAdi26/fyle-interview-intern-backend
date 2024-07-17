-- Write query to get number of graded assignments for each student:
SELECT COUNT(*) AS count_of_graded_assignments, student_id
FROM assignments
WHERE grade IS NOT NULL
GROUP BY student_id;