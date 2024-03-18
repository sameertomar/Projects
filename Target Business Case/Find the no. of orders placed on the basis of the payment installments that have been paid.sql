SELECT payment_installments,count(order_id) as CntOfOrders
FROM `Target_Case_Study.payments`
GROUP BY payment_installments
ORDER BY payment_installments