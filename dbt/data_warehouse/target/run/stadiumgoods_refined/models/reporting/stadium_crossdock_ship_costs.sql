

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_crossdock_ship_costs`
  
  
  OPTIONS()
  as (
    

WITH zebra AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`zebra_costs_by_tracking_number`

), tmall_b2c AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tmall_b2c_costs_by_ship_reference`

), flow AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`flow_costs_by_order_number`

), final AS (

  SELECT
      coalesce(zebra.tracking_number, tmall_b2c.ship_reference, flow.order_number) AS crossdock_reference
    , CASE
        WHEN zebra.ship_cost IS NOT NULL
          THEN zebra.ship_cost
        WHEN tmall_b2c.ship_cost IS NOT NULL
          THEN tmall_b2c.ship_cost
        WHEN flow.ship_cost IS NOT NULL
          THEN flow.ship_cost
      END ship_cost
    , CASE
        WHEN zebra.ship_cost IS NOT NULL
          THEN 'Zebra'
        WHEN tmall_b2c.ship_cost IS NOT NULL
          THEN 'Tmall B2C'
        WHEN flow.ship_cost IS NOT NULL
          THEN 'Flow'
      END ship_cost_type
    , CASE
        WHEN zebra.ship_cost IS NOT NULL
          THEN zebra.file_date
        WHEN tmall_b2c.ship_cost IS NOT NULL
          THEN tmall_b2c.ship_cost_file_date
        WHEN flow.ship_cost IS NOT NULL
          THEN flow.file_date
      END ship_cost_date
    , CASE
        WHEN zebra.ship_cost IS NOT NULL
          THEN zebra.file_name
        WHEN tmall_b2c.ship_cost IS NOT NULL
          THEN tmall_b2c.ship_cost_file_name
        WHEN flow.ship_cost IS NOT NULL
          THEN flow.statement_name
      END ship_cost_source
    , zebra.tracking_number AS zebra_tracking_number
    , zebra.ship_date AS zebra_ship_date
    , zebra.file_name AS zebra_file_name
    , zebra.file_date AS zebra_file_date
    , zebra.ship_cost AS zebra_ship_cost
    , tmall_b2c.ship_reference AS tmall_b2c_ship_reference
    , tmall_b2c.ship_cost_ship_date AS tmall_b2c_ship_cost_ship_date
    , tmall_b2c.ship_cost_file_name AS tmall_b2c_ship_cost_file_name
    , tmall_b2c.ship_cost_file_date AS tmall_b2c_ship_cost_file_date
    , tmall_b2c.ship_cost AS tmall_b2c_ship_cost
    , tmall_b2c.duties_cost_ship_date AS tmall_b2c_duties_cost_ship_date
    , tmall_b2c.duties_cost_file_name AS tmall_b2c_duties_cost_file_name
    , tmall_b2c.duties_cost_file_date AS tmall_b2c_duties_cost_file_date
    , tmall_b2c.duties_cost AS tmall_b2c_duties_cost
    , flow.order_number AS flow_order_number
    , flow.statement_name AS flow_statement_name
    , flow.file_date AS flow_statement_date
    , flow.ship_cost AS flow_ship_cost
    , flow.duties_cost AS flow_duties_cost
  FROM zebra
  FULL JOIN tmall_b2c
    ON zebra.tracking_number = tmall_b2c.ship_reference
  FULL JOIN flow
    ON coalesce(zebra.tracking_number, tmall_b2c.ship_reference) = flow.order_number

)

SELECT * FROM final
  );
    