SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohorts
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id -- used students + assistance_requests as bridge tables to link teachers to a cohort
JOIN assistance_requests ON assistance_requests.student_id = students.id - 
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;