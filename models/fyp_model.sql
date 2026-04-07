{{ config(materialized='table', file_format='delta') }}

with credits as (
    select * from {{ ref('credits_model') }}
),

movies as (
    select * from {{ ref('movies_model') }}
)

select
    c.movie_id,
    m.title,  
    m.homepage,
    m.tagline,
    m.release_date
from credits c
left join movies m
    on c.movie_id = m.id
