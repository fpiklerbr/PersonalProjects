{%- macro data_type(dtype) -%}
  {{adapter.dispatch('data_type')(dtype)}}
{%- endmacro -%}

{%- macro default__data_type(dtype) -%}
    {{dtype}}
{%- endmacro -%}

{%- macro bigquery__data_type(dtype) -%}

{%- if dtype in ['float', 'float8', 'float4'] -%}
    {%- set bq_dtype = 'float64' -%}
{%- elif dtype in ['bigint', 'smallint', 'int', 'integer'] -%}
	{%- set bq_dtype = 'int64' -%}
{%- elif dtype in ['text','interval'] -%}
	{%- set bq_dtype = 'string' -%}
{%- elif dtype in ['decimal','numeric','real'] -%}
	{%- set bq_dtype = 'numeric' -%}
{%- elif dtype == 'timestamp' -%}
	{%- set bq_dtype = 'datetime' -%}
{%- elif dtype == 'timestamptz' -%}
	{%- set bq_dtype = 'timestamp' -%}
{%- elif dtype == 'date' -%}
	{%- set bq_dtype = 'date' -%}
{%- elif dtype == 'text[]' -%}
	{%- set bq_dtype = 'ARRAY<STRING>' -%}
{%- elif dtype == 'int[]' -%}
	{%- set bq_dtype = 'ARRAY<INT64>' -%}
{%- elif dtype in ('json','jsonb') -%}
	{%- set bq_dtype = 'string' -%}
{%- elif dtype in ('bool','boolean') -%}
	{%- set bq_dtype = 'boolean' -%}
{%- endif -%}
    {{bq_dtype}}

{%- endmacro -%}