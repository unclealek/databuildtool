{{ config(materialized='incremental', unique_key='movie_id', tags=['credits','staging','incremental']) }}

with source_data as (
    select *
    from {{ ref('credits') }}
)

select *
from source_data
