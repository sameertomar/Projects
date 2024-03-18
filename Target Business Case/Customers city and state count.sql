SELECT
  MIN(order_purchase_timestamp) as start_time
 ,MAX(order_purchase_timestamp) AS end_time
FROM
  `Target_Case_Study.orders`