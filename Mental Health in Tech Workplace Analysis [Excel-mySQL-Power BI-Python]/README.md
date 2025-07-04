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
├── 📄 README.md                       ← Main documentation: overview, objectives, tools, insights
├── 📄 business_requirements.md        ← Business goals, KPIs, and analysis questions
│
├── 📂 Asset/                          ← Supporting assets for Power BI UX or documentation
│   └── Open Menu Button Image.png
│
├── 📂 Data/                        
│   ├── mental_health_raw.csv          ← Original dataset (Kaggle)
│   └── mental_health_clean.csv        ← Cleaned version used for SQL and Power BI
│
├── 📂 Excel/                      
│   ├── mental_health_clean.xlsx       ← Final cleaned data (Power Query)
│   └── power_query_script.txt         ← Exported steps from Power Query (Advanced Editor)
│
├── 📂 mySQL/                      
│   └── mental_health_analysis.sql     ← SQL scripts for exploratory analysis
│
├── 📂 Power BI/                  
│   ├── Mental Health Dashboard.pbix   ← Final interactive Power BI dashboard
│   └── Mental Health Dashboard.pdf    ← Static exported version (for preview or documentation)
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

## 🐍 Python Analysis + Summary Table

To validate the observed trends and confirm whether associations between variables were statistically significant, I used **Chi-Square Test** and **Cramér’s V** in Python.

### 🔬 What was done:
- Built reusable functions to compute chi-squared significance and relationship strength (Cramér’s V)
- Compared categorical variables like gender vs treatment, remote work vs treatment, etc.
- Focused on relationships that support or challenge earlier Power BI insights

### 📊 Key Results:

| Variable 1     | Variable 2     | Chi²   | p-value | Cramér’s V | Interpretation                             |
|----------------|----------------|--------|---------|-------------|---------------------------------------------|
| remote_work    | treatment      | 0.69   | 0.4047  | 0.024       | No significant association, negligible strength |
| tech_company   | benefits       | 9.31   | 0.0095  | 0.086       | Statistically significant, but negligible strength |
| coworkers      | supervisor     | 480.84 | 0.0000  | 0.439       | Strong and highly significant association   |
| gender         | treatment      | 51.17  | 0.0000  | 0.202       | Moderate and significant association        |

🧾 See the full code and results:  
[`Python/Mental_Health_in_Tech_Survey_Analysis.ipynb`](./Python/Mental_Health_in_Tech_Survey_Analysis.ipynb)

## 💡 Key Insights

🔹 **Half of the respondents (50.48%) have sought mental health treatment**, indicating a significant prevalence of mental health concerns in the tech workplace.

🔹 **Tech companies are more likely to offer mental health benefits**, but not by a large margin — highlighting a potential gap even within progressive industries.

🔹 **Remote workers are slightly more likely to seek treatment** (52.43%) than on-site workers (49.66%), but the difference was **not statistically significant**.

🔹 **Employees feel more comfortable discussing mental health with coworkers than supervisors**, suggesting cultural or structural barriers within organizations.

🔹 **The ability to take mental health leave varies greatly**, with non-tech companies more often reporting it as "somewhat difficult" or "very difficult".

🔹 **Gender has a moderate and statistically significant impact** on treatment-seeking behavior, showing the need for more inclusive support strategies.

🔹 **Perceptions of stigma still exist**, with many respondents believing there are negative consequences to discussing mental health at work.

---

These insights were derived through a combination of SQL queries, Power BI dashboards, and statistical validation using Python.

## 📂 Data Source

The dataset used in this project comes from:

📦 [Mental Health in Tech Survey (2014) – Kaggle](https://www.kaggle.com/datasets/osmi/mental-health-in-tech-survey)

- Collected by Open Sourcing Mental Illness (OSMI)
- Contains 1,200+ responses from employees in the tech industry
- Covers mental health treatment, company support, openness, and stigma
- Original data was cleaned and processed before analysis

🔍 Note: The survey was conducted in **2014**, which may affect how the findings apply to the current tech landscape.

## 🙋 About Me + What I Learned

Hi! I'm **Revan**, an aspiring data analyst with a background in actuarial science and a growing passion for turning messy data into meaningful stories.

This project was my first full-cycle data analysis—from raw data to final dashboard—and taught me how to:
- Perform structured **ETL** using Power Query
- Write efficient **SQL** queries for analytical questions
- Build clean and interactive **Power BI dashboards**
- Validate insights with **Python statistical tests**
- Organize and document projects like a professional portfolio

Each tool used in this project served a unique purpose, and working through all of them helped me develop both technical and analytical thinking in a real-world context.

Thank you for exploring this project 🙌
