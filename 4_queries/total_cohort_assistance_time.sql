SELECT cohorts.name AS name, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id -- group students into their cohorts
JOIN assistance_requests on assistance_requests.student_id = students.id --use students_id to group assistance request into cohorts
GROUP BY cohorts.name
ORDER BY total_duration;