{{ config(materialized='table', file_format='delta') }}

with source_data as (
    select *
    from {{ ref('movies') }}
)

select *
from source_data
