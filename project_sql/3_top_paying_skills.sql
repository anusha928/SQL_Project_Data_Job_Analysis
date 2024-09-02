/* 
 Answer: What are the top skillls based on salary?
 -Look at the average salrary associated with each skill for datanalyst positions
 -focuces on roles with specified salaries, regardless of location\
 */
Select salary_year_avg,
    AVG(salary_year_avg) AS avg_year_salary
from job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
GROUP BY skills
Limit 100;