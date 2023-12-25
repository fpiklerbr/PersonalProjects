

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`cap_receiving_lines`
  
  
  OPTIONS()
  as (
    



WITH receiving_union AS (

  

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__receiving`' as 
    string
) as _dbt_source_relation,
                
                    cast(`po_number` as STRING) as `po_number` ,
                    cast(`capacity_po_number` as STRING) as `capacity_po_number` ,
                    cast(`receive_date` as DATE) as `receive_date` ,
                    cast(`line_number` as INT64) as `line_number` ,
                    cast(`label_number` as STRING) as `label_number` ,
                    cast(`quantity` as INT64) as `quantity` ,
                    cast(`quantity_ordered` as INT64) as `quantity_ordered` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__receiving`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__receiving`' as 
    string
) as _dbt_source_relation,
                
                    cast(`po_number` as STRING) as `po_number` ,
                    cast(`capacity_po_number` as STRING) as `capacity_po_number` ,
                    cast(`receive_date` as DATE) as `receive_date` ,
                    cast(`line_number` as INT64) as `line_number` ,
                    cast(`label_number` as STRING) as `label_number` ,
                    cast(`quantity` as INT64) as `quantity` ,
                    cast(`quantity_ordered` as INT64) as `quantity_ordered` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__receiving`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`chw__receiving`' as 
    string
) as _dbt_source_relation,
                
                    cast(`po_number` as STRING) as `po_number` ,
                    cast(`capacity_po_number` as STRING) as `capacity_po_number` ,
                    cast(`receive_date` as DATE) as `receive_date` ,
                    cast(`line_number` as INT64) as `line_number` ,
                    cast(`label_number` as STRING) as `label_number` ,
                    cast(`quantity` as INT64) as `quantity` ,
                    cast(`quantity_ordered` as INT64) as `quantity_ordered` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`chw__receiving`
        )

        

)

  SELECT
      receiving_union.*
    , CASE receiving_union._dbt_source_relation

        WHEN '`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__receiving`' THEN cast('CAP' AS string)

        WHEN '`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__receiving`' THEN cast('LAW' AS string)

        WHEN '`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`chw__receiving`' THEN cast('CHW' AS string)

      END AS receiving_warehouse
    , coalesce(inventory_units.serial_number, receiving_union.label_number) AS serial_number
    , receiving_union.quantity > 0 AS is_received
    , CASE WHEN receiving_union.quantity > 0 THEN receiving_union.file_time END AS received_at
    , min(CASE WHEN receiving_union.quantity > 0 THEN receiving_union.receive_date END) OVER (PARTITION BY receiving_union.po_number) AS po_number_first_receive_date
    , current_timestamp AS rebuild_timestamp
  FROM receiving_union
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON receiving_union.label_number = inventory_units.label_number
    AND receiving_union.file_time >= inventory_units.label_number_valid_from
    AND receiving_union.file_time <= inventory_units.label_number_valid_to
  );
    