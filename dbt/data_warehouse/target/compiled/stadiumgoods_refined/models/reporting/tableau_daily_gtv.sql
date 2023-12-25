


WITH sgl_order AS ( -- sgl order level info
	SELECT stadium_order_id
	, order_date
	, sales_channel
	, private_customer_type
	, SUM(gtv_total) AS gtv_total
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_gtv_lines` AS stadium_gtv_lines
	GROUP BY 1,2,3,4
)

, sfl_order AS ( -- sgl order level info
	SELECT stadium_order_id
	, inventory_type
	, COUNT (DISTINCT serial_number) AS gtv_qty
	, SUM(gmv_total) AS gmv_total
	, SUM(gmv_qty) AS gmv_qty
	, SUM(gtv_less_cancelled) AS gtv_less_cancelled
	, SUM(promos_total) AS promos_total
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS stadium_finance_lines
	GROUP BY 1,2	
)

, sol_order AS ( -- sol order level info
	SELECT stadium_order_id
	, order_date
	, mag_order_creation_nyc
	, shipping_timestamp_nyc
	, pick_creation_nyc
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS stadium_order_lines
)

, sol_adj_time AS ( -- sol order level adjusted time 
	SELECT stadium_order_id
	, mag_order_creation_nyc
	, MAX(shipping_timestamp_nyc) AS adj_shipping_time_nyc 
	, COALESCE(MAX(pick_creation_nyc), MAX(shipping_timestamp_nyc)) AS adj_pick_creation_nyc
	, MAX(CASE
          WHEN 
  extract(DAYOFWEEK FROM order_date) -1
 = 6 THEN DATE(

        datetime_add(
            cast( order_date as datetime),
        interval 2 day
        )

) -- If Saturday, +2
		  WHEN 
  extract(DAYOFWEEK FROM order_date) -1
 = 0 THEN DATE(

        datetime_add(
            cast( order_date as datetime),
        interval 1 day
        )

) -- If Sunday, +1
		  ELSE NULL                                             
		  END) AS sla_following_monday_for_weekends
	FROM sol_order
	GROUP BY 1,2
)

, sol_agg AS ( -- sol order level SoS
	SELECT stadium_order_id
	, mag_order_creation_nyc
	, adj_shipping_time_nyc
	, adj_pick_creation_nyc
	, sla_following_monday_for_weekends
	, CASE
    WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 BETWEEN 1 AND 3 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        second
    )


	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 0 AND 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(sla_following_monday_for_weekends as datetime),
        day
    )

 < 0 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        second
    )

 -- //Marks SOS for Sunday Orders as time between Order and Ship if a Sunday order happens to ship same day//
	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 0 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(sla_following_monday_for_weekends as datetime),
        second
    )

 -- //Marks SOS for all other Sunday orders as order time beginning the following Monday//
	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 6 AND 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(sla_following_monday_for_weekends as datetime),
        day
    )

 < 0 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        second
    )

 -- //Marks SOS for Saturday Orders as time between Order and Ship if a Saturday order happens to ship before Monday//
	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 6 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(sla_following_monday_for_weekends as datetime),
        second
    )

 -- //Marks SOS for all other Sunday orders as order time beginning the following Monday//
	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 5 AND 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        day
    )

 <= 2 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        second
    )

 -- //Marks SOS for Friday orders as time between order and ship, minus the weekend if order did not ship in time
	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 5 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        second
    )

 - 2*24*3600
	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 4 AND 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        day
    )

 <= 2 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        second
    )

 -- //Marks SOS for Thursday orders as time between order and ship, minus the weekend if order did not ship in time
	WHEN 
  extract(DAYOFWEEK FROM mag_order_creation_nyc) -1
 = 4 AND 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        day
    )

 >= 2 THEN 

    datetime_diff(
        cast(adj_shipping_time_nyc as datetime),
        cast(mag_order_creation_nyc as datetime),
        second
    )

 - 2*24*3600
	END AS adj_sos_seconds
	FROM sol_adj_time
)

, order_agg AS (
	SELECT sgl_order.stadium_order_id
	, sgl_order.order_date
	, sgl_order.sales_channel
	, sgl_order.private_customer_type
	, sfl_order.inventory_type
	, sgl_order.gtv_total
	, sfl_order.gtv_qty
	, sfl_order.gmv_total
	, sfl_order.gmv_qty -- ATV units
	, sfl_order.gtv_less_cancelled -- ATV dollars
	, sfl_order.promos_total
	, sol_agg.adj_sos_seconds
	, CAST((sol_agg.adj_sos_seconds/(24*3600)) AS numeric) AS adj_sos_days
	, CAST((sol_agg.adj_sos_seconds/3600) AS numeric) AS adj_sos_hours
	, CASE WHEN sol_agg.adj_sos_seconds/(24*3600) <= 2 THEN 1 ELSE 0 END AS sg_sla -- 2 days
	, CASE WHEN sol_agg.adj_sos_seconds/3600 < 48 THEN 1 ELSE 0 END AS ff_sla -- 48 hours
	FROM sgl_order LEFT JOIN sfl_order
	ON sgl_order.stadium_order_id = sfl_order.stadium_order_id
	LEFT JOIN sol_agg ON sgl_order.stadium_order_id = sol_agg.stadium_order_id
)

SELECT order_date
, sales_channel
, SUM(gtv_total) AS gtv_total
, SUM(gtv_qty) AS gtv_qty
, SUM(gmv_total) AS gmv_total
, SUM(gmv_qty) AS gmv_qty
, SUM(gtv_less_cancelled) AS gtv_less_cancelled
, SUM(promos_total) AS promos_total
, SUM(sg_sla) AS sg_sla_pass
, SUM(ff_sla) AS ff_sla_pass
, COUNT(*) AS order_line_count
, AVG(CAST(adj_sos_days  AS numeric)) AS avg_adj_sos_days
, AVG(CAST(adj_sos_hours AS numeric)) AS avg_adj_sos_hours
FROM order_agg
GROUP BY 1,2

UNION ALL

SELECT order_date
, 'DTC ex. DSS' AS sales_channel
, SUM(gtv_total) AS gtv_total
, SUM(gtv_qty) AS gtv_qty
, SUM(gmv_total) AS gmv_total
, SUM(gmv_qty) AS gmv_qty
, SUM(gtv_less_cancelled) AS gtv_less_cancelled
, SUM(promos_total) AS promos_total
, SUM(sg_sla) AS sg_sla_pass
, SUM(ff_sla) AS ff_sla_pass
, COUNT(*) AS order_line_count
, AVG(CAST(adj_sos_days  AS numeric)) AS avg_adj_sos_days
, AVG(CAST(adj_sos_hours AS numeric)) AS avg_adj_sos_hours
FROM order_agg
WHERE sales_channel = 'FPS DTC'
AND inventory_type NOT IN ('Dropship')
GROUP BY 1,2

UNION ALL

SELECT order_date
, 'Private Client' AS sales_channel
, SUM(gtv_total) AS gtv_total
, SUM(gtv_qty) AS gtv_qty
, SUM(gmv_total) AS gmv_total
, SUM(gmv_qty) AS gmv_qty
, SUM(gtv_less_cancelled) AS gtv_less_cancelled
, SUM(promos_total) AS promos_total
, SUM(sg_sla) AS sg_sla_pass
, SUM(ff_sla) AS ff_sla_pass
, COUNT(*) AS order_line_count
, AVG(CAST(adj_sos_days  AS numeric))  AS avg_adj_sos_days
, AVG(CAST(adj_sos_hours AS numeric)) AS avg_adj_sos_hours
FROM order_agg
WHERE private_customer_type IS NOT NULL
GROUP BY 1,2

UNION ALL

SELECT order_date
, 'Total' AS sales_channel
, SUM(gtv_total) AS gtv_total
, SUM(gtv_qty) AS gtv_qty
, SUM(gmv_total) AS gmv_total
, SUM(gmv_qty) AS gmv_qty
, SUM(gtv_less_cancelled) AS gtv_less_cancelled
, SUM(promos_total) AS promos_total
, SUM(sg_sla) AS sg_sla_pass
, SUM(ff_sla) AS ff_sla_pass
, COUNT(*) AS order_line_count
, AVG(CAST(adj_sos_days  AS numeric))  AS avg_adj_sos_days
, AVG(CAST(adj_sos_hours AS numeric)) AS avg_adj_sos_hours
FROM order_agg
GROUP BY 1,2