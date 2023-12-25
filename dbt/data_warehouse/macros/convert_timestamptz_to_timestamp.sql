{%- macro convert_timestamptz_to_timestamp(aware_timestamp, local_timezone, output_type='timestamp') -%}
  {{adapter.dispatch('convert_timestamptz_to_timestamp')(aware_timestamp, local_timezone, output_type)}}
{%- endmacro -%}


{%- macro default__convert_timestamptz_to_timestamp(aware_timestamp, local_timezone, output_type='timestamp') -%}

cast(cast( {{- aware_timestamp }} AS timestamptz) AT TIME ZONE {{ local_timezone }} AS {{ data_type(output_type) -}} )

{%- endmacro -%}


{%- macro bigquery__convert_timestamptz_to_timestamp(aware_timestamp, local_timezone, output_type='timestamp') -%}

safe_cast(datetime(safe_cast( {{- aware_timestamp }} AS timestamp), {{ local_timezone -}} ) AS {{ data_type(output_type) -}} )

{%- endmacro -%}
