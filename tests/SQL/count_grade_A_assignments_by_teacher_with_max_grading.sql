-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
SELECT COUNT(*) AS count_of_grade_A
FROM assignments
WHERE teacher_id = (
    SELECT teacher_id FROM (
        SELECT teacher_id, COUNT(*) AS count_of_graded_assignment
        FROM assignments
        WHERE state="GRADED"
        GROUP BY teacher_id
        ORDER BY count_of_graded_assignment DESC
        LIMIT 1
    ) AS max_assignments
) AND grade='A';