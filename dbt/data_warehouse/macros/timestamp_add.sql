{% macro timestamp_add(datepart, interval, from_timestamp) %}
  {{adapter.dispatch('timestamp_add')(datepart, interval, from_timestamp)}}
{% endmacro %}

{% macro default__timestamp_add(datepart, interval, from_timestamp) %}

{{ from_timestamp }} + ((interval '1 {{ datepart }}') * ({{ interval }}))

{% endmacro %}


{% macro bigquery__timestamp_add(datepart, interval, from_timestamp) %}

timestamp_add(cast( {{ from_timestamp }} as timestamp),
        interval {{ interval }} {{ datepart }})

{% endmacro %}

