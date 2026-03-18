
  
    

        create or replace transient table DBT_DB.DBT_SCH.fct_order_items
         as
        (with lineitems as (
    select * from DBT_DB.DBT_SCH.stg_lineitems
),

parts as (
    select * from DBT_DB.DBT_SCH.dim_parts
),

suppliers as (
    select * from DBT_DB.DBT_SCH.dim_suppliers
)

select
    l.order_key,
    l.line_number,
    l.part_key,
    p.part_name,
    p.brand,
    l.supplier_key,
    s.supplier_name,
    s.nation_name as supplier_nation,
    s.region_name as supplier_region,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    l.extended_price * (1 - l.discount) as net_price,
    l.extended_price * (1 - l.discount) * (1 + l.tax) as total_price,
    l.return_flag,
    l.line_status,
    l.ship_date,
    l.commit_date,
    l.receipt_date,
    l.ship_mode
from lineitems l
left join parts p on l.part_key = p.part_key
left join suppliers s on l.supplier_key = s.supplier_key
        );
      
  