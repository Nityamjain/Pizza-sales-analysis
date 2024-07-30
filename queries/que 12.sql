#Analyze the cumulative revenue generated over time.

select date , round(sum(revenue) over (order by date) ,3)as cumulative_revenue
from 
 (select orders.date as date , sum(pizzas.price*order_details.quantity) as revenue
from order_details
join orders
on order_details.order_id = orders.order_id
join pizzas 
on order_details .pizza_id = pizzas.pizza_id
group by date 
order by date ) as revenue_on_date