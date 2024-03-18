select S.seller_state 
,COUNT(DISTINCT S.seller_id) AS SellerCnt
,count(Distinct O.order_id) as SellerOrderCount
,ROUND(SUM(price + freight_value),2) AS revenue
from `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_items` OI ON OI.order_id = O.order_id
LEFT JOIN `Target_Case_Study.sellers` S ON S.seller_id = OI.seller_id
GROUP BY S.seller_state
ORDER BY SellerOrderCount DESC