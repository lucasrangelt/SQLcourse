SELECT
    COUNT(job_postings_fact.job_id) AS job_amount,
    ROUND(AVG(salary_year_avg), 2) AS average_wage,
    skills_dim.skills
FROM
    job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND skills_dim.skills IS NOT NULL
    -- AND salary_year_avg IS NOT NULL
    AND salary_year_avg >= 100000
GROUP BY
    skills_dim.skills
HAVING
    COUNT(job_postings_fact.job_id) >= 20
ORDER BY
    job_amount DESC
    -- average_wage DESC
LIMIT 18