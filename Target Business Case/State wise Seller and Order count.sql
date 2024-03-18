SELECT customer_state,CntOrders,IF(sellerCnt is null,0,sellerCnt) as SellerCnt
FROM
(select customer_state,count(order_id) as CntOrders
from `Target_Case_Study.orders` O
left join `Target_Case_Study.customers` C ON C.customer_id = O.customer_id
group by customer_state) C
LEFT JOIN (SELECT seller_state,count(seller_id) as sellerCnt
FROM `Target_Case_Study.sellers`
group by seller_state) SS ON SS.seller_state = C.customer_state
order by CntOrders DESC