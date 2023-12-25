

WITH warehouse_union AS (

  

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`barrett__shipping`' as 
    string
) as _dbt_source_relation,
                
                    cast(`pick_id` as STRING) as `pick_id` ,
                    cast(`fulfillment_number` as STRING) as `fulfillment_number` ,
                    cast(`order_status` as STRING) as `order_status` ,
                    cast(`order_status_description` as STRING) as `order_status_description` ,
                    cast(`order_type` as STRING) as `order_type` ,
                    cast(`order_source` as STRING) as `order_source` ,
                    cast(`capacity_import_id` as STRING) as `capacity_import_id` ,
                    cast(`capacity_pick_ticket_id` as STRING) as `capacity_pick_ticket_id` ,
                    cast(`po_number` as STRING) as `po_number` ,
                    cast(`retailer_code` as STRING) as `retailer_code` ,
                    cast(`store_number` as STRING) as `store_number` ,
                    cast(`ship_to_location` as STRING) as `ship_to_location` ,
                    cast(`client_code` as STRING) as `client_code` ,
                    cast(`dropship_id` as STRING) as `dropship_id` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`allocation_line_number` as INT64) as `allocation_line_number` ,
                    cast(`label_number` as STRING) as `label_number` ,
                    cast(`capacity_order_quantity` as INT64) as `capacity_order_quantity` ,
                    cast(`item_ship_quantity` as INT64) as `item_ship_quantity` ,
                    cast(`shipped_quantity` as INT64) as `shipped_quantity` ,
                    cast(`capacity_uom` as STRING) as `capacity_uom` ,
                    cast(`capacity_case_pack` as STRING) as `capacity_case_pack` ,
                    cast(`item_product_id` as STRING) as `item_product_id` ,
                    cast(`item_serial_number` as STRING) as `item_serial_number` ,
                    cast(`ship_method` as STRING) as `ship_method` ,
                    cast(`carrier_code` as STRING) as `carrier_code` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(`ship_weight` as STRING) as `ship_weight` ,
                    cast(`ship_cartons` as STRING) as `ship_cartons` ,
                    cast(`tracking_number_total_ship_cost` as FLOAT64) as `tracking_number_total_ship_cost` ,
                    cast(`invoice_number` as STRING) as `invoice_number` ,
                    cast(`product_subtotal_amount` as FLOAT64) as `product_subtotal_amount` ,
                    cast(`total_discount_amount` as FLOAT64) as `total_discount_amount` ,
                    cast(`total_charge_amount` as FLOAT64) as `total_charge_amount` ,
                    cast(`total_tax_amount` as FLOAT64) as `total_tax_amount` ,
                    cast(`total_invoice_amount` as FLOAT64) as `total_invoice_amount` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` ,
                    cast(`source_file_time` as TIMESTAMP) as `source_file_time` ,
                    cast(`shipped_at` as TIMESTAMP) as `shipped_at` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`ship_warehouse` as STRING) as `ship_warehouse` ,
                    cast(`warehouse_priority` as INT64) as `warehouse_priority` ,
                    cast(null as TIMESTAMP) as `shipping_timestamp` ,
                    cast(null as STRING) as `ship_tracking` ,
                    cast(null as STRING) as `tracking_barcode` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`barrett__shipping`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__shipping`' as 
    string
) as _dbt_source_relation,
                
                    cast(`pick_id` as STRING) as `pick_id` ,
                    cast(`fulfillment_number` as STRING) as `fulfillment_number` ,
                    cast(`order_status` as STRING) as `order_status` ,
                    cast(`order_status_description` as STRING) as `order_status_description` ,
                    cast(`order_type` as STRING) as `order_type` ,
                    cast(`order_source` as STRING) as `order_source` ,
                    cast(`capacity_import_id` as STRING) as `capacity_import_id` ,
                    cast(`capacity_pick_ticket_id` as STRING) as `capacity_pick_ticket_id` ,
                    cast(`po_number` as STRING) as `po_number` ,
                    cast(`retailer_code` as STRING) as `retailer_code` ,
                    cast(`store_number` as STRING) as `store_number` ,
                    cast(`ship_to_location` as STRING) as `ship_to_location` ,
                    cast(`client_code` as STRING) as `client_code` ,
                    cast(`dropship_id` as STRING) as `dropship_id` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`allocation_line_number` as INT64) as `allocation_line_number` ,
                    cast(`label_number` as STRING) as `label_number` ,
                    cast(`capacity_order_quantity` as INT64) as `capacity_order_quantity` ,
                    cast(`item_ship_quantity` as INT64) as `item_ship_quantity` ,
                    cast(`shipped_quantity` as INT64) as `shipped_quantity` ,
                    cast(`capacity_uom` as STRING) as `capacity_uom` ,
                    cast(`capacity_case_pack` as STRING) as `capacity_case_pack` ,
                    cast(`item_product_id` as STRING) as `item_product_id` ,
                    cast(`item_serial_number` as STRING) as `item_serial_number` ,
                    cast(`ship_method` as STRING) as `ship_method` ,
                    cast(`carrier_code` as STRING) as `carrier_code` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(`ship_weight` as STRING) as `ship_weight` ,
                    cast(`ship_cartons` as STRING) as `ship_cartons` ,
                    cast(`tracking_number_total_ship_cost` as FLOAT64) as `tracking_number_total_ship_cost` ,
                    cast(`invoice_number` as STRING) as `invoice_number` ,
                    cast(`product_subtotal_amount` as FLOAT64) as `product_subtotal_amount` ,
                    cast(`total_discount_amount` as FLOAT64) as `total_discount_amount` ,
                    cast(`total_charge_amount` as FLOAT64) as `total_charge_amount` ,
                    cast(`total_tax_amount` as FLOAT64) as `total_tax_amount` ,
                    cast(`total_invoice_amount` as FLOAT64) as `total_invoice_amount` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` ,
                    cast(null as TIMESTAMP) as `source_file_time` ,
                    cast(`shipped_at` as TIMESTAMP) as `shipped_at` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`ship_warehouse` as STRING) as `ship_warehouse` ,
                    cast(`warehouse_priority` as INT64) as `warehouse_priority` ,
                    cast(`shipping_timestamp` as TIMESTAMP) as `shipping_timestamp` ,
                    cast(null as STRING) as `ship_tracking` ,
                    cast(null as STRING) as `tracking_barcode` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__shipping`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__shipping`' as 
    string
) as _dbt_source_relation,
                
                    cast(`pick_id` as STRING) as `pick_id` ,
                    cast(`fulfillment_number` as STRING) as `fulfillment_number` ,
                    cast(`order_status` as STRING) as `order_status` ,
                    cast(`order_status_description` as STRING) as `order_status_description` ,
                    cast(`order_type` as STRING) as `order_type` ,
                    cast(`order_source` as STRING) as `order_source` ,
                    cast(`capacity_import_id` as STRING) as `capacity_import_id` ,
                    cast(`capacity_pick_ticket_id` as STRING) as `capacity_pick_ticket_id` ,
                    cast(`po_number` as STRING) as `po_number` ,
                    cast(`retailer_code` as STRING) as `retailer_code` ,
                    cast(`store_number` as STRING) as `store_number` ,
                    cast(`ship_to_location` as STRING) as `ship_to_location` ,
                    cast(`client_code` as STRING) as `client_code` ,
                    cast(`dropship_id` as STRING) as `dropship_id` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`allocation_line_number` as INT64) as `allocation_line_number` ,
                    cast(`label_number` as STRING) as `label_number` ,
                    cast(`capacity_order_quantity` as INT64) as `capacity_order_quantity` ,
                    cast(`item_ship_quantity` as INT64) as `item_ship_quantity` ,
                    cast(`shipped_quantity` as INT64) as `shipped_quantity` ,
                    cast(`capacity_uom` as STRING) as `capacity_uom` ,
                    cast(`capacity_case_pack` as STRING) as `capacity_case_pack` ,
                    cast(`item_product_id` as STRING) as `item_product_id` ,
                    cast(`item_serial_number` as STRING) as `item_serial_number` ,
                    cast(`ship_method` as STRING) as `ship_method` ,
                    cast(`carrier_code` as STRING) as `carrier_code` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(`ship_weight` as STRING) as `ship_weight` ,
                    cast(`ship_cartons` as STRING) as `ship_cartons` ,
                    cast(`tracking_number_total_ship_cost` as FLOAT64) as `tracking_number_total_ship_cost` ,
                    cast(`invoice_number` as STRING) as `invoice_number` ,
                    cast(`product_subtotal_amount` as FLOAT64) as `product_subtotal_amount` ,
                    cast(`total_discount_amount` as FLOAT64) as `total_discount_amount` ,
                    cast(`total_charge_amount` as FLOAT64) as `total_charge_amount` ,
                    cast(`total_tax_amount` as FLOAT64) as `total_tax_amount` ,
                    cast(`total_invoice_amount` as FLOAT64) as `total_invoice_amount` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` ,
                    cast(null as TIMESTAMP) as `source_file_time` ,
                    cast(`shipped_at` as TIMESTAMP) as `shipped_at` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`ship_warehouse` as STRING) as `ship_warehouse` ,
                    cast(`warehouse_priority` as INT64) as `warehouse_priority` ,
                    cast(null as TIMESTAMP) as `shipping_timestamp` ,
                    cast(`ship_tracking` as STRING) as `ship_tracking` ,
                    cast(`tracking_barcode` as STRING) as `tracking_barcode` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__shipping`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`chw__shipping`' as 
    string
) as _dbt_source_relation,
                
                    cast(`pick_id` as STRING) as `pick_id` ,
                    cast(`fulfillment_number` as STRING) as `fulfillment_number` ,
                    cast(`order_status` as STRING) as `order_status` ,
                    cast(`order_status_description` as STRING) as `order_status_description` ,
                    cast(`order_type` as STRING) as `order_type` ,
                    cast(`order_source` as STRING) as `order_source` ,
                    cast(`capacity_import_id` as STRING) as `capacity_import_id` ,
                    cast(`capacity_pick_ticket_id` as STRING) as `capacity_pick_ticket_id` ,
                    cast(`po_number` as STRING) as `po_number` ,
                    cast(`retailer_code` as STRING) as `retailer_code` ,
                    cast(`store_number` as STRING) as `store_number` ,
                    cast(`ship_to_location` as STRING) as `ship_to_location` ,
                    cast(`client_code` as STRING) as `client_code` ,
                    cast(`dropship_id` as STRING) as `dropship_id` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`allocation_line_number` as INT64) as `allocation_line_number` ,
                    cast(`label_number` as STRING) as `label_number` ,
                    cast(`capacity_order_quantity` as INT64) as `capacity_order_quantity` ,
                    cast(`item_ship_quantity` as INT64) as `item_ship_quantity` ,
                    cast(`shipped_quantity` as INT64) as `shipped_quantity` ,
                    cast(`capacity_uom` as STRING) as `capacity_uom` ,
                    cast(`capacity_case_pack` as STRING) as `capacity_case_pack` ,
                    cast(`item_product_id` as STRING) as `item_product_id` ,
                    cast(`item_serial_number` as STRING) as `item_serial_number` ,
                    cast(`ship_method` as STRING) as `ship_method` ,
                    cast(`carrier_code` as STRING) as `carrier_code` ,
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(`ship_weight` as STRING) as `ship_weight` ,
                    cast(`ship_cartons` as STRING) as `ship_cartons` ,
                    cast(`tracking_number_total_ship_cost` as FLOAT64) as `tracking_number_total_ship_cost` ,
                    cast(`invoice_number` as STRING) as `invoice_number` ,
                    cast(`product_subtotal_amount` as FLOAT64) as `product_subtotal_amount` ,
                    cast(`total_discount_amount` as FLOAT64) as `total_discount_amount` ,
                    cast(`total_charge_amount` as FLOAT64) as `total_charge_amount` ,
                    cast(`total_tax_amount` as FLOAT64) as `total_tax_amount` ,
                    cast(`total_invoice_amount` as FLOAT64) as `total_invoice_amount` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` ,
                    cast(null as TIMESTAMP) as `source_file_time` ,
                    cast(`shipped_at` as TIMESTAMP) as `shipped_at` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`ship_warehouse` as STRING) as `ship_warehouse` ,
                    cast(`warehouse_priority` as INT64) as `warehouse_priority` ,
                    cast(null as TIMESTAMP) as `shipping_timestamp` ,
                    cast(`ship_tracking` as STRING) as `ship_tracking` ,
                    cast(`tracking_barcode` as STRING) as `tracking_barcode` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`chw__shipping`
        )

        

), last_file_by_allocation AS (

  SELECT
      ship_warehouse
    , fulfillment_number
    , allocation_line_number
    , max(shipped_at) AS shipped_at
  FROM warehouse_union
  WHERE shipped_quantity > 0
  GROUP BY 1, 2, 3

), joins AS (

  SELECT
      warehouse_union.*
    , coalesce(inventory_units.serial_number, warehouse_union.label_number) AS serial_number
    , row_number() OVER (
        PARTITION BY
            warehouse_union.fulfillment_number
          , warehouse_union.allocation_line_number
          , coalesce(inventory_units.serial_number, warehouse_union.label_number)
        ORDER BY
            warehouse_union.warehouse_priority NULLS LAST
      ) AS reporting_priority
  FROM warehouse_union
  INNER JOIN last_file_by_allocation
    ON warehouse_union.ship_warehouse = last_file_by_allocation.ship_warehouse
    AND warehouse_union.fulfillment_number = last_file_by_allocation.fulfillment_number
    AND warehouse_union.allocation_line_number = last_file_by_allocation.allocation_line_number
    AND warehouse_union.shipped_at = last_file_by_allocation.shipped_at
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON warehouse_union.label_number = inventory_units.label_number
    AND warehouse_union.shipped_at >= inventory_units.label_number_valid_from
    AND warehouse_union.shipped_at <= inventory_units.label_number_valid_to

), dups AS (

  select
    ship_warehouse
  , fulfillment_number
  , allocation_line_number
  , count(*)
  from joins
  where reporting_priority = 1
  group by 1,2,3
  having count(*) > 1

), dedups AS (

  select
    orders.x3_issued_serial
  , joins.serial_number
  , joins.label_number
  , joins.fulfillment_number
  , joins.allocation_line_number
  from joins
  inner join dups using(fulfillment_number, allocation_line_number)
  inner join `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info_items` orders
  using(fulfillment_number, allocation_line_number)
  WHERE orders.x3_issued_serial = joins.serial_number
  --AND orders.x3_issued_serial IS NOT NULL

), unique_fulfillments AS (

  SELECT joins.* FROM joins
  WHERE NOT EXISTS (
  select * from dups
  WHERE joins.fulfillment_number   = dups.fulfillment_number
  AND joins.allocation_line_number = dups.allocation_line_number
  )

), dedup_fulfillments AS (

  SELECT joins.* FROM joins
  INNER JOIN dedups USING(serial_number, fulfillment_number, allocation_line_number)

), final AS (

  SELECT * FROM unique_fulfillments
  UNION ALL
  SELECT * FROM dedup_fulfillments

)

SELECT * FROM final