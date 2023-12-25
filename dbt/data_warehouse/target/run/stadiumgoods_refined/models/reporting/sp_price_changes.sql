

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`sp_price_changes`
  
  
  OPTIONS()
  as (
    

SELECT
    price_update_id AS price_change_id
  , serial_number
, DATETIME(SAFE_CAST(created_at AS timestamp), 'America/New_York') AS price_change_creation_nyc
  , CASE WHEN sage_status = 1 AND magento_status = 1 AND price > old_price THEN 1 ELSE 0 END AS price_increase
  , CASE WHEN sage_status = 1 AND magento_status = 1 AND price > old_price THEN price - old_price END AS price_increase_amount
  , CASE WHEN sage_status = 1 AND magento_status = 1 AND price < old_price THEN 1 ELSE 0 END AS price_decrease
  , CASE WHEN sage_status = 1 AND magento_status = 1 AND price < old_price THEN price - old_price END AS price_decrease_amount
  , CASE WHEN sage_status = 0 OR magento_status = 0 OR price IS NULL OR old_price IS NULL OR price = old_price THEN 1 ELSE 0 END AS price_not_changed
  , current_timestamp AS rebuild_timestamp
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__price_updates`
  );
    