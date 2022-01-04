SELECT DISTINCT students.name AS student, 
  AVG(assignment_submissions.duration) AS avg_assignment_duration,
  AVG(assignments.duration) AS avg_estimated_duration
FROM students
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
JOIN assignments ON assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration)
ORDER BY AVG(assignment_submissions.duration);
