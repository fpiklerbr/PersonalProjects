

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_creditmemos`
  
  
  OPTIONS()
  as (
    

SELECT
    x3_order_id
  , x3_order_line
  , string_agg(DISTINCT creditmemo_id, ', ') AS creditmemo_id
  , string_agg( DISTINCT CAST(creditmemo_line AS string), ', ') AS creditmemo_line
  , DATETIME(SAFE_CAST(min(creditmemo_created_at) AS timestamp), 'America/New_York') AS creditmemo_creation_nyc
  , sum(creditmemo_line_price) AS creditmemo_line_price
  , sum(creditmemo_line_discount) AS creditmemo_line_discount
  , sum(creditmemo_line_shipping) AS creditmemo_line_shipping
  , sum(creditmemo_line_tax) AS creditmemo_line_tax
  , sum(creditmemo_line_gift_card) AS creditmemo_line_gift_card
  , sum(coalesce(creditmemo_total_excluding_tax, 0) + coalesce(creditmemo_total_tax, 0)) AS creditmemo_total
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_creditmemo_lines`
GROUP BY 1, 2
  );
    