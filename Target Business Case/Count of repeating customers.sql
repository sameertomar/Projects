SELECT COUNT(Repeating_customer_unique_id) AS CountOfRepeatingCustomers
FROM
(SELECT  customer_unique_id AS Repeating_customer_unique_id
FROM `Target_Case_Study.customers`
GROUP BY customer_unique_id
HAVING COUNT(customer_id) > 1)