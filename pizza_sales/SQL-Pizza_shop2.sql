-- Retrieve the total number of orders placed.
select count(order_id) as total_orders from orders;


-- Calculate the total revenue generated from pizza sales. 
SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS total_sales
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id
    
-- Identify the highest-priced pizza
select
pt.name, p.price
from pizza_types pt join pizzas p
on pt.pizza_type_id=p.pizza_type_id
order by p.price desc limit 1;

-- Identify the most common pizza size ordered.
select 
p.size,count(od.order_id) as Quantity
from order_details od join pizzas p 
on od.pizza_id=p.pizza_id
group by p.size
order by Quantity desc;


-- List the top 5 most ordered pizza types along with their quantities.
select 
pt.name,sum(od.quantity) as quantity
from pizza_types pt join pizzas p 
on pt.pizza_type_id=p.pizza_type_id
join order_details od
on od.pizza_id=p.pizza_id
group by pt.name 
order by quantity desc 
limit 5;