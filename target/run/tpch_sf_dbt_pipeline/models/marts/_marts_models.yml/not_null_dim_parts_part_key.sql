select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select part_key
from DBT_DB.DBT_SCH.dim_parts
where part_key is null



      
    ) dbt_internal_test