SELECT
 Purchase_year
 ,Count(order_id) AS CountOfOrders
 ,CONCAT(ROUND((Count(order_id)/(LAG(Count(order_id))OVER(ORDER BY Count(order_id) ASC))-1)*100,2)," %") as YoY_GrowthOnOrders_Count
FROM
(select 
  DISTINCT O.order_id
 ,order_purchase_timestamp
 ,EXTRACT(YEAR FROM order_purchase_timestamp) as Purchase_year
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_items` OI ON OI.order_id =O.order_id)
GROUP BY Purchase_year
ORDER BY Purchase_year ASC