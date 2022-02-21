select 
    c.id as id,
    c.name as name,
    c.email as email,
    o.created_at as first_order_at,
    count(c.id) over (partition by c.id) as number_of_orders
from `analytics-engineers-club.coffee_shop.customers` as c
inner join `analytics-engineers-club.coffee_shop.orders` as o
on o.customer_id = c.id
group by c.id, c.name, c.email, o.created_at
order by first_order_at limit 5;