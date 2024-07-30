#Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_types.pizza_type_id AS Pizza_type,
    SUM(pizzas.price * order_details.quantity) AS revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY Pizza_type
ORDER BY revenue DESC
LIMIT 3