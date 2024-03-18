SELECT payment_type,year,Month,SUM(CntOfOrders) AS OrderCount
,CONCAT(ROUND((((SUM(CntOfOrders))-LAG(SUM(CntOfOrders))OVER(PARTITION BY payment_type,year ORDER BY year,Month))/LAG(SUM(CntOfOrders))OVER(PARTITION BY payment_type,year ORDER BY year,Month))*100,2),"%") AS MoMGrowthOnOrders
FROM
(SELECT payment_type
,EXTRACT(Year FROM O.order_purchase_timestamp) AS Year
,EXTRACT(Month FROM O.order_purchase_timestamp) AS Month
,(COUNT(Distinct O.order_id)) AS CntOfOrders
FROM `Target_Case_Study.orders` O
left join `Target_Case_Study.payments`  P ON P.order_id = O.order_id
where payment_type is not null
Group by payment_type,year,month
Order by payment_type,year,month)
GROUP BY payment_type,year,Month
ORDER BY payment_type,year,Month