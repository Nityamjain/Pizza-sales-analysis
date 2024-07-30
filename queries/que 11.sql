#Calculate the percentage contribution of each pizza type to total revenue.

SELECT pizza_types.category as category,
round(sum(order_details.quantity*pizzas.price)/(SELECT 
    ROUND(SUM(order_details.quantity * pizzas.price)) AS total_revenue
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id)*100,2 ) as percentage_destribution
FROM
    order_details
        JOIN
    pizzas ON order_details.pizza_id = pizzas.pizza_id
        JOIN
    pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    (SELECT 
        SUM(pizzas.price * order_details.quantity) AS total_revenue
    FROM
        order_details
    JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id) AS total
    group by category 
    order by  percentage_destribution desc
    

   

