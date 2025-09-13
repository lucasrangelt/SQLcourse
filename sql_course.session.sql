SELECT
    COUNT(job_id) AS jobs_amount,
    skills_dim.skills
FROM
    skills_job_dim
LEFT JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
GROUP BY
    skills_dim.skills
ORDER BY
    jobs_amount DESC
LIMIT 5