




SELECT
      serial_log_id
    , _synched_from_source_at
    , cast(nullif(replace(
          replace(
              replace(
                  regexp_replace(
                      
  CAST(regexp_extract(nullif(ltrim(rtrim(serial_orig_data)), ''), 
  r'"price";.*?;'
) AS string)

                    , '\"price\";(N|s:.*?:|d:|i:)'
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
      ), '') AS numeric) AS old_price
    , cast(nullif(replace(
          replace(
              replace(
                  regexp_replace(
                      
  CAST(regexp_extract(nullif(ltrim(rtrim(serial_data)), ''), 
  r'"price";.*?;'
) AS string)

                    , '\"price\";(N|s:.*?:|d:|i:)'
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
      ), '') AS numeric) AS price
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_log`
  WHERE (
    nullif(ltrim(rtrim(serial_orig_data)), '') IS NOT NULL
    OR nullif(ltrim(rtrim(serial_data)), '') IS NOT NULL
  )

    AND _synched_from_source_at > (SELECT max(_synched_from_source_at) from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_prices`)


