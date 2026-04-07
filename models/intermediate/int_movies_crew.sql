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
cross join inline(
    from_json(
        credits.crew,
        'array<struct<credit_id:string,department:string,gender:int,id:int,job:string,name:string>>'
    )
) as crew_member
