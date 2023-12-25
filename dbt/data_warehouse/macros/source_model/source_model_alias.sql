{%- macro source_model_alias(source_name, source_table) -%}

{% set untrimmed = 'base_' ~ source_name ~ '_' ~ source_table if target.type == 'postgres' and target.name == 'prod' else source_name ~ '__' ~ source_table -%}

{%- do return(untrimmed[0:51] if target.type == 'postgres' else untrimmed) -%}

{%- endmacro -%}
