{% macro split_part(string_text, delimiter_text, part_number, output_type='text') %}

{{adapter.dispatch('split_part')(string_text, delimiter_text, part_number, output_type)}}

{% endmacro %}

{% macro default__split_part(string_text, delimiter_text, part_number, output_type='text') %}

    CAST({{ dbt_utils.split_part(string_text, delimiter_text, part_number) }} AS {{data_type(output_type)}})

{% endmacro %}

