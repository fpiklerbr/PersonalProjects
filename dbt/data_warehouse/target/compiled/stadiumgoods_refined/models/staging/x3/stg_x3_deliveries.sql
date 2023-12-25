

SELECT
    delivery.delivery_id
  , delivery.delivery_warehouse
  , DATETIME(SAFE_CAST(delivery.created_at AS timestamp), 'America/New_York') AS delivery_creation_nyc
  , nullif(substr(
    concat(
    
      coalesce(delivery.carrier|| ' ' , '')
    
      , coalesce(delivery.delivery_mode|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(delivery.carrier|| ' ' , '')
    
      , coalesce(delivery.delivery_mode|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
), '') AS delivery_shipping_description
  , CASE WHEN null_ship_dates.null_date IS NOT NULL THEN NULL ELSE delivery.ship_date END AS ship_date
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sdelivery` AS delivery
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`exceptions_x3_null_dates` AS null_ship_dates
  ON delivery.ship_date = null_ship_dates.null_date