with movies as (
    select *
    from {{ ref('movies_model') }}
)

select
    movies.id as movie_id,
    genre.id as genre_id,
    genre.name as genre_name
from movies
cross join inline(from_json(movies.genres, 'array<struct<id:int,name:string>>')) as genre
