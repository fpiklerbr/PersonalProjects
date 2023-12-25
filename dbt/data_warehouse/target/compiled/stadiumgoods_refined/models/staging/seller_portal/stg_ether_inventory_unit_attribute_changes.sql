WITH unnested_attribute_changes AS (

  SELECT
      ether_wms_inventory_unit_version_id
    , extracted_attribute_changes AS attribute_change
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_unit_versions`
  , unnest(regexp_extract_all(attribute_changes, r'.*?:\n- .*?\n- .*?(?:\n|$)')) AS extracted_attribute_changes
  WHERE ether_wms_inventory_unit_id IS NOT NULL
    AND ether_wms_inventory_unit_version_id > (SELECT max(ether_wms_inventory_unit_version_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_attribute_changes`)

), old_and_new_values AS (

  SELECT
      *
    , 
  CAST(regexp_extract(attribute_change, 
  '(.*?):\n- .*?\n- .*?'
) AS string)
 AS attribute_name
    , 
  CAST(regexp_extract(attribute_change, 
  '.*?:\n- (.*?)\n- .*?'
) AS string)
 AS old_value
    , 
  CAST(regexp_extract(attribute_change, 
  '.*?:\n- .*?\n- (.*?)(?:\n|$)'
) AS string)
 AS new_value
  FROM unnested_attribute_changes

), final AS (

  SELECT
      inventory_unit_versions.*
    , 
  CAST(regexp_replace(attribute_name, r'^---\n', '') AS string)


 AS attribute_name
    , nullif(old_and_new_values.old_value, '') AS old_value
    , nullif(old_and_new_values.new_value, '') AS new_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_unit_versions` AS inventory_unit_versions
  INNER JOIN old_and_new_values
    ON inventory_unit_versions.ether_wms_inventory_unit_version_id = old_and_new_values.ether_wms_inventory_unit_version_id

)

SELECT * FROM final