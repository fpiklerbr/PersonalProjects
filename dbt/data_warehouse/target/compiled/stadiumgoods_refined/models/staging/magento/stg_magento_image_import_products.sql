

SELECT
    mfg_sku, min(CASE WHEN import_status = 'Imported' THEN created_at END) AS image_import_imported_at
  , sum(CASE WHEN import_status = 'Imported' THEN image_count END) AS image_import_imported_image_count
  , sum(CASE WHEN import_status = 'Imported' THEN error_count END) AS image_import_imported_error_count, min(CASE WHEN import_status = 'Failed - Missing' THEN created_at END) AS image_import_failed_missing_at
  , sum(CASE WHEN import_status = 'Failed - Missing' THEN image_count END) AS image_import_failed_missing_image_count
  , sum(CASE WHEN import_status = 'Failed - Missing' THEN error_count END) AS image_import_failed_missing_error_count, min(CASE WHEN import_status = 'Reimported' THEN created_at END) AS image_import_reimported_at
  , sum(CASE WHEN import_status = 'Reimported' THEN image_count END) AS image_import_reimported_image_count
  , sum(CASE WHEN import_status = 'Reimported' THEN error_count END) AS image_import_reimported_error_count, min(CASE WHEN import_status = 'Failed - Multiple' THEN created_at END) AS image_import_failed_multiple_at
  , sum(CASE WHEN import_status = 'Failed - Multiple' THEN image_count END) AS image_import_failed_multiple_image_count
  , sum(CASE WHEN import_status = 'Failed - Multiple' THEN error_count END) AS image_import_failed_multiple_error_count, min(CASE WHEN import_status = 'Imported - Incomplete' THEN created_at END) AS image_import_imported_incomplete_at
  , sum(CASE WHEN import_status = 'Imported - Incomplete' THEN image_count END) AS image_import_imported_incomplete_image_count
  , sum(CASE WHEN import_status = 'Imported - Incomplete' THEN error_count END) AS image_import_imported_incomplete_error_count
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sumoheavy_imageimportdetail`
GROUP BY 1