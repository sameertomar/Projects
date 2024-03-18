select seller_id ,count(Distinct O.order_id) as SellerOrderCount,ROUND(SUM(price + freight_value),2) AS revenue
from `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_items` OI ON OI.order_id = O.order_id
GROUP BY seller_id
ORDER BY SellerOrderCount DESC