
  create or replace   view DBT_DB.DBT_SCH.stg_regions
  
   as (
    select 
    r_regionkey as region_key,
    r_name as region_name,
    r_comment as comment
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.region
  );

