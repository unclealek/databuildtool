{{ config(unique_key='movie_id', tags=['movies','intermediate','crew']) }}

with credits as (
    select *
    from {{ ref('credits_model') }}
)

select
    credits.movie_id,
    crew_member.credit_id,
    crew_member.department,
    crew_member.gender as gender_id,
    {{ gender_label('crew_member.gender') }} as gender_label,
    crew_member.id as person_id,
    crew_member.job,
    crew_member.name as person_name
from credits
lateral view explode(
    from_json(
        credits.crew,
        'array<struct<credit_id:string,department:string,gender:int,id:int,job:string,name:string>>'
    )
) exploded_crew as crew_member
