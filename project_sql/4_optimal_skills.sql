/*
 Answer : What are the most optimal skills to learn
 -Identify skills in high demand and associated with high average salaries for data analyst roles
 -concentrates on remote positions with specified salaries
 */
WITH skill_demand AS (
    Select skills_dim.skill_id,
        skills_dim.skills,
        COUNT(job_postings_fact.job_id) AS count_demand
    from job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
        AND job_work_from_home = TRUE
    GROUP BY skills_dim.skill_id
),
avg_salary AS (
    Select skills_job_dim.skill_id,
        Round(AVG(salary_year_avg), 0) AS avg_year_salary
    from job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst' -- AND
        --     job_work_from_home = TRUE
    GROUP BY skills_job_dim.skill_id
)