{{ config(unique_key='movie_id', tags=['movies','intermediate','cast']) }}

with credits as (
    select *
    from {{ ref('credits_model') }}
)

select
    credits.movie_id,
    cast_member.cast_id,
    cast_member.character,
    cast_member.credit_id,
    cast_member.gender as gender_id,
    {{ gender_label('cast_member.gender') }} as gender_label,
    cast_member.id as person_id,
    cast_member.name as person_name,
    cast_member.order as cast_order
from credits
lateral view explode(
    from_json(
        credits.cast,
        'array<struct<cast_id:int,character:string,credit_id:string,gender:int,id:int,name:string,order:int>>'
    )
) exploded_cast as cast_member
