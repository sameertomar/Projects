SELECT Distinct customer_state
,ROUND(SUM(SUM(O.freight))OVER(PARTITION BY customer_state),2) AS StateWiseTotalFreight
,ROUND(AVG(ROUND(SUM(O.freight),2))OVER(PARTITION BY customer_state),2) AS avg_order_freight
FROM
(SELECT
O.order_id
,O.customer_id
,ROUND(SUM(freight_value),2) AS freight
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_items` P ON O.order_id = P.order_id
GROUP BY O.order_id,O.customer_id
ORDER BY O.order_id,O.customer_id) O
LEFT JOIN `Target_Case_Study.customers` C ON C.customer_id = O.customer_id
GROUP BY customer_state,O.order_id
ORDER BY StateWiseTotalFreight DESC