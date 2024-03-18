SELECT
customer_state
,count(customer_id) as Customer_Count
,CONCAT(ROUND((count(customer_id)/(select count(Distinct customer_id) FROM `Target_Case_Study.customers`))*100,2),"%") AS Customer_State_Wise_Distribution
FROM `Target_Case_Study.customers` C
GROUP BY customer_state
ORDER BY Customer_Count DESC