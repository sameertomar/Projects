
select Distinct O.Order_id,O.order_purchase_timestamp,O.order_delivered_customer_date,O.order_status,OI.*,P.*
from `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_items` OI ON OI.order_id = O.order_id
LEFT JOIN `Target_Case_Study.payments` P ON P.order_id = O.order_id
where OI.order_id is null
and order_status IN ('created','shipped','unavailable')