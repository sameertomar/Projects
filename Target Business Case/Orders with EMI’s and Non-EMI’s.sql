WITH payments AS(SELECT P.order_id,payment_sequential,payment_type,payment_installments,payment_value
,case when P1.order_id is null
     THEN 'NO'
     ELSE 'YES' END AS EMI_Flag
FROM `Target_Case_Study.payments`  P
LEFT JOIN (select distinct order_id from `Target_Case_Study.payments`
where order_id IN (select order_id
from `Target_Case_Study.payments`
group by order_id
Having count(order_id)>1)) P1 ON P.order_id = P1.order_id)

SELECT emi_flag,COUNT(Distinct order_id),ROUND(SUM(payment_value),2) AS Revenue
from payments
group by emi_flag