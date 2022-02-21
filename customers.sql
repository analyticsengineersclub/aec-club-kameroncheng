with customer_order as (
    select
    customer_id
    , count(*) as order_count
    , min(created_at) as first_order_date
from `analytics-engineers-club.coffee_shop.orders`
group by customer_id
)
select 
      c.id as customer_id
    , c.name as name
    , c.email as email
    , co.first_order_date as first_order_date
    , co.order_count as total_orders
    from `analytics-engineers-club.coffee_shop.customers` as c
join customer_order as co
on co.customer_id = c.id
limit 10;
