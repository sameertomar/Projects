select review_score,COUNT(Distinct O.order_id) as orderCnt
FROM `Target_Case_Study.orders` O
LEFT JOIN `Target_Case_Study.order_reviews` R ON R.order_id = O.order_id
Group by review_score
Order by review_score