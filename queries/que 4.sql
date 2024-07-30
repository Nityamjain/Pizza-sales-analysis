#Identify the most common pizza size ordered.
SELECT 
    pizzas.size, SUM(quantity) AS total_quantity
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY total_quantity DESC
LIMIT 1
