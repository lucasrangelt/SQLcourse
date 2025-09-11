WITH trending_skills AS (
    SELECT
        skills,
        skill_id
    FROM
        skills_dim
    GROUP BY
        skill_id
)

SELECT
    COUNT(job_id) AS jobs_amount,
    trending_skills.skills
FROM
    skills_job_dim
LEFT JOIN trending_skills ON trending_skills.skill_id = skills_job_dim.skill_id
GROUP BY
    trending_skills.skills
ORDER BY
    jobs_amount DESC
LIMIT 5