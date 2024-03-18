SELECT Purchase_month_name,CountOfOrders,avg_ords
FROM
(SELECT
  Purchase_month_name
 ,Count(order_id) AS CountOfOrders
 ,AVG(Count(order_id))OVER(PARTITION BY Purchase_month ) as avg_ords
FROM
(select 
  DISTINCT O.order_id
 ,order_purchase_timestamp
 ,EXTRACT(YEAR FROM order_purchase_timestamp) as Purchase_year
 ,format_datetime("%b %y",order_purchase_timestamp) as Purchase_month_name
 ,EXTRACT(MONTH FROM order_purchase_timestamp) as Purchase_month
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_items` OI ON OI.order_id =O.order_id)
GROUP BY Purchase_month_name,Purchase_month,Purchase_year
ORDER BY Purchase_year,Purchase_month)
ORDER BY avg_ords DESC