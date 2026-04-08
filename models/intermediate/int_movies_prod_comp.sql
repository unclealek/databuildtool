{{ config(unique_key='movie_id', tags=['movies','intermediate','prod_comp']) }}

with movies as (
    select *
    from {{ ref('movies_model') }}
)

select
    movies.id as movie_id,
    company.id as company_id,
    company.name as company_name
from movies
lateral view explode(
    from_json(movies.production_companies, 'array<struct<id:int,name:string>>')
) exploded_companies as company
