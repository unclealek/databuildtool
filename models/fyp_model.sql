{{ config(materialized='table', file_format='delta') }}

with credits as (
    select
        movie_id
    from {{ ref('credits_model') }}
),

movies as (
    select
        id as movie_id,
        title,
        homepage,
        tagline,
        release_date
    from {{ ref('movies_model') }}
),

genres as (
    select
        movie_id,
        concat_ws(', ', sort_array(collect_set(genre_name))) as genre_names
    from {{ ref('int_movies_genres') }}
    group by movie_id
)

select
    credits.movie_id,
    movies.title,
    movies.homepage,
    movies.tagline,
    movies.release_date,
    genres.genre_names
from credits
left join movies
    on credits.movie_id = movies.movie_id
left join genres
    on credits.movie_id = genres.movie_id
