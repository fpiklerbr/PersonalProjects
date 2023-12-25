

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_subscription_bis`
  OPTIONS()
  as SELECT
      subscription.sk_subscription_bis
    , subscription.subscription_bis_id
    , subscription.sk_customer
    , subscription.subscription_id
    , subscription.tenant_id
    , subscription.email
    , subscription.country_code
    , subscription.platform
    , cast(subscription.product_id as string) as fps_parent_product_id
    , subscription.product_variant
    , subscription.product_scale
    , subscription.product_size
    , subscription.product_size_code
    , product.name
    , product.brand
    , product.simple_sku
    , product.mfg_sku    
    , subscription.stock_qty
    , subscription.last_restock_date
    , subscription.has_been_notified
    , subscription.notification_date
    , subscription.row_active_date
    , subscription.row_update_date
    , subscription.row_exclude_date
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__dim_subscription_bis` AS subscription
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS product
    ON cast(subscription.product_id as string) = product.fps_parent_product_id
    AND subscription.product_size_code = product.size;

