/*Question: Top paying data analyst job
 -Identify  the top 10 highest paying Data Analyst roles that are available remotely.
 -Focus on the job posting with specified salaries (remove nulls)
 - why? hilight the top-paying opportunities for Data Analyst, offwring insights into  employee
 */
SELECT job_id,
    job_title,
    job_location,
    job_title_short,
    salary_year_avg,
    company_dim.name as company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10;
-- SELECT * FROM company_dim