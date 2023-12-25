

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_farfetch_size_mapping`
  OPTIONS()
  as SELECT
    pp.configurable_product_id
  , pp.fps_parent_product_id
  , pp.fps_store_sku
  , pp.manufacturer_sku
  , vv.ff_size
  , vv.ff_variant_id
  , vv.sg_size
  , vv.mag_variant_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product` as pp
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product_variant` as vv
  ON pp.sg_farfetch_product_id = vv.sg_farfetch_product_id;

