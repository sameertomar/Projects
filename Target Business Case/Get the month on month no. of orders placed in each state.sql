SELECT
 customer_state
 ,Purchase_year
,purchase_month
,Count(order_id) AS CountOfOrders
,CONCAT(ROUND((Count(order_id)/(LAG(Count(order_id))OVER(PARTITION BY customer_state,Purchase_year ORDER BY Purchase_year,purchase_month ASC))-1)*100,2)," %") as MoM_GrowthOnOrders
FROM
(select
 DISTINCT O.order_id
,order_purchase_timestamp
,EXTRACT(YEAR FROM order_purchase_timestamp) as Purchase_year
,EXTRACT(Month FROM order_purchase_timestamp) as Purchase_month
,customer_state
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_items` OI ON OI.order_id =O.order_id
LEFT JOIN `Target_Case_Study.customers` C ON C.customer_id = O.customer_id)
GROUP BY customer_state,purchase_month,purchase_year
ORDER BY customer_state,purchase_year,purchase_month