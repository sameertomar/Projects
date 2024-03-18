SELECT  order_time,count(order_id) AS CountOfOrders
FROM
(SELECT *
,CASE WHEN EXTRACT(Hour from order_purchase_timestamp) >= 0 AND EXTRACT(Hour from order_purchase_timestamp) <= 6
     THEN 'Dawn'
     WHEN EXTRACT(Hour from order_purchase_timestamp) >= 7 AND EXTRACT(Hour from order_purchase_timestamp) <= 12
     THEN 'Mornings'
     WHEN EXTRACT(Hour from order_purchase_timestamp) >= 13 AND EXTRACT(Hour from order_purchase_timestamp) <= 18
     THEN 'Afternoon'
     WHEN EXTRACT(Hour from order_purchase_timestamp) >= 19 AND EXTRACT(Hour from order_purchase_timestamp) <= 23
     THEN 'Night'
     END AS order_time
FROM `Target_Case_Study.orders`
ORDER BY order_purchase_timestamp)
GROUP BY order_time