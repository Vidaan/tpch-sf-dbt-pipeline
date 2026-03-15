with orders as (
    select * from {{ ref('stg_orders') }}
),

lineitems as (
    select * from {{ ref('stg_lineitems') }}
),

customers as (
    select * from {{ ref('dim_customers') }}
)

select
    o.order_key,
    o.customer_key,
    c.customer_name,
    c.market_segment,
    c.nation_name as customer_nation,
    c.region_name as customer_region,
    o.order_status,
    o.order_date,
    o.order_priority,
    o.clerk,
    count(l.line_number) as line_item_count,
    sum(l.quantity) as total_quantity,
    sum(l.extended_price) as gross_amount,
    sum(l.extended_price * (1 - l.discount)) as net_amount,
    sum(l.extended_price * (1 - l.discount) * (1 + l.tax)) as total_amount
from orders o
left join lineitems l on o.order_key = l.order_key
left join customers c on o.customer_key = c.customer_key
group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
