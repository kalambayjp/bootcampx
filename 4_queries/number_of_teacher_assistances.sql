SELECT 
  DISTINCT teachers.name AS teacher, 
  cohorts.name AS cohorts, 
  COUNT(assistance_requests.teacher_id) AS total_assistances
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id 
JOIN assistance_requests ON assistance_requests.student_id = students.id 
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE cohorts.name = 'JUL02'
GROUP BY teacher, cohorts
ORDER BY teacher;