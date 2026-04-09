{{ config(materialized='table',schema='dbt_silver', unique_key='movie_id', tags=['credits','silver',]) }}

with source_data as (
    select *
    from {{ ref('credits') }}
)

select *
from source_data
where movie_id is not null


