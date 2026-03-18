
  
    

        create or replace transient table DBT_DB.DBT_SCH.fct_orders_with_history
         as
        (WITH orders AS (
    SELECT * FROM DBT_DB.DBT_SCH.stg_orders
),

customer_history AS (
    SELECT * FROM DBT_DB.DBT_SCH.snap_customers
)

SELECT
    o.order_key,
    o.order_date,
    o.total_price,
    c.customer_key,
    c.customer_name AS customer_name,
    c.nation_key,
    c.market_segment
FROM orders o
LEFT JOIN customer_history c
    ON o.customer_key = c.customer_key
    AND o.order_date >= c.dbt_valid_from
    AND o.order_date < COALESCE(c.dbt_valid_to, '9999-12-31')
        );
      
  