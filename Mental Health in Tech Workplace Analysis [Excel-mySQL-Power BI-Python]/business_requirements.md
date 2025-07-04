# 📄 Business Requirements – Mental Health in Tech Survey (2014)

This document outlines the business goals, key performance indicators (KPIs), and analytical questions that guided the development of this project.

---

## 🧠 Background

Mental health in the workplace—especially in fast-paced industries like tech—is becoming an increasingly important topic. This project explores the **2014 Mental Health in Tech Survey**, which collected responses from employees across tech and non-tech companies regarding mental health attitudes, resources, and experiences in the workplace.

---

## 🎯 Project Objectives

- Understand treatment-seeking behavior among employees
- Evaluate mental health benefit availability across companies
- Assess workplace openness toward discussing mental health
- Investigate perception gaps between mental and physical health support
- Validate findings statistically for data-driven conclusions

---

## 📌 Key Performance Indicators (KPIs)

These high-level metrics were chosen to drive business understanding:

1. **Treatment Rate**  
   → What percentage of employees sought mental health treatment?

2. **Benefit Coverage: Tech vs Non-Tech**  
   → Are tech companies more likely to offer mental health benefits?

3. **Remote vs On-site Treatment Rate**  
   → Are remote workers more likely to seek mental health treatment?

4. **Openness to Talk About Mental Health**  
   → How open are employees to discussing mental health with coworkers, supervisors, or in interviews?

5. **Ease of Taking Mental Health Leave (Tech vs Non-Tech)**  
   → Do tech companies provide more accessible leave policies?

---

## 🔍 Granular Requirements (Exploratory SQL Analysis)

To support and complement the KPIs, the following detailed questions were answered through SQL:

1. Distribution of treatment (`treatment`)
2. Treatment rate by gender (`gender`)
3. Count of tech vs non-tech companies (`tech_company`)
4. Benefits availability by company type (`benefits`)
5. Benefits availability by company size (`no_employees`)
6. Treatment rate by work mode (`remote_work`)
7. Distribution of remote vs on-site workers
8. Willingness to talk with coworkers
9. Willingness to talk with supervisors
10. Comparison of willingness (coworkers vs supervisors)
11. Perceived consequences of discussing mental health (`mental_health_consequence`)
12. Perceived importance of mental vs physical health (`mental_vs_physical`)
13. Leave policy accessibility by company type (`leave`)

These questions formed the foundation of the Power BI dashboard layout.

---

## 🧪 Additional Statistical Validation (Python)

Although SQL and visual tools show patterns, **statistical tests were used to validate whether those patterns are significant**.

### Chi-Square & Cramér’s V Tests:
1. `remote_work` vs `treatment`  
2. `tech_company` vs `benefits`  
3. `coworkers` vs `supervisor`  
4. `gender` vs `treatment`

The results helped confirm or reject assumptions derived from the dashboard.

---

## 📊 Output Delivery

All questions were addressed using:
- 💡 SQL analysis in `mySQL/mental_health_clean.sql`
- 📈 Power BI dashboard with 4 interactive pages
- 🐍 Python statistical notebook in `Python/Mental_Health_in_Tech_Survey_Analysis.ipynb`

This structure demonstrates how different tools can be used together to derive business insight from survey data.

---

## ✨ Business Impact

Understanding patterns in employee mental health engagement can:
- Help HR teams evaluate benefit effectiveness
- Inform leadership on openness and culture gaps
- Influence wellness programs and leave policies
