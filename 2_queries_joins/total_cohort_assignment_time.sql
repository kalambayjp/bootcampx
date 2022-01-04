SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
JOIN students ON students.id = student_id -- ALL STUDENTS THAT HAVE SUBMITTED ASSIGNMENTS
JOIN cohorts ON cohorts.id = cohort_id -- ALL STUDENTS OF A GIVEN COHORT
WHERE cohorts.name = 'FEB12'; -- IDENTIFY SPECIFIC COHORT