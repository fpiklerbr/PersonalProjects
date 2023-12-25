/*
This macro encapsulates the logic to determine the *serial_status* field
used in several models related to commercial reporting

It can be used in a SELECT statement that JOINs stadium_finance_lines and stadium_serials,
the aliases of which can be passed in via the appropriate arguments
*/

{% macro commercial_serial_status(finance_lines_alias = 'finance_lines', serials_alias = 'serials') %}
CASE
  WHEN {{ finance_lines_alias }}.reporting_status = 'Dispatched' THEN 'Dispatched'
  WHEN (
    {{ serials_alias }}.status_document = 'Withdrawal'
    OR {{ serials_alias }}.yseristatus_consignment_status = 'Withdrawn'
  ) THEN 'Withdrawn'
  WHEN (
    {{ serials_alias }}.yseristatus_consignment_status = 'Returned'
    OR (
      {{ regexp_contains(serials_alias ~ ".yseristatus_consignment_status", "'.*Sold.*'", True, False) }}
      AND {{ finance_lines_alias }}.reporting_status = 'Returned'
    )
  ) THEN 'Returned to New Serial'
  ELSE 'Available'
END
{% endmacro %}
