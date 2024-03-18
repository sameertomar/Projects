SELECT customer_unique_id AS customer_unique_id
FROM
(select distinct customer_unique_id,customer_state
from `Target_Case_Study.customers`)
group by customer_unique_id
having count(customer_unique_id)>1