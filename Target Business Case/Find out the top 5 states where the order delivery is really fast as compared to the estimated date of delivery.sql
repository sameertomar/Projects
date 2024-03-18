WITH orders AS(SELECT C.customer_state,O.order_id,O.customer_id,O.order_status,order_purchase_timestamp,order_delivered_customer_date,order_estimated_delivery_date
,TIMESTAMP_DIFF(order_delivered_customer_date,order_purchase_timestamp,DAY) AS time_to_deliver
,TIMESTAMP_DIFF(order_estimated_delivery_date,order_delivered_customer_date,DAY) AS diff_estimated_delivery
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.customers` C ON O.customer_id = C.customer_id
WHERE order_status IN ('delivered')
AND order_delivered_customer_date IS NOT NULL
ORDER BY diff_estimated_delivery DESC)
(SELECT customer_state AS Fastest_DeliveryCustomer_States
,ROUND(SUM(diff_estimated_delivery)/COUNT(order_id),2) AS DeliveryWithinDays
FROM orders
GROUP BY customer_state
ORDER BY DeliveryWithinDays ASC LIMIT 5)