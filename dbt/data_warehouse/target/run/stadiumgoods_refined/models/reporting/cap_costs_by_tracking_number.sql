

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`cap_costs_by_tracking_number`
  
  
  OPTIONS()
  as (
    





WITH confirmed AS (

  SELECT
      tracking_number

    , min(CASE WHEN ship_warehouse = 'CAP' THEN ship_date END) AS cap_confirmation_ship_date
    , avg(CASE WHEN ship_warehouse = 'CAP' THEN tracking_number_total_ship_cost END) AS cap_confirmation_cost

    , min(CASE WHEN ship_warehouse = 'LAW' THEN ship_date END) AS law_confirmation_ship_date
    , avg(CASE WHEN ship_warehouse = 'LAW' THEN tracking_number_total_ship_cost END) AS law_confirmation_cost

    , min(CASE WHEN ship_warehouse = 'CHW' THEN ship_date END) AS chw_confirmation_ship_date
    , avg(CASE WHEN ship_warehouse = 'CHW' THEN tracking_number_total_ship_cost END) AS chw_confirmation_cost

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_3pl_shipped_serials`
  WHERE tracking_number IS NOT NULL
    AND tracking_number_total_ship_cost <> 0
    AND ship_warehouse IN ('CAP','LAW','CHW')
  GROUP BY 1

), invoiced AS (

  SELECT
      tracking_number
    , min(ship_date) AS invoice_ship_date
    , min(invoice_date) AS invoice_date
    , string_agg(DISTINCT invoice_id, ', ') AS invoice_file
    , sum(ship_cost) AS invoice_cost

    , min(
        CASE WHEN operations_subcategory = 'Small Parcel' THEN ship_date END
      ) AS small_parcel_ship_date
    , min(
        CASE WHEN operations_subcategory = 'Small Parcel' THEN invoice_date END
      ) AS small_parcel_invoice_date
    , string_agg(DISTINCT
          CASE WHEN operations_subcategory = 'Small Parcel' THEN invoice_id END
        , ', '
      ) AS small_parcel_invoice_file
    , sum(
        CASE WHEN operations_subcategory = 'Small Parcel' THEN ship_cost END
      ) AS small_parcel_cost

    , min(
        CASE WHEN operations_subcategory = 'LTL Other' THEN ship_date END
      ) AS ltl_other_ship_date
    , min(
        CASE WHEN operations_subcategory = 'LTL Other' THEN invoice_date END
      ) AS ltl_other_invoice_date
    , string_agg(DISTINCT
          CASE WHEN operations_subcategory = 'LTL Other' THEN invoice_id END
        , ', '
      ) AS ltl_other_invoice_file
    , sum(
        CASE WHEN operations_subcategory = 'LTL Other' THEN ship_cost END
      ) AS ltl_other_cost

    , min(
        CASE WHEN operations_subcategory = 'Adjustments' THEN ship_date END
      ) AS adjustments_ship_date
    , min(
        CASE WHEN operations_subcategory = 'Adjustments' THEN invoice_date END
      ) AS adjustments_invoice_date
    , string_agg(DISTINCT
          CASE WHEN operations_subcategory = 'Adjustments' THEN invoice_id END
        , ', '
      ) AS adjustments_invoice_file
    , sum(
        CASE WHEN operations_subcategory = 'Adjustments' THEN ship_cost END
      ) AS adjustments_cost

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_shipping_costs`
  WHERE ship_cost <> 0
  GROUP BY 1

), final AS (

  SELECT
      coalesce(confirmed.tracking_number, invoiced.tracking_number) AS tracking_number
    , invoiced.invoice_date
    , invoiced.invoice_file
    , invoiced.invoice_cost

    , confirmed.cap_confirmation_ship_date
    , confirmed.cap_confirmation_cost

    , confirmed.law_confirmation_ship_date
    , confirmed.law_confirmation_cost

    , confirmed.chw_confirmation_ship_date
    , confirmed.chw_confirmation_cost


    , invoiced.small_parcel_ship_date
    , invoiced.small_parcel_invoice_date
    , invoiced.small_parcel_invoice_file
    , invoiced.small_parcel_cost

    , invoiced.ltl_other_ship_date
    , invoiced.ltl_other_invoice_date
    , invoiced.ltl_other_invoice_file
    , invoiced.ltl_other_cost

    , invoiced.adjustments_ship_date
    , invoiced.adjustments_invoice_date
    , invoiced.adjustments_invoice_file
    , invoiced.adjustments_cost

  FROM confirmed
  FULL JOIN invoiced
    ON confirmed.tracking_number = invoiced.tracking_number

)

SELECT * FROM final
  );
    