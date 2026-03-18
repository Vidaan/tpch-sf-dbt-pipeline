
  
    

        create or replace transient table DBT_DB.DBT_SCH.dim_parts
         as
        (select
    part_key,
    part_name,
    manufacturer,
    brand,
    part_type,
    size,
    container,
    retail_price
from DBT_DB.DBT_SCH.stg_parts
        );
      
  