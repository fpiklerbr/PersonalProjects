{#
----
stp1, create a regex and strftime pattern dict
-- # PG time format vs BQ time format
'DD':'%d'
'MM':'%m'
'YYYY':'%Y'
'YY':'%y'
'HH24':'%H'
'MI':'%M'
'SS':'%E*S'
'SS':'%S'
-- # BQ time format explanation
%d	Day of the month as a zero-padded decimal number.	30
%m	Month as a zero-padded decimal number.	09
%y	Year without century as a zero-padded decimal number.	13
%Y	Year with century as a decimal number.	2013
%H	Hour (24-hour clock) as a zero-padded decimal number.	07
%I	Hour (12-hour clock) as a zero-padded decimal number.	07
%M	Minute as a zero-padded decimal number.	06
%S	Second as a zero-padded decimal number.	05
%Z	The time zone name.	UTC-5
%z	The offset from the Prime Meridian in the format +HHMM
    or -HHMM as appropriate, with positive values
    representing locations east of Greenwich.	     -0500
%Ez	 RFC 3339-compatible numeric time zone (+HH:MM or -HH:MM).	-05:00
-------------
%S.%f -> %f	Microsecond as a decimal number, zero-padded on the left.	000000
%E*S Seconds with full fractional precision (a literal '*'). %E*S -> 00.*
%E#S Seconds with # digits of fractional precision.	   %E3S ->  00.000
-- # capture of zero-padded "Mon: 08" or "Mon: 8"
in bq , parse_date can handle both '2020-1-1' and '2020-01-01' in the same format as well as in PG
----
stp2 example:
-- CASE
--   WHEN {{ regexp_contains(col_name = 'pick_up_date', pattern = "'[0-9]{2}/[0-9]{2}/[0-9]{4}'", similar = True, case_sensitive = True) }}
--   THEN {{ to_date("pick_up_date", "'DD/MM/YYYY'") }}
-- END AS pick_up_date
----
stp3 to_date and to_timestamp merge:
the PG & BQ functions both parse the timestamp and return an aware timestamp, and both represent in UTC
-- CAST(timestamp as date) working in BQ, whereas CAST('timestamp string' as date) failed
----
#}

{%- macro standard_time_format() -%}

    {{- return({  '%d':  ['[0-9]{1,2}','DD']
                , '%m':  ['[0-9]{1,2}','MM']
                , '%y':  ['[0-9]{2}','YY']
                , '%Y':  ['[0-9]{4}','YYYY']
                , '%H':  ['[0-9]{1,2}','HH24']
                , '%M':  ['[0-9]{2}','MI']
                , '.%f': ['.*','']
                , '%S':  ['[0-9]{2}','SS']
                , '%Z':  ['UTC.*', '']
                , '%z':  ['-[0-9]{4}','']
 }) -}}

{%- endmacro -%}

{%- macro regex_time_format(pattern) -%}

    {%- set format_dict = standard_time_format() -%}
    {%- set regex_result_list = [pattern] %}
    {%- for key in format_dict.keys() -%}
      {% set regex_format = format_dict.get(key)[0] %}
         {% set one_result = regex_result_list[regex_result_list|length - 1]|replace(key, regex_format) %}
            {% do regex_result_list.append(one_result) %}
    {%- endfor %}
    {%- set result = "'^" ~ regex_result_list[regex_result_list|length - 1][1:-1] ~ "$'" -%}
    {{- return(result) -}}

{%- endmacro -%}

{%- macro pg_time_format(pattern) -%}

    {%- set format_dict = standard_time_format() -%}
    {%- set pg_result_list = [pattern] %}
    {%- for key in format_dict.keys() -%}
      {% set pg_format = format_dict.get(key)[1] %}
         {% set one_result = pg_result_list[pg_result_list|length - 1]|replace(key, pg_format) %}
            {% do pg_result_list.append(one_result) %}
    {%- endfor %}
    {{- return(pg_result_list[pg_result_list|length - 1]) -}}

{%- endmacro -%}


{%- macro string_to_timestamptz(timestamp_string, format_string, output_type='timestamptz') -%}
  {{adapter.dispatch('string_to_timestamptz')(timestamp_string, format_string, output_type)}}
{%- endmacro -%}

{% macro default__string_to_timestamptz(timestamp_string, format_string, output_type='timestamptz') %}

    {%- set regex_pattern = regex_time_format(pattern=format_string) -%}
    {%- set pg_pattern = pg_time_format(pattern=format_string) -%}
    {%- set main_body -%}
        CASE
          WHEN {{-regexp_contains(col_name=timestamp_string, pattern=regex_pattern, similar=True, case_sensitive=False)-}}
          THEN  to_timestamp({{timestamp_string}}, {{pg_pattern}})
        END
    {%- endset -%}

    {{dbt_utils.safe_cast(field=main_body, type=data_type(output_type))}}

{% endmacro %}


{% macro bigquery__string_to_timestamptz(timestamp_string, format_string, output_type='timestamptz') %}

    {%- set regex_pattern = regex_time_format(pattern=format_string) -%}
    {%- set bq_format_string = format_string|replace('%S.%f', '%E*S') -%}
    {%- set main_body -%}
        CASE
          WHEN {{-regexp_contains(col_name=timestamp_string, pattern=regex_pattern, similar=True, case_sensitive=False) }}
          THEN  parse_timestamp({{bq_format_string}}, {{timestamp_string}})
        END
    {%- endset -%}

    {{dbt_utils.safe_cast(field=main_body, type=data_type(output_type))}}

{% endmacro %}