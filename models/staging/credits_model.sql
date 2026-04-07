{{ config(materialized='incremental', unique_key='movie_id', file_format='delta', tags='') }}

with source_data as (
    select *
    from {{ ref('credits') }}
)

select *
from source_data
