

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units`
  
  
  OPTIONS()
  as (
    WITH swapped_items AS (
    SELECT
    ether_wms_inventory_label_swaps_id,
    label_number,
    origin_serial_number,
    destination_serial_number,
    swapped_at,
    FROM ( 
        SELECT 
        ether_wms_inventory_label_swaps_id,
        label_number,
        origin_serial_number,
        destination_serial_number,
        swapped_at,    
        ROW_NUMBER() OVER (PARTITION BY label_number ORDER BY swapped_at DESC) AS row_num
        FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_label_swaps`     
      ) sw
    WHERE row_num = 1 
),

origin_unit_detail AS (
    SELECT
    units.ether_wms_inventory_unit_id,
    units.serial_number,
    units.label_number,
    units.price_base_amount,
    warehouse_bins.warehouse_bin,
    warehouses.warehouse_code
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_units` AS units
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouse_bins` AS warehouse_bins
      ON units.ether_wms_warehouse_bin_id = warehouse_bins.ether_wms_warehouse_bin_id
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS warehouses -- many inventory_units to one warehouse
      ON units.ether_wms_warehouse_id = warehouses.ether_wms_warehouse_id
)

SELECT
    inventory_units.`ether_wms_inventory_unit_id`,
  inventory_units.`serial_number`,
  inventory_units.`base_currency`,
  inventory_units.`business_entity`,
  inventory_units.`price_base_amount`,
  inventory_units.`_1p_cost_base_amount`,
  inventory_units.`consignment_status`,
  inventory_units.`paid_out_status`,
  inventory_units.`intake_date`,
  inventory_units.`sold_at`,
  inventory_units.`x3_creation_date`,
  inventory_units.`is_dropshipped`,
  inventory_units.`ether_pim_product_condition_id_1`,
  inventory_units.`ether_pim_product_condition_id_2`,
  inventory_units.`ether_pim_product_condition_id_3`,
  inventory_units.`ether_pim_product_condition_id_4`,
  inventory_units.`ether_pim_product_condition_id_5`,
  inventory_units.`issue_date`,
  inventory_units.`lock_version`,
  inventory_units.`created_at`,
  inventory_units.`updated_at`,
  inventory_units.`locked_for_x3_update_at`,
  inventory_units.`invoice_number`,
  inventory_units.`returned_at`,
  inventory_units.`original_ether_wms_inventory_unit_id`,
  inventory_units.`size`,
  inventory_units.`product_id`,
  inventory_units.`stock_status_label`,
  inventory_units.`stock_status`,
  inventory_units.`source_updated_at`,
  inventory_units.`dss_item_id`,
  inventory_units.`dss_incremental_id`,
  inventory_units.`sales_channel`,
  inventory_units.`label_number`,
  inventory_units.`_synched_from_source_at`,
  inventory_units.`_raw_in_display_case`,
  inventory_units.`_raw_label_generated_at`
  , commissions.commission_rate
  , coalesce(
        round((1 - commissions.commission_rate) * inventory_units.price_base_amount, 2)
      , inventory_units._3p_payout_base_amount
    ) AS _3p_payout_base_amount
  , nullif(
      substr(
    concat(
    
      coalesce(condition_1.condition|| ', ' , '')
    
      , coalesce(condition_2.condition|| ', ' , '')
    
      , coalesce(condition_3.condition|| ', ' , '')
    
      , coalesce(condition_4.condition|| ', ' , '')
    
      , coalesce(condition_5.condition|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(condition_1.condition|| ', ' , '')
    
      , coalesce(condition_2.condition|| ', ' , '')
    
      , coalesce(condition_3.condition|| ', ' , '')
    
      , coalesce(condition_4.condition|| ', ' , '')
    
      , coalesce(condition_5.condition|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
)
      , '') AS conditions
  , inventory_units.user_id AS inventory_unit_user_id
  , users.consignor_id
  , inventory_units.ether_wms_product_variant_id
  , product_variants.simple_sku
  , product_variants.product_number
  , product_variants.size_code
  , inventory_units.ether_wms_warehouse_id
  , warehouses.warehouse_code
  , inventory_units.ether_wms_warehouse_bin_id
  , warehouse_bins.warehouse_bin
  , CASE
      WHEN CASE WHEN inventory_units.label_number IS NOT NULL THEN lag(inventory_units.created_at) OVER (PARTITION BY inventory_units.label_number ORDER BY inventory_units.created_at) END IS NOT NULL
      THEN inventory_units.created_at
      ELSE cast('1970-01-01 00:00:00' AS timestamp)
    END AS label_number_valid_from
  , coalesce(
        
  

timestamp_add(cast( CASE WHEN inventory_units.label_number IS NOT NULL THEN lead(inventory_units.created_at) OVER (PARTITION BY inventory_units.label_number ORDER BY inventory_units.created_at) END as timestamp),
        interval -1 second)



      , cast('2038-01-19 03:14:08' AS timestamp)
    ) AS label_number_valid_to
  , coalesce(source_buyer_serials.seller_serial_number, original_inventory_units.serial_number) AS original_serial_number
  , CASE
      WHEN source_buyer_serials.seller_serial_number IS NOT NULL
        THEN cast('SOURCE allocation' AS string)
      WHEN original_inventory_units.serial_number IS NOT NULL
        THEN cast('Reserialization' AS string)
    END AS relation_to_original_serial_number
  , coalesce(users.inventory_relationship, cast('3P' AS string)) AS inventory_relationship
  , CASE
      WHEN inventory_units.is_dropshipped IS TRUE
        THEN cast('Dropship' AS string)
      WHEN source_buyer_serials.seller_serial_number IS NOT NULL
        THEN cast('SOURCE ' AS string) || coalesce(users.inventory_relationship, cast('3P' AS string))
      WHEN users.consignor_id = 'DB00000005' AND inventory_units.intake_date < '2022-05-12'
        THEN cast('Returns Purchase' AS string)
      ELSE
        coalesce(users.inventory_type, cast('Consignment' AS string))
    END AS inventory_type
  , payout_requested_serials.payment_request_ids
  , payout_requested_serials.payment_request_created_at
  , payout_requests.payout_requested_at AS last_payment_request_created_at
  , payout_requests.payout_request_status AS payment_request_status
  , payout_requested_serials.payment_request_sla_deadline
  , payout_requests.pay_method AS payment_request_pay_method
  , payout_requests.third_party_identifier AS ether_payment_third_party_identifier
  , payout_requests.submitted_to_provider_at AS ether_payment_submitted_to_provider_at
  , payout_requests.payout_date AS ether_payment_payout_date
  , payout_requested_serials.payout_invoice_number
  , payout_requests.user_id AS payout_request_user_id
  , withdrawal_requested_serials.withdrawal_request_ids
  , withdrawal_requested_serials.first_withdrawal_request_created_at
  , withdrawal_requested_serials.last_withdrawal_request_id
  , withdrawal_requested_serials.last_withdrawal_request_created_at
  , withdrawal_requested_serials.last_withdrawal_request_submitted_at
  , withdrawal_requested_serials.last_withdrawal_request_deleted_at
  , withdrawal_requested_serials.last_withdrawal_request_status
  , withdrawal_requested_serials.last_withdrawal_request_warehouse
  , withdrawal_requested_serials.last_withdrawal_request_note
  , withdrawal_requested_serials.last_withdrawal_request_user_id
  , CASE when swaps.ether_wms_inventory_label_swaps_id is not null then true else false END as label_swap_occurred
  , swaps.destination_serial_number
  , origin_detail.price_base_amount as origin_price_base_amount
  , origin_detail.warehouse_bin as origin_warehouse_bin
  , origin_detail.warehouse_code as origin_warehouse_code
  , swaps.swapped_at
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_units` AS inventory_units
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_inventory_unit_commissions` AS commissions
  ON inventory_units.serial_number = commissions.serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_conditions` AS condition_1
  ON inventory_units.ether_pim_product_condition_id_1 = condition_1.ether_pim_product_condition_id
  AND condition_1.condition <> 'Default'
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_conditions` AS condition_2
  ON inventory_units.ether_pim_product_condition_id_2 = condition_2.ether_pim_product_condition_id
  AND condition_2.condition <> 'Default'
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_conditions` AS condition_3
  ON inventory_units.ether_pim_product_condition_id_3 = condition_3.ether_pim_product_condition_id
  AND condition_3.condition <> 'Default'
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_conditions` AS condition_4
  ON inventory_units.ether_pim_product_condition_id_4 = condition_4.ether_pim_product_condition_id
  AND condition_4.condition <> 'Default'
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pim_product_conditions` AS condition_5
  ON inventory_units.ether_pim_product_condition_id_5 = condition_5.ether_pim_product_condition_id
  AND condition_5.condition <> 'Default'
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS users -- many inventory_units to one user
  ON inventory_units.user_id = users.user_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_product_variants` AS product_variants -- many inventory_units to one product_variant
  ON inventory_units.ether_wms_product_variant_id = product_variants.ether_wms_product_variant_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS warehouses -- many inventory_units to one warehouse
  ON inventory_units.ether_wms_warehouse_id = warehouses.ether_wms_warehouse_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouse_bins` AS warehouse_bins -- many inventory_units to one warehouse_bin
  ON inventory_units.ether_wms_warehouse_bin_id = warehouse_bins.ether_wms_warehouse_bin_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_allocations` AS source_buyer_serials -- at most one source_buyer_serial to one inventory_unit
  ON inventory_units.serial_number = source_buyer_serials.buyer_serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_units` AS original_inventory_units -- at most one original_inventory_unit to one inventory_unit
  ON inventory_units.original_ether_wms_inventory_unit_id = original_inventory_units.ether_wms_inventory_unit_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_payout_requested_serials` AS payout_requested_serials
  ON inventory_units.serial_number = payout_requested_serials.serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`ether_payout_requests` AS payout_requests
  ON payout_requested_serials.last_ether_fms_payout_request_id = payout_requests.ether_fms_payout_request_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_withdrawal_requested_serials` withdrawal_requested_serials
  ON inventory_units.serial_number = withdrawal_requested_serials.serial_number
LEFT JOIN swapped_items AS swaps
  ON inventory_units.label_number = swaps.label_number
LEFT JOIN origin_unit_detail AS origin_detail
  ON swaps.origin_serial_number = origin_detail.serial_number
  );
    