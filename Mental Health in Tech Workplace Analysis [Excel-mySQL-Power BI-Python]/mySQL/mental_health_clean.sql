-- Preview all records
SELECT * FROM mental_health_clean;

-- Convert blank strings to NULL
SET SQL_SAFE_UPDATES = 0;

UPDATE mental_health_clean
SET 
    self_employed = CASE WHEN self_employed = '' THEN NULL ELSE self_employed END,
    work_interfere = CASE WHEN work_interfere = '' THEN NULL ELSE work_interfere END,
    comments = CASE WHEN comments = '' THEN NULL ELSE comments END;

SET SQL_SAFE_UPDATES = 1;

-- KPI 1: Percentage of respondents who sought mental health treatment
SELECT
    ROUND(SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS treatment_percentage
FROM mental_health_clean
WHERE treatment IS NOT NULL;

-- KPI 2: Comparison of mental health benefits provided by tech vs non-tech companies
SELECT
    tech_company,
    ROUND(SUM(CASE WHEN benefits = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS benefit_percentage
FROM mental_health_clean
WHERE tech_company IS NOT NULL AND benefits IS NOT NULL
GROUP BY tech_company;

-- KPI 3: Treatment seeking behavior between remote and on-site employees
SELECT
    remote_work,
    ROUND(SUM(CASE WHEN treatment = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS treatment_percentage
FROM mental_health_clean
WHERE remote_work IS NOT NULL AND treatment IS NOT NULL
GROUP BY remote_work
ORDER BY remote_work DESC;

-- KPI 4: Perception of openness regarding mental health issues in the workplace
WITH perception AS (
    SELECT 'Coworker' AS topic, coworkers AS response,
           ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE coworkers IS NOT NULL), 2) AS percentage
    FROM mental_health_clean
    WHERE coworkers IS NOT NULL
    GROUP BY coworkers

    UNION ALL

    SELECT 'Supervisor' AS topic, supervisor AS response,
           ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE supervisor IS NOT NULL), 2) AS percentage
    FROM mental_health_clean
    WHERE supervisor IS NOT NULL
    GROUP BY supervisor

    UNION ALL

    SELECT 'Interview' AS topic, mental_health_interview AS response,
           ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE mental_health_interview IS NOT NULL), 2) AS percentage
    FROM mental_health_clean
    WHERE mental_health_interview IS NOT NULL
    GROUP BY mental_health_interview
)
SELECT * FROM perception
ORDER BY FIELD(topic, 'Coworker', 'Supervisor', 'Interview'), FIELD(response, 'Yes','No', 'Some of them', 'Maybe');

-- KPI 5: Difficulty of taking mental health leave in tech vs non-tech companies
SELECT
    tech_company,
    `leave` AS leave_difficulty,
    ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY tech_company), 2) AS percentage
FROM mental_health_clean
WHERE tech_company IS NOT NULL AND `leave` IS NOT NULL
GROUP BY tech_company, `leave`
ORDER BY tech_company DESC, FIELD(`leave`, 'Very easy', 'Somewhat easy', 'Don\'t know', 'Somewhat difficult', 'Very difficult');

-- Granular 1: Total respondents by treatment
SELECT treatment, COUNT(*) AS respondent_count
FROM mental_health_clean
WHERE treatment IS NOT NULL
GROUP BY treatment;

-- Granular 2: Treatment distribution by gender
SELECT gender, treatment, COUNT(*) AS respondent_count
FROM mental_health_clean
WHERE gender IS NOT NULL AND treatment IS NOT NULL
GROUP BY gender, treatment
ORDER BY FIELD(gender, 'Male', 'Female', 'Other'), FIELD(treatment, 'Yes', 'No');

-- Granular 3: Count of tech vs non-tech companies
SELECT tech_company, COUNT(*) AS company_count
FROM mental_health_clean
WHERE tech_company IS NOT NULL
GROUP BY tech_company;

-- Granular 4: Benefit distribution by company type
SELECT
    tech_company,
    benefits,
    ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY tech_company), 2) AS percentage
FROM mental_health_clean
WHERE tech_company IS NOT NULL AND benefits IS NOT NULL
GROUP BY tech_company, benefits
ORDER BY tech_company DESC, FIELD(benefits, 'Yes', 'No', 'Don\'t know');

