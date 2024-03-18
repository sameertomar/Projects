SELECT
Year
,Month
,((ROUND(SUM(CostOfOrder),2))) as Revenue
,CONCAT((ROUND(((ROUND(SUM(CostOfOrder),2))- (LAG(ROUND(SUM(CostOfOrder),2)) OVER(PARTITION BY Year ORDER BY Month)))/LAG(ROUND(SUM(CostOfOrder),2)) OVER(PARTITION BY Year ORDER BY Month) * 100,2)),"%") AS MonthOverMonthIncrease
FROM
(SELECT
order_purchase_timestamp
,EXTRACT(Year FROM order_purchase_timestamp) As Year
,EXTRACT(Month FROM order_purchase_timestamp) AS Month
,O.order_id,SUM(payment_value) AS CostOfOrder
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.payments` P ON O.order_id = P.order_id
WHERE EXTRACT(DATE FROM order_purchase_timestamp) BETWEEN "2017-01-01" AND "2017-08-31"
OR EXTRACT(DATE FROM order_purchase_timestamp) BETWEEN "2018-01-01" AND "2018-08-31"
GROUP BY order_purchase_timestamp,O.order_id
ORDER BY order_purchase_timestamp)
GROUP BY Year,Month
ORDER BY Year,Month