{%- macro localize_timestamp_to_timestamptz(naive_timestamp, local_timezone, output_type='timestamptz') -%}
  {{adapter.dispatch('localize_timestamp_to_timestamptz')(naive_timestamp, local_timezone, output_type)}}
{%- endmacro -%}


{%- macro default__localize_timestamp_to_timestamptz(naive_timestamp, local_timezone, output_type='timestamptz') -%}

    CAST(CAST({{naive_timestamp}} AS timestamp) AT TIME ZONE {{local_timezone}} AS {{data_type(output_type)}})

{%- endmacro -%}


{%- macro bigquery__localize_timestamp_to_timestamptz(naive_timestamp, local_timezone, output_type='timestamptz') -%}

    SAFE_CAST(TIMESTAMP(SAFE_CAST({{naive_timestamp}} AS datetime), {{local_timezone}}) AS {{data_type(output_type)}})

{%- endmacro -%}

