{%- macro datetime_tz(col_name, dtype, timezone) -%}
  {{adapter.dispatch('datetime_tz')(col_name, dtype, timezone)}}
{%- endmacro -%}


{%- macro default__datetime_tz(col_name, dtype, timezone) -%}
{%- if timezone -%}
    {%- set timezone_convert = "'" ~ timezone ~ "'" -%}
    CAST( {{col_name}} AS {{dtype}} ) AT TIME ZONE {{timezone_convert}}
{%- else -%}
    CAST( {{col_name}} AS {{dtype}} )
{%- endif -%}
{%- endmacro -%}


{%- macro bigquery__datetime_tz(col_name, dtype, timezone =None) -%}

{%- if timezone -%}
    {%- if timezone == 'Etc/UTC' and dtype in ['timestamp','timestamptz']-%}
        SAFE_CAST({{col_name}} AS timestamp)
    {%- elif timezone != 'Etc/UTC' and dtype in ['timestamp','timestamptz'] -%}
        {%- set timezone_convert = "'" ~ timezone ~ "'" -%}
            {%- if dtype == 'timestamp' -%}
            TIMESTAMP(SAFE_CAST({{col_name}} AS datetime), {{timezone_convert}})
            {%- else -%}
            DATETIME(SAFE_CAST({{col_name}} AS timestamp), {{timezone_convert}})
            {%- endif -%}
    {%- endif -%}
{%- else -%}
    {%- if dtype == 'date'-%}
        SAFE_CAST(SAFE_CAST({{col_name}} AS datetime) AS date)
    {%- elif dtype in ['timestamp','timestamptz'] -%}
        SAFE_CAST({{col_name}} AS timestamp)
    {%- endif -%}
{%- endif -%}

{%- endmacro -%}


{#
-- https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types
    #}
