WITH transfer_items AS (

  

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_transfer_items`' as 
    string
) as _dbt_source_relation,
                
                    cast(`transfer_number` as STRING) as `transfer_number` ,
                    cast(`transfer_item_line_number` as INT64) as `transfer_item_line_number` ,
                    cast(`ether_wms_transfer_id` as INT64) as `ether_wms_transfer_id` ,
                    cast(`ether_wms_transfer_item_id` as INT64) as `ether_wms_transfer_item_id` ,
                    cast(`transfer_item_status` as STRING) as `transfer_item_status` ,
                    cast(`transfer_created_at` as TIMESTAMP) as `transfer_created_at` ,
                    cast(`transfer_total_qty` as INT64) as `transfer_total_qty` ,
                    cast(`transfer_reason` as STRING) as `transfer_reason` ,
                    cast(`error_messages` as STRING) as `error_messages` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`picking_number` as STRING) as `picking_number` ,
                    cast(`shipment_number` as STRING) as `shipment_number` ,
                    cast(`transfer_status` as STRING) as `transfer_status` ,
                    cast(`shipped_at` as TIMESTAMP) as `shipped_at` ,
                    cast(`is_digital` as BOOLEAN) as `is_digital` ,
                    cast(`sending_warehouse` as STRING) as `sending_warehouse` ,
                    cast(`receiving_warehouse` as STRING) as `receiving_warehouse` ,
                    cast(`transfer_employee` as STRING) as `transfer_employee` ,
                    cast(`ether_wms_transfer_receipt_id` as INT64) as `ether_wms_transfer_receipt_id` ,
                    cast(`receipt_number` as STRING) as `receipt_number` ,
                    cast(`closed_at` as TIMESTAMP) as `closed_at` ,
                    cast(`receiving_employee` as STRING) as `receiving_employee` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`data_source` as STRING) as `data_source` ,
                    cast(`transfer_total_serial_count` as INT64) as `transfer_total_serial_count` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_transfer_items`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_transfer_lines`' as 
    string
) as _dbt_source_relation,
                
                    cast(`transfer_number` as STRING) as `transfer_number` ,
                    cast(`transfer_item_line_number` as INT64) as `transfer_item_line_number` ,
                    cast(null as INT64) as `ether_wms_transfer_id` ,
                    cast(null as INT64) as `ether_wms_transfer_item_id` ,
                    cast(`transfer_item_status` as STRING) as `transfer_item_status` ,
                    cast(`transfer_created_at` as TIMESTAMP) as `transfer_created_at` ,
                    cast(`transfer_total_qty` as INT64) as `transfer_total_qty` ,
                    cast(null as STRING) as `transfer_reason` ,
                    cast(null as STRING) as `error_messages` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`picking_number` as STRING) as `picking_number` ,
                    cast(`shipment_number` as STRING) as `shipment_number` ,
                    cast(`transfer_status` as STRING) as `transfer_status` ,
                    cast(`shipped_at` as TIMESTAMP) as `shipped_at` ,
                    cast(null as BOOLEAN) as `is_digital` ,
                    cast(`sending_warehouse` as STRING) as `sending_warehouse` ,
                    cast(`receiving_warehouse` as STRING) as `receiving_warehouse` ,
                    cast(`transfer_employee` as STRING) as `transfer_employee` ,
                    cast(null as INT64) as `ether_wms_transfer_receipt_id` ,
                    cast(`receipt_number` as STRING) as `receipt_number` ,
                    cast(`closed_at` as TIMESTAMP) as `closed_at` ,
                    cast(`receiving_employee` as STRING) as `receiving_employee` ,
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`data_source` as STRING) as `data_source` ,
                    cast(`transfer_total_serial_count` as INT64) as `transfer_total_serial_count` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_transfer_lines`
        )

        

), final AS (

  SELECT
      transfer_items.*
    , serials.ether_wms_inventory_unit_id
    , serials.label_number
    , serials.base_currency
    , serials.consignment_status
    , serials.paid_out_status
    , serials.price_base_amount
    , serials.serial_relationship
    , serials.serial_cost_base_amount
    , serials.size
    , serials.original_intake_date
    , serials.original_intake_warehouse
    , serials.original_intake_warehouse_valid_to
    , (
        transfer_items.sending_warehouse = serials.original_intake_warehouse
        AND transfer_items.transfer_created_at <= serials.original_intake_warehouse_valid_to
      ) IS TRUE AS is_transfer_from_original_intake_warehouse
    , serials.warehouse AS current_warehouse
    , serials.warehouse_bin AS current_warehouse_bin
    , serials.current_warehouse_valid_from
    , (
        transfer_items.receiving_warehouse = serials.warehouse
        AND transfer_items.closed_at >= serials.current_warehouse_valid_from
      ) IS TRUE AS is_transfer_to_current_warehouse
    , serials.consignor_id
    , consignors.consignor_name
  FROM transfer_items
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serials
    ON transfer_items.serial_number = serials.serial_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_consignors` AS consignors
    ON serials.consignor_id = consignors.consignor_id

)

SELECT * FROM final