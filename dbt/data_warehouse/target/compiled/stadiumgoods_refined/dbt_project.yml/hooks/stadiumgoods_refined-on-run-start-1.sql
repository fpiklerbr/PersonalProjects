
  

CREATE OR REPLACE FUNCTION stadiumgoods_reporting.json_object_keys_array(json_row STRING)
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

CREATE OR REPLACE FUNCTION stadiumgoods_reporting.json_dict_to_list(json_dict STRING)
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


