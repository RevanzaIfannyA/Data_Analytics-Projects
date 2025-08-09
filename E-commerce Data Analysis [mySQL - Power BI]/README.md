# 🚀 E-Commerce Data Analysis | mySQL → Power BI
## 📄 Project Overview
This project focuses on analyzing e-commerce sales data using **mySQL** for data extraction, cleaning, and transformation, combined with **Power BI** for building interactive dashboards and insightful visualizations.  
The analysis aims to uncover sales trends, evaluate top and bottom-performing products, monitor profit margins, assess discount effectiveness, and identify key cities driving revenue.  

The dataset used in this project comes from [Kaggle - E-Commerce Sales Dataset](https://www.kaggle.com/datasets/shrishtimanja/ecommerce-dataset-for-data-analysis?) and has been processed to meet the business requirements.  
By leveraging these tools and techniques, the project provides actionable insights that can support data-driven decision-making and improve business performance.
## 📊 Dataset Explanation

This dataset contains **55,000 synthetic customer transactions**, generated using Python's **Faker** library.  
It is designed as a learning resource for exploring, analyzing, and applying various **data analysis techniques** in a context that closely mimics real-world data.

🔗 **Dataset on Kaggle:** [Customer Transactions Dataset](https://www.kaggle.com/datasets/darkhound/customer-transaction-dataset)

---

### **About the Dataset**
| Column Name               | Description |
|---------------------------|-------------|
| **CID (Customer ID)**     | Unique identifier for each customer. |
| **TID (Transaction ID)**  | Unique identifier for each transaction. |
| **Gender**                | Gender of the customer: Male or Female. |
| **Age Group**             | Age group of the customer, divided into ranges. |
| **Purchase Date**         | Timestamp of when the transaction occurred. |
| **Product Category**      | Category of the purchased product (e.g., Electronics, Apparel). |
| **Discount Availed**      | Indicates if the customer availed a discount (Yes/No). |
| **Discount Name**         | Name of the discount applied (e.g., FESTIVE50). |
| **Discount Amount (INR)** | Discount amount in Indian Rupees. |
| **Gross Amount**          | Total amount before applying discount. |
| **Net Amount**            | Final amount after applying discount. |
| **Purchase Method**       | Payment method used (e.g., Credit Card, Debit Card). |
| **Location**              | City where the purchase took place. |

---

⚠ **Note:**  
This is a **synthetic dataset** created solely for learning purposes using Python's Faker library.

## 🛠 Tools & Technologies

- **MySQL** – Used for data cleaning, transformation, and querying directly from the database.
- **Power BI** – Used for building interactive dashboards, connecting directly to the MySQL database, and applying minor adjustments using Power Query.

## Business Requirements

This project focuses on delivering insights into e-commerce performance by tracking and analyzing key business metrics (KPIs) such as:

- **Total Transactions** – How many unique transactions were recorded in the dataset?  
- **Total Revenue** – What is the total gross revenue and total net revenue?  
- **Average Net Amount per Transaction** – What is the average revenue generated from each transaction?  
- **Total Unique Customers** – How many distinct customers made purchases?  

For the full business requirements documentation, please refer to  
[`business_requirements.md`](./business_requirements.md)

## 📂 Project Structure
```
E-Commerce Data Analysis [mySQL - Power BI]/
│
├── 📄 README.md # Project documentation (this file)
├── 📄 business_requirements.md # Detailed business questions & KPIs
│
├── 📂 Data/
│ └── project1_df.csv # Raw dataset used for analysis
│
├── 📂 mySQL/
│ └── ecommerce_data_analysis_project.sql # SQL scripts for data analysis
│
└── 📂 Power BI/
├── E-Commerce Data Analysis.pbix # Power BI dashboard file
└── E-Commerce Data Analysis.pdf # Exported dashboard in PDF format
```

## 📌 Workflow / Methodology

The project follows a straightforward yet effective workflow to transform raw data into actionable dashboards:

1. **Data Acquisition**  
   - Download the dataset from Kaggle: [E-Commerce Dataset](https://www.kaggle.com/datasets/ahsan81/superstore-marketing-campaign-dataset)  
   - Store the dataset in MySQL database for further processing.

2. **Data Cleaning (MySQL)**  
   - Check each column for blank values.  
   - Replace any blank values with `NULL` to standardize missing data representation.  
   - Ensure data types are consistent across columns.

3. **Querying & KPI Preparation (MySQL)**  
   - Write SQL queries to extract metrics and aggregated data needed for analysis.  
   - Validate query outputs against the raw dataset to ensure accuracy.

4. **Data Connection & Light Adjustments (Power Query)**  
   - Connect Power BI directly to the MySQL database.  
   - Perform minor adjustments such as column renaming, filtering, and type conversions.

5. **Data Visualization (Power BI)**  
   - Build interactive dashboards and visualizations based on KPIs.  
   - Apply drill-down, slicers, and filters for dynamic analysis.  
   - Design intuitive layouts for better readability.

6. **Dashboard Export**  
   - Export the completed dashboard to PDF format for sharing and documentation.

## 📊 Dashboard Preview

You can view the complete interactive dashboard design in the PDF below:  

[📄 **E-Commerce Data Analysis Dashboard (PDF)**](Power%20BI/E-Commerce%20Data%20Analysis.pdf)

## 📊 Key Insights

1. **Credit Card Dominance Across All Genders**  
   Credit cards account for **40.17%** of all transactions, making them the most popular payment method overall. This trend is consistent across genders, with **Male (40.09%)**, **Female (40.25%)**, and **Other (40.18%)** segments all showing a similar preference. This indicates that credit card adoption is widespread and not significantly influenced by gender demographics.

2. **Electronics as the Leading Product Category**  
   The **Electronics** category leads with over **17K transactions**, followed by **Clothing**, **Beauty & Health**, **Sport & Fitness**, and **Home & Kitchen**. The dominance of electronics suggests a strong demand for high-value, tech-related products, which may contribute disproportionately to revenue.

3. **Mumbai as the Top Transaction Hub**  
   **Mumbai** records the highest number of transactions, followed by **Delhi**, **Bangalore**, **Hyderabad**, and **Chennai**. This concentration in metropolitan cities highlights the potential for targeted marketing and logistics optimization in urban centers.

4. **Prime Age Group for Customer Engagement**  
   Customers aged **25–45** form the largest segment by distinct customer count. This age group likely represents the most economically active and digitally engaged demographic, making them a key target for personalized marketing campaigns and loyalty programs.

## 💼 Business Impact

This e-commerce data analysis project delivers valuable insights that can directly influence strategic business decisions and operational improvements:

- **Optimized Payment Strategy**  
  The dominance of credit card transactions (over 40%) across all gender groups suggests opportunities to negotiate better partnerships or promotions with credit card providers. Businesses can also focus on enhancing credit card payment experiences to increase customer satisfaction and reduce cart abandonment.

- **Focused Product Marketing & Inventory Management**  
  Identifying **Electronics** as the leading product category with the highest transaction volume enables targeted marketing campaigns, optimized inventory stocking, and supplier negotiations. By prioritizing high-demand categories, the business can maximize revenue and reduce overstock costs in less popular categories.

- **Geographic Targeting for Growth**  
  With **Mumbai** and other major metros leading transaction counts, marketing budgets and logistics resources can be allocated more effectively to urban centers. This geographic insight supports localized promotions, faster delivery options, and tailored customer engagement strategies.

- **Customer Segmentation for Personalization**  
  Recognizing the **25–45 age group** as the prime customer segment allows the business to design personalized marketing campaigns, loyalty programs, and product recommendations tailored to the most active buyers, boosting customer retention and lifetime value.

- **Data-Driven Decision Making**  
  By integrating MySQL for data preparation and Power BI for visualization, the business benefits from up-to-date, interactive dashboards that empower stakeholders to monitor KPIs in real-time and respond quickly to market changes.

Overall, these insights equip the business with actionable intelligence to improve marketing effectiveness, enhance customer experience, streamline operations, and ultimately drive revenue growth.
