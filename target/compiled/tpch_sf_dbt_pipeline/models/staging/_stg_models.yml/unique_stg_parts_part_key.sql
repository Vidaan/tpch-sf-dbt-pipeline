
    
    

select
    part_key as unique_field,
    count(*) as n_records

from DBT_DB.DBT_SCH.stg_parts
where part_key is not null
group by part_key
having count(*) > 1


