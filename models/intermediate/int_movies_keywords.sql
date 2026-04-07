with movies as (
    select *
    from {{ ref('movies_model') }}
)

select
    movies.id as movie_id,
    keyword.id as keyword_id,
    keyword.name as keyword_name
from movies
cross join inline(from_json(movies.keywords, 'array<struct<id:int,name:string>>')) as keyword
