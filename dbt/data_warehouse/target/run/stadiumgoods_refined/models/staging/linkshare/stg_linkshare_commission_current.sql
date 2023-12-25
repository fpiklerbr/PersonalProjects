

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_linkshare_commission_current`
  OPTIONS()
  as 

WITH distinct_linkshare AS (

  SELECT DISTINCT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`linkshare__commissions`
  WHERE mag_order_id IS NOT NULL

), final AS (

  SELECT
    mag_order_id
  , string_agg(DISTINCT offer_name, ', ') AS offer_name
  , string_agg(DISTINCT publisher_name, ', ') AS publisher_name
  , string_agg(DISTINCT publisher_group_name, ', ') AS publisher_group_name
  , sum(total_commission) AS total_commission
  , current_timestamp rebuild_timestamp
  FROM distinct_linkshare
  GROUP BY 1

)
SELECT * FROM final;

