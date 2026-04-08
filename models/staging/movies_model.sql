{{ config(unique_key='id', tags=['movies','staging']) }}

with source_data as (
    select *
    from {{ ref('movies') }}
)

select *
from source_data
