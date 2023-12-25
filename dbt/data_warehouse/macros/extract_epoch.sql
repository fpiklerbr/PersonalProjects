{%- macro extract_epoch(col_name) -%}
  {{adapter.dispatch('extract_epoch')(col_name)}}
{%- endmacro -%}

{%- macro default__extract_epoch(col_name) -%}

extract('epoch' FROM CAST({{col_name}} AS interval))

{%- endmacro -%}

{%- macro bigquery__extract_epoch(col_name) -%}

{%- set col_string -%}
CAST({{col_name}} AS string)
{%- endset -%}
CASE
WHEN regexp_contains({{col_string}}, r'(?i)day')
THEN CAST(regexp_extract({{col_string}}, r'\d+') AS int64) * 86400
WHEN regexp_contains({{col_string}}, r'(?i)mon')
THEN CAST(regexp_extract({{col_string}}, r'\d+') AS int64) * 2592000
WHEN regexp_contains({{col_string}}, r'\:00\:00')
THEN CAST(regexp_extract({{col_string}}, r'(\d+)\:00\:00') AS int64) * 3600
END

{%- endmacro -%}

