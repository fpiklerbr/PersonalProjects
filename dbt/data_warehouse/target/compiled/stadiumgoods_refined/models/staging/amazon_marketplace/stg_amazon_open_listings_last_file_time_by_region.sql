

SELECT
    region
  , max(file_time) AS file_time
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__open_listings_data_sp`

WHERE file_time >= (SELECT max(file_time) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_open_listings_last_file_time_by_region`)

GROUP BY 1