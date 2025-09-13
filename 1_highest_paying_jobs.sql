SELECT
    job_id,
    job_title_short AS remote_jobs,
    salary_year_avg,
    company_dim.name AS company_name,
    job_via,
    job_schedule_type,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
LIMIT 10