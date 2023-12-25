

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`subscription_bis`
  
  
  OPTIONS()
  as (
    
 
SELECT
      sk_subscription_bis
    , subscription_bis_id
    , sk_customer
    , subscription_id
    , tenant_id
    , email
    , country_code
    , platform
    , fps_parent_product_id
    , product_variant
    , product_scale
    , product_size
    , product_size_code
    , name
    , brand
    , simple_sku
    , mfg_sku    
    , stock_qty
    , last_restock_date
    , has_been_notified
    , notification_date
    , row_active_date
    , row_update_date
    , row_exclude_date
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_subscription_bis`
  );
    