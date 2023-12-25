

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_promotion_serials`
  
  
  OPTIONS()
  as (
    WITH price_updates AS (

  SELECT DISTINCT
      promotion_id
    , serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__price_updates`
  WHERE promotion_id IS NOT NULL

), promotion_serials AS (

  SELECT
      promotions.promotion_id
    , promotions.starts_at AS promotion_started_at
    , promotions.ends_at AS promotion_ended_at
    , promotions.consignor_id
    , promotions.promotion_type
    , price_updates.serial_number
    , lead(promotions.starts_at) OVER (
        PARTITION BY price_updates.serial_number
        ORDER BY promotions.starts_at, promotions.promotion_id
      ) AS next_promotion_started_at
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__promotions` AS promotions
  INNER JOIN price_updates
    ON promotions.promotion_id = price_updates.promotion_id

), final AS (

  SELECT
      promotion_id
    , promotion_started_at
    , CASE
        WHEN next_promotion_started_at <= coalesce(promotion_ended_at, next_promotion_started_at)
        THEN next_promotion_started_at
        ELSE promotion_ended_at
      END AS promotion_ended_at
    , consignor_id
    , promotion_type
    , serial_number
    , next_promotion_started_at AS _raw_next_promotion_started_at
    , promotion_ended_at AS _raw_promotion_ended_at
  FROM promotion_serials

)

SELECT * FROM final
  );
    