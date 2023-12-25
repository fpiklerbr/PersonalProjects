{#
-- func should specify the dataset (schema) in bigquery

#}

{%- macro create_f_json_object_keys_array() -%}


    CREATE OR REPLACE FUNCTION {{ target.schema ~ '_reporting' }}.json_object_keys_array(json_row STRING)
      RETURNS ARRAY<STRING>
      LANGUAGE js AS r"""
      var keys_array = [];
      var row = JSON.parse(json_row);
      for (var field in row) {
        if (row.hasOwnProperty(field) && row[field] != null) {
          if (field.charAt(0) === '"' && field.charAt(field.length - 1) === '"') {
            keys_array.push(field.substr(1, field.length - 2));
          }
          else {
            keys_array.push(field);
          }
        }
      }
      return keys_array;
      """;


{%- endmacro -%}