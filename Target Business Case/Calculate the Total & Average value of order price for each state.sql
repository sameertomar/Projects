SELECT Distinct customer_state
,SUM(SUM(O.CostOfOrder))OVER(PARTITION BY customer_state) AS StateWiseRevenue
,ROUND(AVG(ROUND(SUM(O.CostOfOrder),2))OVER(PARTITION BY customer_state),2) AS avg_order_price
FROM
(SELECT
O.order_id
,O.customer_id
,ROUND(SUM(payment_value),2) AS CostOfOrder
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.payments` P ON O.order_id = P.order_id
GROUP BY O.order_id,O.customer_id
ORDER BY O.order_id,O.customer_id) O
LEFT JOIN `Target_Case_Study.customers` C ON C.customer_id = O.customer_id
GROUP BY customer_state,O.order_id
ORDER BY StateWiseRevenue DESC