SELECT
    COUNT(job_id) AS amount_of_jobs,
    EXTRACT(MONTH FROM job_posted_date) AS month_number,
    CASE
        WHEN EXTRACT(MONTH FROM job_posted_date) = '5'
            THEN 'Menor Oferta'
        WHEN EXTRACT(MONTH FROM job_posted_date) = '12'
            THEN 'Menor Oferta'
    END AS observation
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month_number
ORDER BY
    month_number