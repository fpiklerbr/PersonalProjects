
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_attribute_changes` as DBT_INTERNAL_DEST
        using (
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
         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`ether_wms_inventory_unit_version_id`, `object_type`, `object_id`, `ether_wms_inventory_unit_id`, `ether_wms_allocation_id`, `ether_wms_pick_item_id`, `action_type`, `whodunnit`, `actor_type`, `actor_id`, `user_id`, `employee_id`, `previous_attributes`, `attribute_changes`, `created_at`, `_synched_from_source_at`, `attribute_name`, `old_value`, `new_value`)
    values
        (`ether_wms_inventory_unit_version_id`, `object_type`, `object_id`, `ether_wms_inventory_unit_id`, `ether_wms_allocation_id`, `ether_wms_pick_item_id`, `action_type`, `whodunnit`, `actor_type`, `actor_id`, `user_id`, `employee_id`, `previous_attributes`, `attribute_changes`, `created_at`, `_synched_from_source_at`, `attribute_name`, `old_value`, `new_value`)


  