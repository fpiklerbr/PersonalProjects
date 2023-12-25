

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_gtv_lines`
  
  
  OPTIONS()
  as (
    WITH last_order AS (

  SELECT
    max(order_date) AS last_order_date
  , max(order_timestamp_nyc) AS last_order_timestamp
  , EXTRACT(TIME from max(order_timestamp_nyc)) AS intraday_cutoff
  , 

        datetime_add(
            cast( max(order_timestamp_nyc) as datetime),
        interval -3 hour
        )

 AS three_hour_start
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_gtv_lines_tmp` AS tmp_gtv_lines
  WHERE order_date < safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS date)
 -- exclude the current day from 'Today' until we have a few hours' worth of orders
    OR (order_date = safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS date) AND order_time > '04:00:00')

), intraday_days AS (

  SELECT DISTINCT
  tmp_gtv_lines.order_date
  , CASE

  	WHEN tmp_gtv_lines.order_date = 

        datetime_add(
            cast( last_order_date as datetime),
        interval 0 day
        )


  	THEN 'Today'

  	WHEN tmp_gtv_lines.order_date = 

        datetime_add(
            cast( last_order_date as datetime),
        interval -1 day
        )


  	THEN 'Yesterday'

  	WHEN tmp_gtv_lines.order_date = 

        datetime_add(
            cast( last_order_date as datetime),
        interval -7 day
        )


  	THEN '7 Days Ago'

  	WHEN tmp_gtv_lines.order_date = 

        datetime_add(
            cast( last_order_date as datetime),
        interval -14 day
        )


  	THEN '2 Weeks Ago'

  	WHEN tmp_gtv_lines.order_date = 

        datetime_add(
            cast( last_order_date as datetime),
        interval -21 day
        )


  	THEN '3 Weeks Ago'

  	WHEN tmp_gtv_lines.order_date = 

        datetime_add(
            cast( last_order_date as datetime),
        interval -28 day
        )


  	THEN '4 Weeks Ago'

  END intraday_day
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_gtv_lines_tmp` AS tmp_gtv_lines
  INNER JOIN last_order ON tmp_gtv_lines.order_date IN
  (

      

        datetime_add(
            cast( last_order.last_order_date as datetime),
        interval 0 day
        )



    , 

        datetime_add(
            cast( last_order.last_order_date as datetime),
        interval -1 day
        )



    , 

        datetime_add(
            cast( last_order.last_order_date as datetime),
        interval -7 day
        )



    , 

        datetime_add(
            cast( last_order.last_order_date as datetime),
        interval -14 day
        )



    , 

        datetime_add(
            cast( last_order.last_order_date as datetime),
        interval -21 day
        )



    , 

        datetime_add(
            cast( last_order.last_order_date as datetime),
        interval -28 day
        )



  )

), all_channels AS (

  SELECT DISTINCT
  business_unit
  , sales_channel
  , channel_or_gateway
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_gtv_lines_tmp` AS tmp_gtv_lines
  INNER JOIN intraday_days ON tmp_gtv_lines.order_date = intraday_days.order_date

), gtv_lines_order_hour AS (

  SELECT
    tmp_gtv_lines.stadium_order_id
  , tmp_gtv_lines.product_sku
  , tmp_gtv_lines.variant_size
  , tmp_gtv_lines.serial_source
  , tmp_gtv_lines.order_sku_size_source_line
  , tmp_gtv_lines.data_source
  , tmp_gtv_lines.payment_id
  , tmp_gtv_lines.order_or_payment_id
  , tmp_gtv_lines.channel_or_gateway
  , tmp_gtv_lines.sales_channel
  , tmp_gtv_lines.business_unit
  , tmp_gtv_lines.geography_type
  , tmp_gtv_lines.private_customer_status
  , tmp_gtv_lines.private_customer_type
  , tmp_gtv_lines.private_customer_source
  , tmp_gtv_lines.private_customer_stylist
  , tmp_gtv_lines.inventory_type
  , tmp_gtv_lines.order_date
  , tmp_gtv_lines.order_time
  , tmp_gtv_lines.order_timestamp_nyc
  , tmp_gtv_lines.gtv_paid
  , tmp_gtv_lines.gtv_credit_redeemed
  , tmp_gtv_lines.gtv_item_discounts
  , tmp_gtv_lines.gtv_shipping_discounts
  , tmp_gtv_lines.gtv_total
  , last_order.last_order_date
  , last_order.last_order_timestamp
  , intraday_days.intraday_day IS NOT NULL AND tmp_gtv_lines.order_time <= last_order.intraday_cutoff AS intraday_filter
  , intraday_days.intraday_day
  , tmp_gtv_lines.order_timestamp_nyc BETWEEN last_order.three_hour_start AND last_order.last_order_timestamp AS three_hour_filter
  , last_order.three_hour_start
  , /*  when 2020-06-22 15:00:00  <> 2020-06-22 15:10:00 then 2020-06-22 15:00:00 + 1 hour */
  	 CASE
      WHEN CAST(
    timestamp_trunc(
        cast(tmp_gtv_lines.order_timestamp_nyc as timestamp),
        hour
    )

 AS datetime) = (tmp_gtv_lines.order_timestamp_nyc)
      --  datetime_add(cast( as datetime),interval 1 hour)
      THEN 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(--last_order.last_order_date + tmp_gtv_lines.order_time
  CASE WHEN last_order.last_order_date is not NULL AND tmp_gtv_lines.order_time is not NULL
  THEN CAST(substr(
    concat(
    
      coalesce(trim(CAST(last_order.last_order_date AS string))|| '' , '')
    
      , coalesce(' '|| '' , '')
    
      , coalesce(trim(CAST(tmp_gtv_lines.order_time AS string))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(trim(CAST(last_order.last_order_date AS string))|| '' , '')
    
      , coalesce(' '|| '' , '')
    
      , coalesce(trim(CAST(tmp_gtv_lines.order_time AS string))|| '' , '')
    
  )) - length('')
      , 0
    )
) AS datetime)
      END as timestamp),
        hour
    )

 as datetime),
        interval 0 hour
        )


      ELSE 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(--last_order.last_order_date + tmp_gtv_lines.order_time
  CASE WHEN last_order.last_order_date is not NULL AND tmp_gtv_lines.order_time is not NULL
  THEN CAST(substr(
    concat(
    
      coalesce(trim(CAST(last_order.last_order_date AS string))|| '' , '')
    
      , coalesce(' '|| '' , '')
    
      , coalesce(trim(CAST(tmp_gtv_lines.order_time AS string))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(trim(CAST(last_order.last_order_date AS string))|| '' , '')
    
      , coalesce(' '|| '' , '')
    
      , coalesce(trim(CAST(tmp_gtv_lines.order_time AS string))|| '' , '')
    
  )) - length('')
      , 0
    )
) AS datetime)
      END as timestamp),
        hour
    )

 as datetime),
        interval 1 hour
        )


      END
    AS intraday_hour
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_gtv_lines_tmp` AS tmp_gtv_lines
  LEFT JOIN intraday_days ON intraday_days.order_date = tmp_gtv_lines.order_date
  CROSS JOIN last_order

), all_channel_last_order_date AS (

  SELECT DISTINCT
  CAST(NULL AS string) AS stadium_order_id
  , CAST(NULL AS string) AS product_sku
  , CAST(NULL AS string) AS variant_size
  , CAST(NULL AS string) AS serial_source
  , CAST(NULL AS int64) AS order_sku_size_source_line
  , CAST(NULL AS string) AS data_source
  , CAST(NULL AS string) AS payment_id
  , CAST(NULL AS string) as order_or_payment_id
  , channel_or_gateway
  , sales_channel
  , business_unit
  , CAST(NULL AS string) AS geography_type
  , CAST(NULL AS string) AS private_customer_status
  , CAST(NULL AS string) AS private_customer_type
  , CAST(NULL AS string) AS private_customer_source
  , CAST(NULL AS string) AS private_customer_stylist
  , CAST(NULL AS string) AS inventory_type
  , order_date
  , CAST(NULL AS time) AS order_time
  , CAST(NULL AS datetime) AS order_timestamp_nyc
  , CAST(NULL AS float64) AS gtv_paid
  , CAST(NULL AS float64) AS gtv_credit_redeemed
  , CAST(NULL AS float64) AS gtv_item_discounts
  , CAST(NULL AS float64) AS gtv_shipping_discounts
  , CAST(0 AS float64) AS gtv_total
  , last_order_date
  , last_order_timestamp
  , TRUE AS intraday_filter
  , intraday_day
  , FALSE AS three_hour_filter
  , three_hour_start
  /* 2020-06-22 + 12 hour */
  ,  CASE WHEN business_unit = 'Store'
      THEN 

        datetime_add(
            cast( last_order_date as datetime),
        interval 12 hour
        )


      ELSE 

        datetime_add(
            cast( last_order_date as datetime),
        interval 0 hour
        )


      END
    AS intraday_hour
  FROM all_channels
  CROSS JOIN intraday_days
  CROSS JOIN last_order
  WHERE business_unit <> 'Store'
  OR intraday_cutoff >= CAST('12:00:00' AS time)

), all_channel_last_order_hour AS (

  SELECT DISTINCT
  CAST(NULL AS string) AS stadium_order_id
  , CAST(NULL AS string) AS product_sku
  , CAST(NULL AS string) AS variant_size
  , CAST(NULL AS string) AS serial_source
  , CAST(NULL AS int64) AS order_sku_size_source_line
  , CAST(NULL AS string) AS data_source
  , CAST(NULL AS string) AS payment_id
  , CAST(NULL AS string) as order_or_payment_id
  , channel_or_gateway
  , sales_channel
  , business_unit
  , CAST(NULL AS string) AS geography_type
  , CAST(NULL AS string) AS private_customer_status
  , CAST(NULL AS string) AS private_customer_type
  , CAST(NULL AS string) AS private_customer_source
  , CAST(NULL AS string) AS private_customer_stylist
  , CAST(NULL AS string) AS inventory_type
  , order_date
  , CAST(NULL AS time) AS order_time
  , CAST(NULL AS datetime) AS order_timestamp_nyc
  , CAST(NULL AS float64) AS gtv_paid
  , CAST(NULL AS float64) AS gtv_credit_redeemed
  , CAST(NULL AS float64) AS gtv_item_discounts
  , CAST(NULL AS float64) AS gtv_shipping_discounts
  , CAST(0 AS float64) AS gtv_total
  , last_order_date
  , last_order_timestamp
  , TRUE AS intraday_filter
  , intraday_day
  , FALSE AS three_hour_filter
  , three_hour_start
  , CASE WHEN CAST(
    timestamp_trunc(
        cast(last_order_timestamp as timestamp),
        hour
    )

 AS datetime) = last_order_timestamp
      THEN 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(last_order_timestamp as timestamp),
        hour
    )

 as datetime),
        interval 0 hour
        )


      ELSE 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(last_order_timestamp as timestamp),
        hour
    )

 as datetime),
        interval 1 hour
        )


      END
    AS intraday_hour
  FROM all_channels
  CROSS JOIN intraday_days
  CROSS JOIN last_order
  WHERE business_unit <> 'Store'
  OR intraday_cutoff >= CAST('12:00:00' AS time)

), gtv_union AS (

  SELECT *
  FROM gtv_lines_order_hour
  UNION ALL
  SELECT *
  FROM all_channel_last_order_date
  UNION ALL
  SELECT *
  FROM all_channel_last_order_hour

), final AS (

  SELECT gtv_union.*
  , current_timestamp AS rebuild_timestamp
  , safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS date) AS rebuild_date
  FROM gtv_union

)

SELECT * FROM final
  );
    