# ElectroHub Sales Data Analysis Dashboard

## 📘 Overview

The **ElectroHub Sales Data Analysis Dashboard** is a business intelligence project designed to uncover valuable insights from a fictional retail company's sales data. Using **Power BI**, this dashboard provides interactive visualizations and dynamic filtering options to help stakeholders monitor performance, identify trends, and make data-driven decisions.

The dataset includes information about products, customers, promotions, and transactions across various cities and time periods. This project demonstrates my ability to clean, transform, and analyze data using Power BI, as well as to design a professional dashboard that answers key business questions.

This project was created as part of my learning journey through the [Complete Data Analyst Bootcamp: From Basics to Advanced](https://www.udemy.com/course/complete-data-analyst-bootcamp-from-basics-to-advanced/) course on Udemy. It serves as a practical application of the concepts covered throughout the course, from data preparation to interactive dashboard development.

## 🎯 Objectives

The primary objective of this project is to build an interactive Power BI dashboard that delivers actionable insights to business stakeholders of ElectroHub, a fictional electronics and retail company. Specifically, the project aims to:

- Analyze top and bottom-performing products based on sales, profit, and quantity sold.
- Explore sales trends across various time periods (daily, monthly, quarterly, yearly).
- Reveal the relationship between sales and profit using visual analytics.
- Compare business performance metrics between any two selected time periods.
- Calculate and display average discount by discount category.
- Track the total number of customer orders.
- Enable users to explore all relevant sales and promotional metrics using flexible filters (date, product, customer, promotion).
- Display geographic sales performance across multiple cities.

This dashboard serves as a hands-on exercise in applying data analytics and visualization skills using Power BI.

## ❓ Key Business Questions

This dashboard aims to answer the following business questions:

1. **What are the top and bottom 5 products** based on sales, profit, and quantity sold?
2. **How do sales trends evolve over time**, including daily, monthly, quarterly, and yearly periods?
3. **What is the relationship between sales and profit** across different product categories and time periods?
4. **How does performance compare between two user-defined periods** in terms of sales, profit, and quantity sold?
5. **What is the average discount offered** in each discount category?
6. **What is the total number of orders** placed?
7. **How do sales, profit, discount, and net sales vary** across filters such as product, date, customer ID, and promotion category?
8. **How are sales distributed across different cities?**

These questions were used to guide the development of visuals, filters, and comparative tools in the Power BI dashboard.

## 📦 Deliverables

The Power BI dashboard delivers the following features:

- ✅ **KPI Card** displaying the total number of orders placed across the entire dataset.
- 🔄 **Dual Date Range Comparison** using two slicers that allow users to select and compare metrics (e.g., Sales, Profit) between any two custom time periods.
- 📊 **Interactive Visuals** including bar charts, line charts, and tables to analyze:
  - Sales trends over time (daily, monthly, quarterly, yearly)
  - Top and bottom 5 products by sales, profit, and quantity sold
  - Relationship between sales and profit
  - Sales by different cities
  - Discount distribution by category
- 🔍 **Dynamic Filtering Capabilities** via slicers for:
  - Product
  - Date
  - Customer ID
  - Promotion Category

> 📝 Pie charts were intentionally excluded to maintain clarity and avoid misrepresentation of proportional data.

## 📂 Dataset Information

The dataset used in this project was provided as part of the [Complete Data Analyst Bootcamp on Udemy](https://www.udemy.com/course/complete-data-analyst-bootcamp-from-basics-to-advanced/). It represents sales and operational data from a fictional retail company named **ElectroHub**, which sells various product categories.

### 🧾 Key Tables:

- **Dim_Product**  
  Contains product-level details including name, category, subcategory, and product ID.

- **Dim_Customer**  
  Stores customer demographic information such as name, gender, and customer ID.

- **Dim_Promotion**  
  Details of promotions or discount schemes applied to products.

- **Fact_Table**  
  The main transactional data table that logs orders, sales, profit, quantity, discounts, and relevant foreign keys.

- **Measure_Table**  
  A table created in Power BI for defining calculated measures such as Total Sales, Total Profit, and custom metrics.

> 🗂 The dataset was cleaned, transformed, and loaded into Power BI using Power Query (M Language), with appropriate relationships set between dimensional and fact tables.

## 🛠 Tech Stack

This project was built using the following tools and technologies:

- **Power BI Desktop**  
  For building interactive dashboards, performing data transformation using Power Query, and creating visual reports.

- **Power Query (M Language)**  
  Used to perform Extract, Transform, Load (ETL) operations on the raw dataset to prepare it for analysis.

- **DAX (Data Analysis Expressions)**  
  For defining calculated columns, measures, and KPIs within Power BI.

- **Microsoft Excel (.xlsx)**  
  Dataset provided in Excel format, used as the data source in Power BI.

These tools were used collectively to extract insights, create dynamic slicers, visualize key metrics, and build an effective decision-support dashboard.

## 📁 Project Structure

The repository is organized as follows:

```

ElectroHub-Sales-Dashboard/
│
├── 📁 Data/                         # Contains the raw dataset used for analysis
│   └── 📄 Store+Data.xlsx           # Main dataset in Excel format
│
├── 📁 Power BI/                     # Main Power BI files for the project
│   ├── 📄 ElectroHub Sales Dashboard.pbix  # Power BI dashboard file
│   └── 📄 ElectroHub Sales Dashboard.pdf   # Exported PDF version of the dashboard
│
├── 📁 Power Query/                  # Power Query M code used for data transformation
│   ├── 📄 Dim Customers.txt         # Transformation script for the Customers table
│   ├── 📄 Dim Product.txt           # Transformation script for the Product table
│   ├── 📄 Dim Promotion.txt         # Transformation script for the Promotion table
│   ├── 📄 Fact Table.txt            # Transformation script for the Fact table
│   └── 📄 Measure Table.txt         # Script for DAX measures used in the report
│
├── 📄 business_requirements.md      # Business questions and objectives of the analysis
└── 📄 README.md                     # Main project documentation
            

```

> Note: You may rename folders or files as needed, but keep the logical structure for clarity.

## 📌 How to Use

To explore and interact with the dashboard, follow these steps:

1. **Download the Power BI File**  
   Navigate to the [`Power BI`](./Power%20BI/ElectroHub%20Sales%20Dashboard.pbix) folder and open the `.pbix` file using [Microsoft Power BI Desktop](https://powerbi.microsoft.com/desktop/).

2. **Interact with the Dashboard**  
   - Use slicers to filter data by product, customer, date range, and promotion category.
   - Use the dual-date slicers to compare sales, profit, or quantity sold across two different time periods.
   - Hover over charts and visuals for tooltips and detailed insights.

3. **View Dashboard as PDF (Optional)**  
   If you don’t have Power BI Desktop, you can preview the dashboard in a static format by opening the PDF version found in the [`Power BI`](./Power%20BI/ElectroHub%20Sales%20Dashboard.pdf) folder.

> ℹ️ Ensure Power BI Desktop is installed to fully experience the interactive capabilities of the dashboard.

