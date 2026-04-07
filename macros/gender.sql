{% macro gender_label(gender_col) %}
    case {{ gender_col }}
        when 1 then 'male'
        when 2 then 'female'
        else 'unknown'
    end
{% endmacro %}

{% macro gender(gender_col) %}
    {{ gender_label(gender_col) }}
{% endmacro %}
