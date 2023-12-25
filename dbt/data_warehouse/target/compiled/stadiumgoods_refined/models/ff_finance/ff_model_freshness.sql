
WITH raw_tables AS (



  

  
  SELECT
      'ff_serial_price_history' AS reporting_model
    , max(valid_from) AS raw_table_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history`


  

  UNION ALL
  SELECT
      'ff_stadium_finance_lines' AS reporting_model
    , max(rebuild_timestamp) AS raw_table_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`


  

  UNION ALL
  SELECT
      'ff_stadium_products' AS reporting_model
    , max(rebuild_timestamp) AS raw_table_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`


  

  UNION ALL
  SELECT
      'ff_stadium_serials' AS reporting_model
    , max(rebuild_timestamp) AS raw_table_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`


)


,  reporting_models AS (



  

  
  SELECT
      'ff_serial_price_history' AS reporting_model
    , max(valid_from) AS reporting_model_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_ff_finance`.`ff_serial_price_history`


  

  UNION ALL
  SELECT
      'ff_stadium_finance_lines' AS reporting_model
    , max(rebuild_timestamp) AS reporting_model_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_ff_finance`.`ff_stadium_finance_lines`


  

  UNION ALL
  SELECT
      'ff_stadium_products' AS reporting_model
    , max(rebuild_timestamp) AS reporting_model_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_ff_finance`.`ff_stadium_products`


  

  UNION ALL
  SELECT
      'ff_stadium_serials' AS reporting_model
    , max(rebuild_timestamp) AS reporting_model_max_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_ff_finance`.`ff_stadium_serials`


)



SELECT
    *
  , CASE
      WHEN reporting_model_max_timestamp = raw_table_max_timestamp
      THEN 'FRESH'
      ELSE 'STALE'
    END reporting_model_freshness
FROM raw_tables
FULL JOIN reporting_models
  USING (reporting_model)