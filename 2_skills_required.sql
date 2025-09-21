WITH skill_set AS (
    SELECT
        skill_id,
        skills_dim.skills
    FROM
        skills_dim
)

SELECT
    -- job_id,
    job_title_short AS remote_jobs,
    salary_year_avg,
    company_dim.name AS company_name,
    skill_set.skills
    -- job_via,
    -- job_schedule_type,
    -- job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skill_set ON skills_job_dim.skill_id = skill_set.skill_id
WHERE
    job_work_from_home = TRUE
    AND salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
LIMIT 13