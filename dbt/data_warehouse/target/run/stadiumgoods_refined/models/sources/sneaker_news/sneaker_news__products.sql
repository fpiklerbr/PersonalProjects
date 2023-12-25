

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sneaker_news__products`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_type` AS string)), '') AS string) END as string)
 AS `product_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_nickname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_nickname` AS string)), '') AS string) END as string)
 AS `product_nickname`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as numeric)
 AS `price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`color_text` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`color_text` AS string)), '') AS string) END as string)
 AS `color_text`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`style_id` AS string)), '') AS string), 
  '-'
, 
  ' '
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`style_id` AS string)), '') AS string), 
  '-'
, 
  ' '
) END as string)
 AS `mfg_sku`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)
 AS `status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_modified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_modified` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `product_modified`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`genders` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`genders` AS string)), '') AS string) END as string)
 AS `genders`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`collaborators` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`collaborators` AS string)), '') AS string) END as string)
 AS `collaborators`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`model` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`model` AS string)), '') AS string) END as string)
 AS `model`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand_name` AS string)), '') AS string) END as string)
 AS `brand_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_name` AS string)), '') AS string) END as string)
 AS `product_name`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`release_date` AS string)), '') AS string), 
  '-00'
, 
  '-01'
) IN ('0000-00-00','0000-01-01','nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`release_date` AS string)), '') AS string), 
  '-00'
, 
  '-01'
) END as timestamp)
 as date)
 AS `release_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_thumbnail` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_thumbnail` AS string)), '') AS string) END as string)
 AS `product_thumbnail`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`product_images` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`product_images` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `product_images`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sneaker_news_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region` AS string)), '') AS string) END as string)
 AS `region`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stockist_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stockist_data` AS string)), '') AS string) END as string)
 AS `stockist_data`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_regions_releases` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_regions_releases` AS string)), '') AS string) END as string)
 AS `product_regions_releases`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_regions_rereleases` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_regions_rereleases` AS string)), '') AS string) END as string)
 AS `product_regions_rereleases`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
FROM `ff-stadiumgoods-raw-live`.`imports`.`sneaker_news_products`

WHERE 1=1
                 ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(replace(mfg_sku, ' ','') as string)
 AS `dy_sku`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `product_type` AS `product_type`
  , `product_nickname` AS `product_nickname`
  , `price` AS `price`
  , `color_text` AS `color_text`
  , `mfg_sku` AS `mfg_sku`
  , `dy_sku` AS `dy_sku`
  , `status` AS `status`
  , `product_modified` AS `product_modified`
  , `genders` AS `genders`
  , `collaborators` AS `collaborators`
  , `model` AS `model`
  , `brand_name` AS `brand_name`
  , `product_name` AS `product_name`
  , `release_date` AS `release_date`
  , `product_thumbnail` AS `product_thumbnail`
  , `product_images` AS `product_images`
  , `sneaker_news_product_id` AS `sneaker_news_product_id`
  , `region` AS `region`
  , `stockist_data` AS `stockist_data`
  , `product_regions_releases` AS `product_regions_releases`
  , `product_regions_rereleases` AS `product_regions_rereleases`
  , `file_time` AS `file_time`
  , `file_name` AS `file_name`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final ;

