WITH sgl_agg AS (
-- gtv by date

	SELECT
	  order_date
	, sales_channel
	, CASE WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' AND private_customer_source = 'Retail' THEN 'non-PC'
	WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' AND private_customer_source <> 'Retail' THEN 'PC'
	WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status IS NULL THEN 'non-PC'
	WHEN sales_channel NOT IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' THEN 'PC'
	WHEN sales_channel NOT IN ('Chicago Store', 'SG Store') AND private_customer_status IS NULL THEN 'non-PC'
	END AS private_customer_type
-- in order to credit PC spend at retial back to retail
	, CASE WHEN (serial_source LIKE 'DSCO%' OR serial_source LIKE 'DSS%')
	    THEN 'DSS'
	    ELSE 'non-DSS'
	    END AS inventory_type
	, SUM(gtv_total) AS gtv_total
	, COUNT(DISTINCT stadium_order_id) AS transactions
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_gtv_lines`
	WHERE order_date >= '2021-01-01'
	GROUP BY 1,2,3,4

), sfl_agg AS (
-- finance_lines by date

	SELECT
	  order_date
	, sales_channel
	, CASE WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' AND private_customer_source = 'Retail' THEN 'non-PC'
	WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' AND private_customer_source <> 'Retail' THEN 'PC'
	WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status IS NULL THEN 'non-PC'
	WHEN sales_channel NOT IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' THEN 'PC'
	WHEN sales_channel NOT IN ('Chicago Store', 'SG Store') AND private_customer_status IS NULL THEN 'non-PC'
	END AS private_customer_type -- in order to credit PC spend at retial back to retail
	, CASE WHEN inventory_type = 'Dropship'
	    THEN 'DSS'
	    ELSE 'non-DSS'
	    END AS inventory_type
	, COUNT(DISTINCT serial_number) AS gtv_qty
	, SUM(gmv_total) AS gmv_total
	, SUM(gmv_qty) AS gmv_qty
	, SUM(gtv_less_cancelled) AS gtv_less_cancelled
	, SUM(gtv_item_discounts) + SUM(gtv_shipping_discounts) AS promos_total
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
	WHERE order_date >= '2021-01-01'
	GROUP BY 1,2,3,4

), sol_order AS (
-- sol order level adjusted time

	SELECT
      order_date
	, mag_order_creation_nyc
	, sales_channel
	, stadium_order_id
	, stadium_order_id||'-'||serial_number AS order_line_id
	, CASE WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' AND private_customer_source = 'Retail' THEN 'non-PC'
	WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' AND private_customer_source <> 'Retail' THEN 'PC'
	WHEN sales_channel IN ('Chicago Store', 'SG Store') AND private_customer_status IS NULL THEN 'non-PC'
	WHEN sales_channel NOT IN ('Chicago Store', 'SG Store') AND private_customer_status = 'Private Client' THEN 'PC'
	WHEN sales_channel NOT IN ('Chicago Store', 'SG Store') AND private_customer_status IS NULL THEN 'non-PC'
	END AS private_customer_type -- in order to credit PC spend at retial back to retail
	, CASE WHEN inventory_type = 'Dropship' THEN 'DSS' ELSE 'non-DSS' END AS inventory_type
	, MAX(shipping_timestamp_nyc) AS adj_shipping_time_nyc -- IF NULL, need to exclude it from Pass Rate Calculation
	, COALESCE(MAX(pick_creation_nyc), MAX(shipping_timestamp_nyc)) AS adj_pick_creation_nyc -- Not in use at the moment
	, MAX(CASE
          WHEN EXTRACT(DAYOFWEEK FROM order_date) = 7 THEN DATE_ADD(order_date, INTERVAL 2 DAY) -- If Saturday, +2
		  WHEN EXTRACT(DAYOFWEEK FROM order_date) = 1 THEN DATE_ADD(order_date, INTERVAL 1 DAY) -- If Sunday, +1
		  ELSE NULL -- This filed will only be used for weekend orders.
		  END) AS sla_following_monday_for_weekends
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines`
	WHERE order_date >= '2021-01-01'
	AND shipping_timestamp_nyc IS NOT NULL -- Only calculate shipped orders SLA
	GROUP BY 1,2,3,4,5,6,7

), sol_sos AS (
-- sol order level SoS

	SELECT
    order_line_id
	-- If order got shipped within the same week they placed, we just use Ship Time - Order Time
	, CASE
    WHEN EXTRACT(WEEK FROM mag_order_creation_nyc) = EXTRACT(WEEK FROM adj_shipping_time_nyc)
    THEN UNIX_SECONDS(timestamp(adj_shipping_time_nyc)) - UNIX_SECONDS(timestamp(mag_order_creation_nyc))
	-- If they shipped after the week the order was placed
	-- Mon-Fri orders, we use Ship Time - Order Time - 2 days (to take out the weekends)
	WHEN EXTRACT(WEEK FROM mag_order_creation_nyc) < EXTRACT(WEEK FROM adj_shipping_time_nyc)
        AND extract(DAYOFWEEK from mag_order_creation_nyc) BETWEEN 2 AND 6
    THEN UNIX_SECONDS(timestamp(adj_shipping_time_nyc)) - UNIX_SECONDS(timestamp(mag_order_creation_nyc)) - 2*24*3600
	-- SAT & SUN orders, we consider it as a Monday order, and use Ship Time - next Monday
	WHEN EXTRACT(WEEK FROM mag_order_creation_nyc) < EXTRACT(WEEK FROM adj_shipping_time_nyc)
        AND (extract(DAYOFWEEK from mag_order_creation_nyc) = 7 or extract(DAYOFWEEK from mag_order_creation_nyc) = 1)
    THEN UNIX_SECONDS(timestamp(adj_shipping_time_nyc)) - UNIX_SECONDS(timestamp(sla_following_monday_for_weekends))
	END AS adj_sos_seconds
	FROM sol_order

), sol_sla AS (

	SELECT
      sol_order.order_date
	, sol_order.sales_channel
	, sol_order.stadium_order_id
	, sol_order.order_line_id
	, sol_order.private_customer_type
	, sol_order.inventory_type
	, CAST((sol_sos.adj_sos_seconds/3600) AS NUMERIC) AS adj_sos_hours
	, CASE WHEN sol_sos.adj_sos_seconds/3600 <= 48 THEN 1 ELSE 0 END AS ff_sla -- 48 hours
	, CASE WHEN sol_sos.adj_sos_seconds/3600 <= 72 THEN 1 ELSE 0 END AS sg_sla -- 72 hours
	FROM sol_order
    LEFT JOIN sol_sos
	ON sol_order.order_line_id = sol_sos.order_line_id

), sol_agg AS (
-- sol by date

	SELECT
      order_date
	, sales_channel
	, private_customer_type
	, inventory_type
	, SUM(sg_sla) AS sg_sla_pass
	, SUM(ff_sla) AS ff_sla_pass
	, COUNT(*) AS shipped_order_line_count
	, AVG(CAST(adj_sos_hours AS NUMERIC)) AS avg_adj_sos_hours
	FROM sol_sla
	GROUP BY 1,2,3,4

), all_agg AS (

	SELECT
      sgl_agg.order_date
	, sgl_agg.sales_channel
	, sgl_agg.private_customer_type
	, sfl_agg.inventory_type
	, sgl_agg.gtv_total
	, sgl_agg.transactions
	, sfl_agg.gtv_qty
	, sfl_agg.gmv_total
	, sfl_agg.gmv_qty -- ATV units
	, sfl_agg.gtv_less_cancelled -- ATV dollars
	, sfl_agg.promos_total
	, sol_agg.sg_sla_pass
	, sol_agg.ff_sla_pass
	, sol_agg.shipped_order_line_count
	, sol_agg.avg_adj_sos_hours
    FROM sgl_agg
    FULL JOIN sfl_agg USING(order_date,sales_channel,private_customer_type,inventory_type)
    FULL JOIN sol_agg USING(order_date,sales_channel,private_customer_type,inventory_type)

), unioned AS (

	SELECT
      order_date
	, sales_channel
	, SUM(gtv_total) AS gtv_total
	, SUM(gtv_qty) AS gtv_qty
	, SUM(gmv_total) AS gmv_total
	, SUM(gmv_qty) AS gmv_qty
	, SUM(gtv_less_cancelled) AS gtv_less_cancelled
	, SUM(promos_total) AS promos_total
	, SUM(transactions) AS transactions
	, SUM(sg_sla_pass) AS sg_sla_pass
	, SUM(ff_sla_pass) AS ff_sla_pass
	, SUM(shipped_order_line_count) AS shipped_order_line_count
	, AVG(CAST(avg_adj_sos_hours as NUMERIC)) AS avg_adj_sos_hours
	FROM all_agg
	WHERE private_customer_type = 'non-PC'
	GROUP BY 1,2

	UNION ALL

	SELECT
      order_date
	, 'DTC ex. DSS' AS sales_channel
	, SUM(gtv_total) AS gtv_total
	, SUM(gtv_qty) AS gtv_qty
	, SUM(gmv_total) AS gmv_total
	, SUM(gmv_qty) AS gmv_qty
	, SUM(gtv_less_cancelled) AS gtv_less_cancelled
	, SUM(promos_total) AS promos_total
	, SUM(transactions) AS transactions
	, SUM(sg_sla_pass) AS sg_sla_pass
	, SUM(ff_sla_pass) AS ff_sla_pass
	, SUM(shipped_order_line_count) AS shipped_order_line_count
	, AVG(CAST(avg_adj_sos_hours as NUMERIC)) AS avg_adj_sos_hours
	FROM all_agg
	WHERE sales_channel = 'FPS DTC'
	AND inventory_type = 'non-DSS'
	GROUP BY 1,2

	UNION ALL

	SELECT
      order_date
	, 'Private Client' AS sales_channel
	, SUM(gtv_total) AS gtv_total
	, SUM(gtv_qty) AS gtv_qty
	, SUM(gmv_total) AS gmv_total
	, SUM(gmv_qty) AS gmv_qty
	, SUM(gtv_less_cancelled) AS gtv_less_cancelled
	, SUM(promos_total) AS promos_total
	, SUM(transactions) AS transactions
	, SUM(sg_sla_pass) AS sg_sla_pass
	, SUM(ff_sla_pass) AS ff_sla_pass
	, SUM(shipped_order_line_count) AS shipped_order_line_count
	, AVG(CAST(avg_adj_sos_hours as NUMERIC)) AS avg_adj_sos_hours
	FROM all_agg
	WHERE private_customer_type = 'PC'
	GROUP BY 1,2

	UNION ALL

	SELECT
      order_date
	, 'Total' AS sales_channel
	, SUM(gtv_total) AS gtv_total
	, SUM(gtv_qty) AS gtv_qty
	, SUM(gmv_total) AS gmv_total
	, SUM(gmv_qty) AS gmv_qty
	, SUM(gtv_less_cancelled) AS gtv_less_cancelled
	, SUM(promos_total) AS promos_total
	, SUM(transactions) AS transactions
	, SUM(sg_sla_pass) AS sg_sla_pass
	, SUM(ff_sla_pass) AS ff_sla_pass
	, SUM(shipped_order_line_count) AS shipped_order_line_count
	, AVG(CAST(avg_adj_sos_hours as NUMERIC)) AS avg_adj_sos_hours
	FROM all_agg
	GROUP BY 1,2

)

SELECT *
FROM unioned
ORDER BY 1,2