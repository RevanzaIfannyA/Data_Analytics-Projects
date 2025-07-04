# 🧠 Mental Health in Tech Workplace – 2014 Survey Analysis

> 🗓️ **Dataset Year:** 2014  🧑‍💻 **Domain:** Tech Industry  📍 **Focus:** Mental Health, Workplace Support, Employee Perception

This project analyzes the 2014 **Mental Health in Tech Survey**, which collected responses from individuals working in the tech industry regarding mental health support, benefits, treatment-seeking behavior, and workplace culture.

The goal is to uncover trends and relationships between workplace environment, employee demographics, and mental health outcomes using a combination of **Excel**, **SQL**, **Power BI**, and **Python**.

📊 Data source: [Kaggle - Mental Health in Tech Survey (2014)](https://www.kaggle.com/datasets/osmi/mental-health-in-tech-survey)  
📎 Note: The dataset reflects attitudes and workplace conditions at the time. For more recent data, see the [2016 survey here](https://www.kaggle.com/datasets/osmi/mental-health-in-tech-2016).
## 🎯 Objective

The purpose of this project is to analyze employee perceptions and experiences regarding mental health in the tech industry. By leveraging multiple tools—Excel, MySQL, Power BI, and Python—this project aims to:

- Identify patterns in mental health treatment-seeking behavior
- Compare benefit coverage between tech and non-tech companies
- Understand employee openness to discussing mental health in the workplace
- Evaluate company policies related to leave and mental health support
- Validate insights with statistical tests to ensure data-driven conclusions

This end-to-end analysis showcases not only technical proficiency across different tools, but also critical thinking in deriving meaningful business insights from survey data.
## 🛠 Tools & Skills

This project was executed using the following tools and skillsets:

| Tool        | Purpose                                                                 |
|-------------|-------------------------------------------------------------------------|
| **Microsoft Excel (Power Query)** | Data cleaning, transformation, and preparation (ETL process) |
| **MySQL**   | Exploratory data analysis and aggregation through SQL queries           |
| **Power BI**| Dashboard development with slicers, KPI cards, and multi-page reports   |
| **Python (Pandas, SciPy, NumPy)** | Statistical testing (Chi-Square & Cramér's V) to validate patterns |

### 🧠 Key Skills Demonstrated:
- Data cleaning & wrangling using Power Query
- Writing structured SQL for grouped insights and comparisons
- Building interactive, multi-page Power BI dashboards
- Performing statistical validation with Python
## 📁 Project Structure

The repository is organized as follows:
```
Mental-Health-Analysis/
│
├── 📄 README.md                    ← Main documentation: overview, objectives, tools, insights
├── 📄 business_requirements.md    ← Business goals, KPIs, and analysis questions
│
├── 📂 Asset/                       ← Supporting assets for Power BI UX or documentation
│   └── Open Menu Button Image.png
│
├── 📂 Data/                        
│   ├── mental_health_raw.csv     ← Original dataset (Kaggle)
│   └── mental_health_clean.csv    ← Cleaned version used for SQL and Power BI
│
├── 📂 Excel/                      
│   ├── mental_health_clean.xlsx   ← Final cleaned data (Power Query)
│   └── power_query_script.txt     ← Exported steps from Power Query (Advanced Editor)
│
├── 📂 mySQL/                      
│   └── mental_health_analysis.sql ← SQL scripts for exploratory analysis
│
├── 📂 Power BI/                  
│   ├── Mental Health Dashboard.pbix ← Final interactive Power BI dashboard
│   └── Mental Health Dashboard.pdf  ← Static exported version (for preview or documentation)
│
└── 📂 Python/                    
    └── Mental_Health_in_Tech_Survey_Analysis.ipynb  ← Statistical validation using Chi-Square and Cramér's V
```
This structure demonstrates a clear data workflow from raw data to insight generation using four tools: Excel, SQL, Power BI, and Python.

## 📊 KPIs & Key Questions

This analysis was driven by 5 key performance indicators (KPIs), including:

- 📌 Percentage of respondents who sought mental health treatment  
- 📌 Benefit coverage comparison between tech vs non-tech companies  
- 📌 Treatment behavior based on remote vs on-site work  
- 📌 Openness to discuss mental health at work  
- 📌 Ease of taking mental health leave across company types

In addition, 13 granular business questions were answered through SQL and Power BI to provide deeper context and insight.

📄 For the complete list of KPIs and questions, see: [`business_requirements.md`](./business_requirements.md)

## 📥 Data Preparation (ETL Process)

The raw dataset contained inconsistencies such as:
- Invalid ages (e.g., below 18 or above 65)
- Diverse gender inputs (e.g., "Cis Male", "male-ish", etc.)
- Blank strings and placeholder values (e.g., "NA") treated as null

All cleaning and transformation steps were performed using **Power Query in Excel**, including:
- Filtering out unrealistic ages
- Grouping gender into `Male`, `Female`, and `Other`
- Replacing blanks with null values for accurate analysis
- Standardizing key categorical responses

📄 The full step-by-step logic is available in [`Excel/power_query_script.txt`](./Excel/power_query_script.txt)

## 🧮 SQL Analysis

After cleaning the data, exploratory analysis and KPI calculations were performed using **MySQL**.

Key SQL operations included:
- Aggregating treatment data by gender, company type, and work arrangement
- Comparing benefit availability across company sizes
- Measuring openness to discuss mental health with coworkers and supervisors
- Custom sorting using `FIELD()` for response clarity
- Window functions (`OVER`, `PARTITION BY`) for percentage breakdowns

This SQL work helped answer all KPIs and 13 supporting business questions before visualizing them in Power BI.

📄 See full query logic: [`mySQL/mental_health_analysis.sql`](./mySQL/mental_health_clean.sql)

## 📈 Power BI Dashboard

A 4-page interactive dashboard was built using **Power BI** to visualize patterns and insights from the mental health survey.

### 🧭 Key Features:
- **KPI Cards** summarizing treatment rate, benefit coverage, and leave accessibility
- **Custom slicer panel** accessible via a top-left toggle button
- **User guide tooltip** on the top-right to help first-time viewers interact (e.g., holding Ctrl when clicking)
- **Clean layout** with consistent color scheme and shadowed panels for better readability

### 📄 Dashboard Pages:
1. **Overview**  
   → KPIs, treatment breakdown, benefit availability, and leave accessibility comparison  
2. **Demographic Breakdown**  
   → Gender, age groups, self-employment, remote status, country-level distribution  
3. **Company Policies**  
   → Benefits by company size, leave by tech type, awareness of care options  
4. **Perceptions and Culture**  
   → Openness to talk, perceived consequences, and observed stigma

📁 Access the full report:  
- [`Power BI/Mental Health Dashboard.pbix`](./Power%20BI/Mental%20Health%20Dashboard.pbix)  
- [`Power BI/Mental Health Dashboard.pdf`](./Power%20BI/Mental%20Health%20Dashboard.pdf)
