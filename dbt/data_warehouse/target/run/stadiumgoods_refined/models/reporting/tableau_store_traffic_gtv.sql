

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_store_traffic_gtv`
  
  
  OPTIONS()
  as (
    

with store_gtv_data as (
  select
    sfl.gtv_paid
  , sfl.gtv_credit_redeemed
  , sfl.gtv_item_discounts 
  , sfl.gtv_total
  , sfl.gmv_qty 
  , sfl.gmv_total
  , case when sfl.sales_channel = 'SG Store' then 'New York'
    when sfl.sales_channel = 'Chicago Store' then 'Chicago'
    end as gtv_store
  , sfl.order_date
  , sfl.stadium_order_id
  , CAST(
    timestamp_trunc(
        cast(sfl.order_creation_nyc as timestamp),
        hour
    )

 AS datetime) as gtv_hour
  from `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
  where sfl.business_unit = 'Store'
  ),
grouped_order_data as (
  select 
    gtv_store
  , gtv_hour
  , count(distinct stadium_order_id ) as unqiue_orders_count
  , sum(gtv_total) as gtv_total
  , sum(gtv_paid) as gtv_paid
  , sum(gtv_credit_redeemed) as gtv_credit_redeemed
  , sum(gmv_qty) as total_qty
  , sum(gmv_total) as gmv_total
  , sum(gtv_item_discounts) as gtv_item_discounts
  from store_gtv_data
  group by 1,2

),
 
 foot_traffic_data as(
  select
    dor.reporting_hour
  , dor.location_date
  , dor.location_hour
  , safe_cast(datetime(safe_cast(dor.reporting_hour AS timestamp), 'America/New_York') AS datetime) as store_hour
  , case when dor.location_name = 'Stadium Goods' then 'New York'
    when dor.location_name = 'Chicago' then 'Chicago'
    end as store_location
  , dor.foot_traffic_count
  from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dor_location_foot_traffic_by_hour` dor
  ),

 all_hours as (
  SELECT  
    store_hour as hour
    , store_location as store
  FROM foot_traffic_data
  UNION DISTINCT
  SELECT 
    gtv_hour as hour
  , gtv_store as store
  FROM grouped_order_data
  )

 select
    all_hours.hour
  , all_hours.store
  , dor.*
  , store_gtv.*
  from all_hours
  left join grouped_order_data store_gtv 
  on all_hours.hour = store_gtv.gtv_hour 
  and all_hours.store = store_gtv.gtv_store
  left join foot_traffic_data dor
  on dor.store_hour = all_hours.hour
  and all_hours.store = dor.store_location
  );
    