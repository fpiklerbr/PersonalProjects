


WITH all_tenants AS (
  SELECT
    fps_tenant_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_tenants`
  UNION DISTINCT
  SELECT
    fps_tenant_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_fps_tenants`
  UNION DISTINCT
  SELECT
    fps_tenant_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order`
  UNION DISTINCT
  SELECT
    fps_tenant_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_headers`
  UNION DISTINCT
  SELECT
    fps_tenant_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_v2_order` AS financial_v2_order
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_current_order_reports` AS current_reports
    ON financial_v2_order.file_name = current_reports.file_name
)

SELECT
    all_tenants.fps_tenant_id
  , coalesce(magento.fps_tenant_name, seed.fps_tenant_name) AS fps_tenant_name
  , coalesce(seed.business_unit, 'Omnichannel') AS business_unit
  , coalesce(seed.sales_channel, 'Farfetch') AS sales_channel
  , coalesce(seed.channel_or_gateway_header, 'Farfetch') AS channel_or_gateway_header
  , coalesce(seed.shipping_is_withheld, TRUE) AS shipping_is_withheld
  , coalesce(seed.is_excluded_from_financial_reporting, FALSE) AS is_excluded_from_financial_reporting
  , magento.`sg_farfetch_tenant_id`,
  magento.`price_channel_id`,
  magento.`created_at`,
  magento.`updated_at`,
  magento.`sg_order_channel`,
  magento.`endpoint_url`,
  magento.`client_id`,
  magento.`client_secret`,
  magento.`username`,
  magento.`password`,
  magento.`grant_type`,
  magento.`_synched_from_source_at`
FROM all_tenants
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_tenants` AS magento
  ON all_tenants.fps_tenant_id = magento.fps_tenant_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_fps_tenants` AS seed
  ON all_tenants.fps_tenant_id = seed.fps_tenant_id