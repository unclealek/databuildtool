{{ config(unique_key='movie_id', tags=['movies','intermediate','genres']) }}

with movies as (
    select *
    from {{ ref('movies_model') }}
)

select
    movies.id as movie_id,
    genre.id as genre_id,
    genre.name as genre_name
from movies
lateral view explode(
    from_json(movies.genres, 'array<struct<id:int,name:string>>')
) exploded_genres as genre
