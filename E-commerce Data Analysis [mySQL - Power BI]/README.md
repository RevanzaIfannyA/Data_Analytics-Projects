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

