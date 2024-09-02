/*Question: Skills for the top paying data analyst job
 */
WITH top_paying_data_analyst AS (
    SELECT job_id,
        job_title_short,
        company_dim.name as company_name,
        salary_year_avg
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
    ORDER BY salary_year_avg DESC
)
SELECT *
FROM top_paying_data_analyst;
LEFT JOIN top_paying_data_analyst ON skills_job_dim.job_id = top_paying_data_analyst.job_id;