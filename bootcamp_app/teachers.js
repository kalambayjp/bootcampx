const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});
const cohortName = `%${process.argv[2]}%`;
const values = [cohortName];

pool.query(`SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
JOIN assistance_requests ON assistance_requests.student_id = students.id 
JOIN teachers ON teachers.id = assistance_requests.teacher_id
WHERE cohorts.name LIKE $1
ORDER BY teacher;
`, values)
.then(res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`);
  })
})
.catch(err => console.error('query error', err.stack));