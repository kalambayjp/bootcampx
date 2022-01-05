SELECT cohorts.name AS name, AVG(assistance_requests.completed_at - assistance_requests.started_at) AS avg_assistance_time
FROM cohorts
JOIN students on students.cohort_id = cohorts.id -- GROUP STUDENTS OF THE SAME COHORT
JOIN assistance_requests ON assistance_requests.student_id = students.id -- GROUP ASSISTANCE REQUESTS WITH THEIR COHORTS
GROUP BY cohorts.name 
ORDER BY avg_assistance_time;