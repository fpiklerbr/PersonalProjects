

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_eav_attribute`
  OPTIONS()
  as 

  



















 

SELECT   `attribute_id`,  `frontend_input_renderer`,  `is_global`,  `is_visible`,  `is_searchable`,  `is_filterable`,  `is_comparable`,  `is_visible_on_front`,  `is_html_allowed_on_front`,  `is_used_for_price_rules`,  `is_filterable_in_search`,  `used_in_product_listing`,  `used_for_sort_by`,  `is_configurable`,  `apply_to`,  `is_visible_in_advanced_search`,  `position`,  `is_wysiwyg_enabled`,  `is_used_for_promo_rules`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `attribute_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`frontend_input_renderer` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`frontend_input_renderer` AS string)), '') AS string) END as string)
 AS `frontend_input_renderer`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_global` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_global` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_global`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_visible` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_visible` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_visible`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_searchable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_searchable` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_searchable`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_filterable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_filterable` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_filterable`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_comparable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_comparable` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_comparable`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_visible_on_front` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_visible_on_front` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_visible_on_front`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_html_allowed_on_front` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_html_allowed_on_front` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_html_allowed_on_front`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_used_for_price_rules` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_used_for_price_rules` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_used_for_price_rules`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_filterable_in_search` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_filterable_in_search` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_filterable_in_search`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`used_in_product_listing` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`used_in_product_listing` AS string)), '') AS string) END as float64)
 as int64)
 AS `used_in_product_listing`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`used_for_sort_by` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`used_for_sort_by` AS string)), '') AS string) END as float64)
 as int64)
 AS `used_for_sort_by`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_configurable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_configurable` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_configurable`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`apply_to` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`apply_to` AS string)), '') AS string) END as string)
 AS `apply_to`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_visible_in_advanced_search` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_visible_in_advanced_search` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_visible_in_advanced_search`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`position` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`position` AS string)), '') AS string) END as float64)
 as int64)
 AS `position`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_wysiwyg_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_wysiwyg_enabled` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_wysiwyg_enabled`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_used_for_promo_rules` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_used_for_promo_rules` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_used_for_promo_rules`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_eav_attribute` AS source_table

 ) AS un_ordered

;

