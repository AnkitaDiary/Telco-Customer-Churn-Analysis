CREATE DATABASE telecom_db;
USE telecom_db;
CREATE TABLE telecom_customers (
    customerID VARCHAR(20),
    gender VARCHAR(10),
    SeniorCitizen VARCHAR(5),
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(5),
    OnlineBackup VARCHAR(5),
    DeviceProtection VARCHAR(5),
    TechSupport VARCHAR(5),
    StreamingTV VARCHAR(5),
    StreamingMovies VARCHAR(5),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges FLOAT,
    TotalCharges FLOAT,
    Churn VARCHAR(5),
    Partner_Flag TINYINT,
    Dependents_Flag TINYINT,
    PhoneService_Flag TINYINT,
    PaperlessBilling_Flag TINYINT,
    Churn_Flag TINYINT,
    OnlineSecurity_Flag TINYINT,
    OnlineBackup_Flag TINYINT,
    DeviceProtection_Flag TINYINT,
    TechSupport_Flag TINYINT,
    StreamingTV_Flag TINYINT,
    StreamingMovies_Flag TINYINT,
    tenure_group VARCHAR(10),
    MultipleLines_Flag TINYINT
);

SHOW TABLES;

DESCRIBE telecom_customers;

SELECT * FROM telecom_customers;

SELECT COUNT(*) AS total_customers,
               SUM(Churn_Flag) AS churned_customers,
               ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage,
               COUNT(*) - SUM(Churn_Flag) AS retained_customers
FROM telecom_customers;
    
--    Gender_Distribution: 
SELECT gender, COUNT(*) AS count, ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage
FROM telecom_customers
GROUP BY gender;

    
-- SeniorCitizen_Distribution
SELECT SeniorCitizen, COUNT(*) AS count, ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage
FROM telecom_customers
GROUP BY SeniorCitizen;
        
--  Partner_Distribution: 
SELECT Partner, COUNT(*) AS count, ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage 
FROM telecom_customers
GROUP BY Partner;

--    Dependents_Distribution:
SELECT Dependents, COUNT(*) AS count, ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage
FROM telecom_customers
GROUP BY Dependents;

 --  Segment_Churn_Advanced:
WITH segment_churn AS (
            SELECT gender, SeniorCitizen, Partner, Dependents,
                   COUNT(*) AS total_customers,
                   SUM(Churn_Flag) AS churned_customers,
                   ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage
            FROM telecom_customers
            GROUP BY gender, SeniorCitizen, Partner, Dependents
        )
SELECT *
FROM segment_churn
ORDER BY churn_rate_percentage DESC
LIMIT 10;

--    Tenure_Group_Distribution: 
SELECT tenure_group, COUNT(*) AS count, ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage
FROM telecom_customers
GROUP BY tenure_group
ORDER BY count DESC;

-- Tenure_Trend: 
  SELECT tenure, COUNT(*) AS customer_count,
               ROUND(SUM(TotalCharges),2) AS total_revenue,
               ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge,
               ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage
FROM telecom_customers
GROUP BY tenure
ORDER BY tenure;

    
-- Contract_Analysis
SELECT Contract, COUNT(*) AS customer_count,
ROUND(SUM(TotalCharges),2) AS total_revenue,
               ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge,
               ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage
        FROM telecom_customers
        GROUP BY Contract
        ORDER BY total_revenue DESC;
        
-- Service_Adoption_Counts:
SELECT 
	SUM(PhoneService_Flag) AS phone_service_count,
	SUM(MultipleLines_Flag) AS multiple_lines_count,
    SUM(OnlineSecurity_Flag) AS online_security_count,
	SUM(OnlineBackup_Flag) AS online_backup_count,
	SUM(DeviceProtection_Flag) AS device_protection_count,
	SUM(TechSupport_Flag) AS tech_support_count,
	SUM(StreamingTV_Flag) AS streaming_tv_count,
	SUM(StreamingMovies_Flag) AS streaming_movies_count
FROM telecom_customers;
        
--    'Service_Churn_Analysis': 
SELECT 'OnlineSecurity' AS service, SUM(OnlineSecurity_Flag) AS users,
               SUM(CASE WHEN Churn_Flag=1 THEN 1 ELSE 0 END) AS churned,
               ROUND(SUM(CASE WHEN Churn_Flag=1 THEN 1 ELSE 0 END)/SUM(OnlineSecurity_Flag)*100,2) AS churn_rate_percentage
FROM telecom_customers
        UNION ALL
SELECT 'OnlineBackup', SUM(OnlineBackup_Flag), SUM(CASE WHEN Churn_Flag=1 THEN 1 ELSE 0 END),
               ROUND(SUM(CASE WHEN Churn_Flag=1 THEN 1 ELSE 0 END)/SUM(OnlineBackup_Flag)*100,2)
FROM telecom_customers
        UNION ALL
SELECT 'DeviceProtection', SUM(DeviceProtection_Flag), SUM(CASE WHEN Churn_Flag=1 THEN 1 ELSE 0 END),
               ROUND(SUM(CASE WHEN Churn_Flag=1 THEN 1 ELSE 0 END)/SUM(DeviceProtection_Flag)*100,2)
FROM telecom_customers;
        
--    Revenue_Summary: 
SELECT ROUND(SUM(TotalCharges),2) AS total_revenue,
               ROUND(AVG(TotalCharges),2) AS avg_revenue_per_customer
FROM telecom_customers;
        
--    Revenue_by_Contract_Tenure: 
SELECT Contract, tenure_group, COUNT(*) AS customer_count,
		ROUND(SUM(TotalCharges),2) AS total_revenue,
		ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge,
		RANK() OVER(PARTITION BY Contract ORDER BY SUM(TotalCharges) DESC) AS revenue_rank
FROM telecom_customers
GROUP BY Contract, tenure_group
ORDER BY total_revenue DESC;
        
-- Payment_Method_Analysis:
        SELECT PaymentMethod, COUNT(*) AS total_customers,
               SUM(Churn_Flag) AS churned_customers,
               ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage,
               ROUND(SUM(TotalCharges),2) AS total_revenue
        FROM telecom_customers
        GROUP BY PaymentMethod
        ORDER BY churn_rate_percentage DESC;

--  Paperless_Billing_Impact':
        SELECT PaperlessBilling, COUNT(*) AS total_customers,
               SUM(Churn_Flag) AS churned_customers,
               ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage,
               ROUND(SUM(TotalCharges),2) AS total_revenue
        FROM telecom_customers
        GROUP BY PaperlessBilling;

--    Combined_Segment_Analysis: 
WITH combined_segments AS (
            SELECT gender, SeniorCitizen, Partner, Dependents, Contract, tenure_group,
                   COUNT(*) AS total_customers,
                   SUM(Churn_Flag) AS churned_customers,
                   ROUND(AVG(Churn_Flag)*100,2) AS churn_rate_percentage,
                   ROUND(SUM(TotalCharges),2) AS total_revenue
	FROM telecom_customers
	GROUP BY gender, SeniorCitizen, Partner, Dependents, Contract, tenure_group
        )
SELECT *
FROM combined_segments
ORDER BY churn_rate_percentage DESC, total_revenue DESC
LIMIT 20;
    