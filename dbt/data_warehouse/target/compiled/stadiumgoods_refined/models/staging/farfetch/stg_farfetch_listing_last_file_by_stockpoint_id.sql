

  SELECT
    fps_stock_point_id
  , max(file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_listings` AS listings
  
  WHERE listings.file_time > (SELECT max(file_time) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_listing_last_file_by_stockpoint_id`)
  
  GROUP BY 1