select 
    n_nationkey as nation_key,
    n_name as nation_name,
    n_regionkey as region_key,
    n_comment as comment
from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.nation