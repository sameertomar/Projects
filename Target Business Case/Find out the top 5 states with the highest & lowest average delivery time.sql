WITH orders AS(SELECT C.customer_state,O.order_id,O.customer_id,O.order_status,order_purchase_timestamp,order_delivered_customer_date,order_estimated_delivery_date
,TIMESTAMP_DIFF(order_delivered_customer_date,order_purchase_timestamp,DAY) AS time_to_deliver
,TIMESTAMP_DIFF(order_estimated_delivery_date,order_delivered_customer_date,DAY) AS diff_estimated_delivery
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.customers` C ON O.customer_id = C.customer_id
WHERE order_status IN ('delivered')
AND order_delivered_customer_date IS NOT NULL
ORDER BY time_to_deliver)
(SELECT customer_state
,ROUND(SUM(time_to_deliver)/COUNT(order_id),2) AS avg_time_to_deliver
,CONCAT(ROW_NUMBER()OVER(ORDER BY (SUM(time_to_deliver)/COUNT(order_id)) DESC)," Highest") as Flag
FROM orders
GROUP BY customer_state
ORDER BY avg_time_to_deliver DESC LIMIT 5)
UNION ALL
(SELECT customer_state
,ROUND(SUM(time_to_deliver)/COUNT(order_id),2) AS avg_time_to_deliver
,CONCAT(ROW_NUMBER()OVER(ORDER BY (SUM(time_to_deliver)/COUNT(order_id)))," Lowest") as Flag
FROM orders
GROUP BY customer_state
ORDER BY avg_time_to_deliver LIMIT 5)