
        
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_status_ids` as DBT_INTERNAL_DEST
        using (
           




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



         ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.serial_log_id = DBT_INTERNAL_DEST.serial_log_id
        

    
    when matched then update set
        `serial_log_id` = DBT_INTERNAL_SOURCE.`serial_log_id`,`_synched_from_source_at` = DBT_INTERNAL_SOURCE.`_synched_from_source_at`,`old_status_id` = DBT_INTERNAL_SOURCE.`old_status_id`,`status_id` = DBT_INTERNAL_SOURCE.`status_id`
    

    when not matched then insert
        (`serial_log_id`, `_synched_from_source_at`, `old_status_id`, `status_id`)
    values
        (`serial_log_id`, `_synched_from_source_at`, `old_status_id`, `status_id`)


  