-- Granular 5: Benefit distribution by company size
SELECT
    no_employees,
    benefits,
    ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY no_employees), 2) AS percentage
FROM mental_health_clean
WHERE no_employees IS NOT NULL AND benefits IS NOT NULL
GROUP BY no_employees, benefits
ORDER BY FIELD(no_employees, '1 - 5', '6 - 25', '26 - 100', '100 - 500', '500 - 1000', 'More than 1000'),
         FIELD(benefits, 'No', 'Don\'t know', 'Yes');

-- Granular 6: Treatment distribution by work setting
SELECT
    remote_work,
    treatment,
    ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY remote_work), 2) AS percentage
FROM mental_health_clean
WHERE remote_work IS NOT NULL AND treatment IS NOT NULL
GROUP BY remote_work, treatment
ORDER BY remote_work DESC, treatment DESC;

-- Granular 7: Remote vs on-site distribution
SELECT
    remote_work,
    COUNT(*) AS respondent_count,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE remote_work IS NOT NULL), 2) AS percentage
FROM mental_health_clean
WHERE remote_work IS NOT NULL
GROUP BY remote_work
ORDER BY remote_work DESC;

-- Granular 8: Willingness to talk to coworkers
SELECT
    coworkers AS response,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE coworkers IS NOT NULL), 2) AS percentage
FROM mental_health_clean
WHERE coworkers IS NOT NULL
GROUP BY coworkers
ORDER BY FIELD(response, 'Yes', 'No', 'Some of them');

-- Granular 9: Willingness to talk to supervisors
SELECT
    supervisor AS response,
    COUNT(*) AS respondent_count,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE supervisor IS NOT NULL), 2) AS percentage
FROM mental_health_clean
WHERE supervisor IS NOT NULL
GROUP BY supervisor;

-- Granular 10: Comparison of coworkers vs supervisors
WITH comparison AS (
    SELECT 'Coworkers' AS group_type, coworkers AS response,
           COUNT(*) AS respondent_count,
           ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY 'Coworkers'), 2) AS percentage
    FROM mental_health_clean
    WHERE coworkers IS NOT NULL
    GROUP BY coworkers

    UNION ALL

    SELECT 'Supervisors' AS group_type, supervisor AS response,
           COUNT(*) AS respondent_count,
           ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY 'Supervisors'), 2) AS percentage
    FROM mental_health_clean
    WHERE supervisor IS NOT NULL
    GROUP BY supervisor
)
SELECT * FROM comparison
ORDER BY group_type, FIELD(response, 'Yes', 'No', 'Maybe', 'Some of them');

-- Granular 11: Perceived consequences of disclosing mental health issues
SELECT
    mental_health_consequence AS consequence,
    COUNT(*) AS respondent_count,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE mental_health_consequence IS NOT NULL), 2) AS percentage
FROM mental_health_clean
WHERE mental_health_consequence IS NOT NULL
GROUP BY mental_health_consequence
ORDER BY FIELD(consequence, 'Yes', 'No', 'Maybe');

-- Granular 12: Perception of equality between mental and physical health
SELECT
    mental_vs_physical AS perception,
    COUNT(*) AS respondent_count,
    ROUND(COUNT(*) * 100 / (SELECT COUNT(*) FROM mental_health_clean WHERE mental_vs_physical IS NOT NULL), 2) AS percentage
FROM mental_health_clean
WHERE mental_vs_physical IS NOT NULL
GROUP BY mental_vs_physical
ORDER BY FIELD(perception, 'Yes', 'No', 'Don\'t know') ;

-- Granular 13: Comparison of leave difficulty across company types
SELECT
    tech_company,
    `leave` AS leave_difficulty,
    COUNT(*) AS respondent_count,
    ROUND(COUNT(*) * 100 / SUM(COUNT(*)) OVER (PARTITION BY tech_company), 2) AS percentage
FROM mental_health_clean
WHERE tech_company IS NOT NULL AND `leave` IS NOT NULL
GROUP BY tech_company, `leave`
ORDER BY tech_company DESC, FIELD(`leave`, 'Very easy', 'Somewhat easy', 'Don\'t know', 'Somewhat difficult', 'Very difficult');