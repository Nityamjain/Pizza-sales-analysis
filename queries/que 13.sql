#Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category, name, revenue 
from 
(select category, name , revenue ,
rank() over(partition by category order by revenue desc) as rn 
from
(SELECT 
    pizza_types.name AS name,
    pizza_types.category AS category,
    SUM(pizzas.price * order_details.quantity) AS revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY name , category) as revenue_by_type
) as table_2
where rn<=3

