with customers as (
    select * from {{ref('stg_customers')}}
)
, nation as (
    select * from {{ref('stg_nations')}}
)
, regions as (
    select * from {{ref('stg_regions')}}
)

select
    c.customer_key,
    c.customer_name,
    c.address,
    c.phone,
    c.account_balance,
    c.market_segment,
    n.nation_name,
    r.region_name
from customers c
left join nations n on c.nation_key = n.nation_key
left join regions r on n.region_key = r.region_key