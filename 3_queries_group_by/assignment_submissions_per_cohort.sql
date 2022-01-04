SELECT cohorts.name AS cohort, COUNT(assignment_submissions.student_id) AS total_submissions
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id -- GROUP STUDENTS BY RELATING COHORTS
JOIN assignment_submissions ON assignment_submissions.student_id = students.id -- GROUP ASSIGNMENT SUBMISSIONS BY STUDENTS OF THE SAME COHORT
GROUP BY cohorts.name 
ORDER BY COUNT(assignment_submissions.student_id) DESC;