
      

  create or replace table `ff-stadiumgoods-raw-live`.`snapshots`.`stg_amazon_marketplace_transactions_snapshot`
  
  
  OPTIONS()
  as (
    

    select *,
        to_hex(md5(concat(coalesce(cast(transaction_id as string), ''), '|',coalesce(cast(TIMESTAMP("2023-12-18 16:24:50.855536+00:00") as string), '')))) as dbt_scd_id,
        TIMESTAMP("2023-12-18 16:24:50.855536+00:00") as dbt_updated_at,
        TIMESTAMP("2023-12-18 16:24:50.855536+00:00") as dbt_valid_from,
        nullif(TIMESTAMP("2023-12-18 16:24:50.855536+00:00"), TIMESTAMP("2023-12-18 16:24:50.855536+00:00")) as dbt_valid_to
    from (
          





select * from `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_amazon_marketplace_transactions`

    ) sbq


  );
  