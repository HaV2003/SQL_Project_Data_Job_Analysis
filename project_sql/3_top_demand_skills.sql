/*
Question: What are the most in-demand skills for data analysts?
- Join Job_postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data anlayst.
- Focus on all job postings. 
- Why? Retrives the top 5 skills with the highest demand in the job market,
    providing insights into the most valubale skills for job seekers. 
*/

SELECT 
    skills,
    count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst' AND job_work_from_home = True
GROUP BY skills
order by demand_count desc
limit 5