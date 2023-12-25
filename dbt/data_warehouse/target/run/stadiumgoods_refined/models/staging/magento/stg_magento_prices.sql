
        
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_prices` as DBT_INTERNAL_DEST
        using (
           




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



         ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.serial_log_id = DBT_INTERNAL_DEST.serial_log_id
        

    
    when matched then update set
        `serial_log_id` = DBT_INTERNAL_SOURCE.`serial_log_id`,`_synched_from_source_at` = DBT_INTERNAL_SOURCE.`_synched_from_source_at`,`old_price` = DBT_INTERNAL_SOURCE.`old_price`,`price` = DBT_INTERNAL_SOURCE.`price`
    

    when not matched then insert
        (`serial_log_id`, `_synched_from_source_at`, `old_price`, `price`)
    values
        (`serial_log_id`, `_synched_from_source_at`, `old_price`, `price`)


  