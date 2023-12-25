




SELECT
      serial_log_id
    , _synched_from_source_at
    , cast(nullif(replace(
          replace(
              replace(
                  regexp_replace(
                      
  CAST(regexp_extract(nullif(ltrim(rtrim(serial_orig_data)), ''), 
  r'"status_id";.*?;'
) AS string)

                    , '\"status_id\";(N|s:.*?:|d:|i:)'
                    , ''
                  )
                , '"'
                ,''
              )
            , ';'
            , ''
          )
        , ','
        , ''
      ), '') AS numeric) AS old_status_id
    , cast(nullif(replace(
          replace(
              replace(
                  regexp_replace(
                      
  CAST(regexp_extract(nullif(ltrim(rtrim(serial_data)), ''), 
  r'"status_id";.*?;'
) AS string)

                    , '\"status_id\";(N|s:.*?:|d:|i:)'
                    , ''
                  )
                , '"'
                ,''
              )
            , ';'
            , ''
          )
        , ','
        , ''
      ), '') AS numeric) AS status_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_log`
  WHERE (
    nullif(ltrim(rtrim(serial_orig_data)), '') IS NOT NULL
    OR nullif(ltrim(rtrim(serial_data)), '') IS NOT NULL
  )

    AND _synched_from_source_at > (SELECT max(_synched_from_source_at) from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_status_ids`)


