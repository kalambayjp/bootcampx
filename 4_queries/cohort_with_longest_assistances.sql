SELECT cohorts.name AS name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS avg_assistance_time
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id 
JOIN assistance_requests ON assistance_requests.student_id = students.id 
GROUP BY cohorts.name 
ORDER BY avg_assistance_time DESC -- MAKE THE LARGEST VALUE FIRST
LIMIT 1; -- LIMIT DATA AFTER FIRST ROW