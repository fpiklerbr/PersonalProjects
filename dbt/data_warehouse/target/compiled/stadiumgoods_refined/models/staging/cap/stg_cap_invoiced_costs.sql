

WITH costs_union AS (

  

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_shipping_costs`' as 
    string
) as _dbt_source_relation,
                
                    cast(`tracking_number` as STRING) as `tracking_number` ,
                    cast(`ship_date` as DATE) as `ship_date` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`cap_client_center` as STRING) as `cap_client_center` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(`operations_subcategory` as STRING) as `operations_subcategory` ,
                    cast(`ship_cost` as FLOAT64) as `ship_cost` ,
                    cast(`warehouse_cost` as FLOAT64) as `warehouse_cost` ,
                    cast(null as STRING) as `cap_order_id` ,
                    cast(null as STRING) as `inventory_unit_label_number` ,
                    cast(null as FLOAT64) as `warehouse_quantity` ,
                    cast(null as FLOAT64) as `quantity` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_shipping_costs`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_vas_costs`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as STRING) as `tracking_number` ,
                    cast(null as DATE) as `ship_date` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`cap_client_center` as STRING) as `cap_client_center` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(`operations_subcategory` as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `ship_cost` ,
                    cast(`warehouse_cost` as FLOAT64) as `warehouse_cost` ,
                    cast(null as STRING) as `cap_order_id` ,
                    cast(null as STRING) as `inventory_unit_label_number` ,
                    cast(null as FLOAT64) as `warehouse_quantity` ,
                    cast(null as FLOAT64) as `quantity` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_vas_costs`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_item_costs`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as STRING) as `tracking_number` ,
                    cast(null as DATE) as `ship_date` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`cap_client_center` as STRING) as `cap_client_center` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(`operations_subcategory` as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `ship_cost` ,
                    cast(`warehouse_cost` as FLOAT64) as `warehouse_cost` ,
                    cast(`cap_order_id` as STRING) as `cap_order_id` ,
                    cast(`inventory_unit_label_number` as STRING) as `inventory_unit_label_number` ,
                    cast(`warehouse_quantity` as FLOAT64) as `warehouse_quantity` ,
                    cast(null as FLOAT64) as `quantity` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_item_costs`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_storage_costs`' as 
    string
) as _dbt_source_relation,
                
                    cast(null as STRING) as `tracking_number` ,
                    cast(null as DATE) as `ship_date` ,
                    cast(`invoice_date` as DATE) as `invoice_date` ,
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`cap_client_center` as STRING) as `cap_client_center` ,
                    cast(`operations_category` as STRING) as `operations_category` ,
                    cast(`operations_subcategory` as STRING) as `operations_subcategory` ,
                    cast(null as FLOAT64) as `ship_cost` ,
                    cast(`warehouse_cost` as FLOAT64) as `warehouse_cost` ,
                    cast(null as STRING) as `cap_order_id` ,
                    cast(null as STRING) as `inventory_unit_label_number` ,
                    cast(null as FLOAT64) as `warehouse_quantity` ,
                    cast(`quantity` as FLOAT64) as `quantity` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_invoiced_storage_costs`
        )

        

), costs_grouped AS (

  SELECT
      coalesce(tracking_number, cast('N/A - Aggregate Cost' AS string )) AS tracking_number
    , ship_date
    , invoice_date
    , invoice_id
    , cap_client_center
    , operations_category
    , operations_subcategory
    , coalesce(sum(ship_cost), 0) + coalesce(sum(warehouse_cost), 0) AS total_cost
    , sum(ship_cost) AS ship_cost
    , sum(warehouse_cost) AS warehouse_cost
  FROM costs_union
  GROUP BY 1, 2, 3, 4, 5, 6, 7

), final AS (

  SELECT
      costs_grouped.tracking_number
    , costs_grouped.ship_date
    , cast('CAP Invoice' AS string ) AS invoice_type
    , costs_grouped.invoice_date
    , costs_grouped.invoice_id
    , costs_grouped.cap_client_center
    , client_centers.cap_location
    , costs_grouped.operations_category
    , costs_grouped.operations_subcategory
    , costs_grouped.total_cost
    , costs_grouped.ship_cost
    , costs_grouped.warehouse_cost
  FROM costs_grouped
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_cap_client_centers` AS client_centers
    ON costs_grouped.cap_client_center = client_centers.cap_client_center

)

SELECT * FROM final