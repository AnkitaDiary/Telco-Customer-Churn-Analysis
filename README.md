# Telco Customer Churn Analysis

## Project Overview
This project analyzes the Telco Customer Churn dataset to understand customer behavior, identify churn drivers, and evaluate how service adoption and contract types impact revenue. The goal is to provide data-driven recommendations for improving customer retention and strengthening revenue streams.

## Problem Statement
The company is experiencing customer churn, leading to revenue loss. To address this, I analyzed customer demographics, contract types, tenure, payment methods, and service adoption to:

- Identify which customer groups are most at risk of leaving  
- Pinpoint services and factors that encourage retention  
- Understand how churn and revenue are connected  

**Simplified goal:** Figure out who leaves, why they leave, and how to retain them.

## Tools & Technologies
- **SQL**: Descriptive analysis (churn rate, customer segments, revenue patterns)  
- **Python (Pandas, Seaborn, Matplotlib)**: Data cleaning, diagnostic analysis, and visual storytelling (correlations, churn drivers, revenue impact)  
- **Excel & PowerPoint**: Supporting visualizations and final storytelling presentation  
- **GitHub**: Documentation and version control  

## Analysis Performed

### Descriptive Analysis (What is happening?)
- Overall churn rate (~26%)  
- Customer breakdown by gender, senior citizens, partners, and dependents  
- Tenure group patterns and churn trends  
- Churn by contract type, billing method, and payment type  
- Service adoption counts and revenue contribution  

### Diagnostic Analysis (Why is it happening?)
- Performed **churn rate analysis by tenure group** using groupby and bar plots to compare early vs. long-tenure customers  
- Analyzed **churn by contract type** (Month-to-Month, One-Year, Two-Year) through visualizations to assess contract impact  
- Created **boxplots of MonthlyCharges and TotalCharges vs Churn** to evaluate revenue and churn relationships  
- Conducted **correlation analysis and heatmaps** for service adoption (Online Security, Tech Support, Backup, Streaming) against churn  
- Built **comparative plots** (e.g., Contract × MonthlyCharges × Churn) to examine interaction effects between revenue, contracts, and churn  

## Key Insights
- **Churn Rate:** ~26% of customers left, causing major revenue loss  
- **High-Risk Segments:** Senior citizens, month-to-month contracts, paperless billing, electronic check users  
- **Retention Drivers:** Longer contracts, service bundles, auto-pay adoption  
- **Revenue Stability:** Long-tenure and contract customers contribute the most revenue  

## Outcomes
- Developed a churn analysis report with both descriptive and diagnostic insights  
- Highlighted high-risk customer profiles and proposed targeted retention actions  
- Presented KPIs such as Churn %, ARPU (Average Revenue per User), and Revenue by Segment to support business decisions  

## Repository Structure
Telco-Customer-Churn-Analysis/
├── README.md                       # Project documentation
├── Raw_-Telco-Customer-Churn       # Raw dataset
├── Cleaned_dataset_Churn_Analysis  # Cleaned dataset
├── Customer_churn_analysis.sql     # SQL queries (MySQL)
├── sql_output_churn_analysis.xls   # Results of SQL queries
├── DESCRIPTIVE_ANALYSIS.ipynb      # Jupyter Notebook for descriptive analysis
├── DIAGNOSTIC_ANALYSIS.ipynb       # Jupyter Notebook for diagnostic analysis



## Next Steps
- Extend the analysis with a predictive churn ML model  
- Build an interactive dashboard (Tableau / Power BI / Plotly Dash)  
- Automate churn tracking and reporting pipelines  

## Author
**Ankita Dubey**  
*(Add your LinkedIn, GitHub, or email here)*  
