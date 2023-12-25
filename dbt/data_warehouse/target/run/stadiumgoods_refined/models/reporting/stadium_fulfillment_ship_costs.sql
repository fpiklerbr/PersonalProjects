

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_fulfillment_ship_costs`
  
  
  OPTIONS()
  as (
    

WITH fedex AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`fedex_costs_by_tracking_number`

), dhl AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dhl_costs_by_tracking_number`

), cap AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`cap_costs_by_tracking_number`

), fps AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`fps_ship_costs_by_tracking_number`

), final AS (

  SELECT
      coalesce(
        dhl.tracking_number, fps.tracking_number, cap.tracking_number, fedex.tracking_number
      ) AS tracking_number
    , CASE
        WHEN fedex.p2p_cost IS NOT NULL
          THEN fedex.p2p_cost
        WHEN dhl.ship_cost IS NOT NULL
          THEN dhl.ship_cost
        WHEN fps.ship_cost IS NOT NULL
          THEN fps.ship_cost
        WHEN cap.invoice_cost IS NOT NULL
          THEN cap.invoice_cost
        WHEN fedex.fedex_cost IS NOT NULL
          THEN fedex.fedex_cost
        WHEN cap.cap_confirmation_cost IS NOT NULL
          THEN cap.cap_confirmation_cost
        WHEN cap.law_confirmation_cost IS NOT NULL
          THEN cap.law_confirmation_cost
        WHEN cap.chw_confirmation_cost IS NOT NULL
          THEN cap.chw_confirmation_cost
      END ship_cost
    , CASE
        WHEN fedex.p2p_cost IS NOT NULL
          THEN 'P2P Invoice'
        WHEN dhl.ship_cost IS NOT NULL
          THEN 'DHL Invoice'
        WHEN fps.ship_cost IS NOT NULL
          THEN 'FPS Shipping'
        WHEN cap.invoice_cost IS NOT NULL
          THEN 'CAP Invoice'
        WHEN fedex.fedex_cost IS NOT NULL
          THEN 'FedEx Invoice'
        WHEN cap.cap_confirmation_cost IS NOT NULL
          THEN 'CAP Confirmation'
        WHEN cap.law_confirmation_cost IS NOT NULL
          THEN 'LAW Confirmation'
        WHEN cap.chw_confirmation_cost IS NOT NULL
          THEN 'CHW Confirmation'
      END ship_cost_type
    , CASE
        WHEN fedex.p2p_cost IS NOT NULL
          THEN fedex.p2p_invoice_date
        WHEN dhl.ship_cost IS NOT NULL
          THEN dhl.ship_invoice_date
        WHEN fps.ship_cost IS NOT NULL
          THEN fps.invoice_date
        WHEN cap.invoice_cost IS NOT NULL
          THEN cap.invoice_date
        WHEN fedex.fedex_cost IS NOT NULL
          THEN fedex.fedex_invoice_date
        WHEN cap.cap_confirmation_cost IS NOT NULL
          THEN cap.cap_confirmation_ship_date
        WHEN cap.law_confirmation_cost IS NOT NULL
          THEN cap.law_confirmation_ship_date
        WHEN cap.chw_confirmation_cost IS NOT NULL
          THEN cap.chw_confirmation_ship_date
      END ship_cost_date
    , CASE
        WHEN fedex.p2p_cost IS NOT NULL
          THEN fedex.p2p_invoice_file
        WHEN dhl.ship_cost IS NOT NULL
          THEN dhl.ship_invoice_id
        WHEN fps.ship_cost IS NOT NULL
          THEN fps.invoice_id
        WHEN cap.invoice_cost IS NOT NULL
          THEN cap.invoice_file
        WHEN fedex.fedex_cost IS NOT NULL
          THEN fedex.fedex_invoice_id
        WHEN cap.cap_confirmation_cost IS NOT NULL
          THEN CAST(cap.cap_confirmation_ship_date AS string)
        WHEN cap.law_confirmation_cost IS NOT NULL
          THEN CAST(cap.law_confirmation_ship_date AS string)
        WHEN cap.chw_confirmation_cost IS NOT NULL
          THEN CAST(cap.chw_confirmation_ship_date AS string)
      END ship_cost_source
    , fedex.p2p_pick_up_date
    , fedex.p2p_invoice_date
    , fedex.p2p_invoice_file
    , fedex.p2p_cost
    , fedex.fedex_ship_date
    , fedex.fedex_invoice_date
    , fedex.fedex_invoice_id
    , fedex.fedex_cost
    , dhl.ship_invoice_ship_date AS dhl_ship_invoice_ship_date
    , dhl.ship_invoice_date AS dhl_ship_invoice_date
    , dhl.ship_invoice_id AS dhl_ship_invoice_id
    , dhl.ship_cost AS dhl_ship_cost
    , fps.ship_cost AS fps_ship_cost
    , fps.invoice_date AS fps_invoice_date
    , fps.invoice_id AS fps_invoice_id
    , cap.invoice_cost AS cap_invoice_cost
    , cap.invoice_date AS cap_invoice_date
    , cap.invoice_file AS cap_invoice_file
    , cap.cap_confirmation_ship_date
    , cap.cap_confirmation_cost
    , cap.law_confirmation_ship_date
    , cap.law_confirmation_cost
    , cap.chw_confirmation_ship_date
    , cap.chw_confirmation_cost
    , cap.small_parcel_ship_date AS cap_small_parcel_ship_date
    , cap.small_parcel_invoice_date AS cap_small_parcel_invoice_date
    , cap.small_parcel_invoice_file AS cap_small_parcel_invoice_file
    , cap.small_parcel_cost AS cap_small_parcel_cost
    , cap.ltl_other_ship_date AS cap_ltl_other_sales_date
    , cap.ltl_other_invoice_date AS cap_ltl_other_invoice_date
    , cap.ltl_other_invoice_file AS cap_ltl_other_invoice_file
    , cap.ltl_other_cost AS cap_ltl_other_cost
    , cap.adjustments_ship_date AS cap_adjustments_ship_date
    , cap.adjustments_invoice_date AS cap_adjustments_invoice_date
    , cap.adjustments_invoice_file AS cap_adjustments_invoice_file
    , cap.adjustments_cost AS cap_adjustments_cost
    , dhl.duties_invoice_ship_date AS dhl_duties_invoice_ship_date
    , dhl.duties_invoice_date AS dhl_duties_invoice_date
    , dhl.duties_invoice_id AS dhl_duties_invoice_id
    , dhl.duties_cost AS dhl_duties_cost
    , dhl.customs_invoice_ship_date AS dhl_customs_invoice_ship_date
    , dhl.customs_invoice_date AS dhl_customs_invoice_date
    , dhl.customs_invoice_id AS dhl_customs_invoice_id
    , dhl.customs_cost AS dhl_customs_cost
  FROM cap
  FULL JOIN dhl
    ON dhl.tracking_number = cap.tracking_number
  FULL JOIN fedex
    ON coalesce(dhl.tracking_number, cap.tracking_number) = fedex.tracking_number
  FULL JOIN fps
    ON coalesce(dhl.tracking_number, cap.tracking_number, fedex.tracking_number) = fps.tracking_number

)

SELECT * FROM final
  );
    