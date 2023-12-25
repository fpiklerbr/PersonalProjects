
{%- macro create_f_json_dict_to_list() -%}


    CREATE OR REPLACE FUNCTION {{ target.schema ~ '_reporting' }}.json_dict_to_list(json_dict STRING)
      RETURNS STRING
      LANGUAGE js AS r"""
      var kv_array = [];
      var row = JSON.parse(json_dict);
      for (var field in row) {
        if (row.hasOwnProperty(field) && row[field] != null) {
                var kv_dict = {};
                kv_dict['key'] = field ;
                kv_dict['value'] = row[field] ;
            kv_array.push(kv_dict) ;
        }
       }
       var kv_string = JSON.stringify(kv_array) ;
       return kv_string ;
      """;


{%- endmacro -%}