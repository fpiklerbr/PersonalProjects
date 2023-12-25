

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_flow_mag_order_id`
  
  
  OPTIONS()
  as (
    /*deduplicate the transaction_id
  i.e. 'ord-fb0ffddb32284a6fbf3135f070b58e78' -- '300123574'
         'ord-fb0ffddb32284a6fbf3135f070b58e78' -- NULL  */




WITH sales_flat_order AS (

    SELECT
        sales_flat_order_id
	  , mag_order_id
	  , external_order_id AS transaction_id
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order`
	WHERE channel IN ('flow', 'flow_china')
      AND external_order_id IS NOT NULL

), mag_order AS (

    SELECT
        mag_order_id
	  , transaction_id
	FROM sales_flat_order
	UNION ALL
	SELECT
	    sfo.mag_order_id
	  , scio.channel_order_id AS transaction_id
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__imported_order` AS scio
	LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo
      ON sfo.sales_flat_order_id = scio.sales_flat_order_id
	WHERE scio.channel IN ('flow', 'flow_china')
	  AND NOT EXISTS (
        SELECT *
        FROM sales_flat_order
        WHERE sales_flat_order_id = scio.sales_flat_order_id
      )

)

SELECT *
FROM mag_order
WHERE mag_order_id IS NOT NULL
  );
    