#Determine the distribution of orders by hour of the day.
SELECT 
    HOUR(time) AS hour, COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY hour
ORDER BY hour