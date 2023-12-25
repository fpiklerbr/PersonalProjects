

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders`
  
  
  OPTIONS()
  as (
    with union_all as (


        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_yseristatus_issued`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`stadium_order_id` as STRING) as `stadium_order_id` ,
                    cast(`order_creation_nyc` as DATETIME) as `order_creation_nyc` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_yseristatus_issued`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_allocated_or_issued`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`stadium_order_id` as STRING) as `stadium_order_id` ,
                    cast(`order_creation_nyc` as DATETIME) as `order_creation_nyc` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_allocated_or_issued`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_source_sold`' as 
    string
) as _dbt_source_relation,
                
                    cast(`serial_number` as STRING) as `serial_number` ,
                    cast(`stadium_order_id` as STRING) as `stadium_order_id` ,
                    cast(`order_creation_nyc` as DATETIME) as `order_creation_nyc` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_source_sold`
        )

        
)

SELECT DISTINCT *
FROM union_all
  );
    