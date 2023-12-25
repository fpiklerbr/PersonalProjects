



    with log_events as
    (
        SELECT serial_log_id
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            -- utc is the hint of convert timestamptz to timestamp, but here still keep timestamptz
            , log_event
            , _synched_from_source_at
        FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_events`
        WHERE NULLIF(LTRIM(RTRIM(serial_number)), '') IS NOT NULL
    ),
    price_changes as 
    (
        SELECT serial_log_id
            , _synched_from_source_at
            , old_price
            , price 
        FROM (
            SELECT serial_log_id
            , COALESCE(p._synched_from_source_at, c._synched_from_source_at) _synched_from_source_at
            , old_price
            , price 
            FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_prices` p 
                FULL OUTER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_status_ids` c 
                using (serial_log_id)
        ) recs
        WHERE COALESCE(old_price, -1) <> COALESCE(price, -1) 
    ),
    ordered_price_changes as 
    (
        SELECT serial_log_id
            , COALESCE(p._synched_from_source_at, e._synched_from_source_at) as _synched_from_source_at
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , old_price
            , price
            , log_event 
            , ROW_NUMBER() OVER (PARTITION BY serial_number order by log_timestamp_utc, serial_log_id) as serial_row_number
        FROM price_changes p 
            LEFT JOIN log_events e using (serial_log_id)
    ),
    resequenced_rows as 
    (
        SELECT serial_log_id
            , _synched_from_source_at
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , old_price
            , price
            , log_event 
            , serial_row_number * 10 as serial_row_number
        FROM ordered_price_changes
    ),
    lookback_rows as 
    (
        SELECT serial_log_id
            , _synched_from_source_at
            , serial_number
            , serial_creation_utc 
            , log_timestamp_utc 
            , old_price 
            , price 
            , case 
                when serial_row_number = 10 then old_price
                else lag(price) OVER (ORDER BY serial_number, serial_row_number) 
            end as prev_price
            , lag(log_timestamp_utc) 
                OVER (ORDER BY serial_number, serial_row_number) as prev_log_timestamp_utc
            , log_event 
            , serial_row_number 
            , case 
                when serial_row_number = 10 then 0 
                else lag(serial_row_number)
                OVER (ORDER BY serial_number, serial_row_number) 
            end as prev_serial_row_number
        FROM resequenced_rows 
    ),
    discontinuous_rows as
    (
        SELECT serial_log_id
            , _synched_from_source_at
            , serial_number
            , serial_creation_utc 
            , log_timestamp_utc 
            , old_price 
            , price 
            , prev_price
            , prev_log_timestamp_utc
            , log_event 
            , serial_row_number 
            , prev_serial_row_number
        FROM lookback_rows 
        where old_price <> prev_price
    ),
    artifical_rows as 
    (
        SELECT NULL as serial_log_id 
            , serial_number
            , serial_creation_utc
            /* to deal with interval /2, use millisecond */
            , SAFE_CAST(TIMESTAMP(SAFE_CAST(

        datetime_add(
            cast( prev_log_timestamp_utc as datetime),
        interval CAST((CAST( 

    datetime_diff(
        cast(log_timestamp_utc as datetime),
        cast(prev_log_timestamp_utc as datetime),
        millisecond
    )

 AS int64)/2) AS int64 ) millisecond
        )

 AS datetime), 'Etc/UTC') AS timestamp) as log_timestamp_utc
            , prev_price as old_price 
            , old_price as price 
            , NULL as log_event
            , (CAST(serial_row_number AS int64)+ CAST(prev_serial_row_number AS int64)) / 2 as serial_row_number
            , CAST('1776-07-04 00:00:00+00' AS timestamp) as _synched_from_source_at
        FROM discontinuous_rows

        UNION ALL 

        SELECT serial_log_id
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , old_price 
            , price 
            , log_event 
            , serial_row_number
            , _synched_from_source_at
        FROM discontinuous_rows
    ),
    expanded_price_changes as
    (
        SELECT NULL as serial_log_id
                , serial_number
                , serial_creation_utc
                , serial_creation_utc AS log_timestamp_utc
                , NULL as old_price
                , old_price as price
                , NULL as log_event 
                , 0 as serial_row_number
                , CAST('1776-07-04 00:00:00+00' AS timestamp) as _synched_from_source_at
        FROM lookback_rows
        WHERE serial_row_number = 10
        AND old_price IS NOT NULL

        UNION DISTINCT

        SELECT serial_log_id
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , COALESCE(old_price
                , lag(price) OVER 
                    (ORDER BY serial_number, serial_row_number)) as old_price
            , price
            , log_event
            , serial_row_number as serial_row_number
            , _synched_from_source_at
        FROM artifical_rows

        UNION DISTINCT

        SELECT serial_log_id
            ,  serial_number
            ,  serial_creation_utc
            , log_timestamp_utc
            , old_price
            , price 
            , log_event
            , serial_row_number
            , _synched_from_source_at
        FROM lookback_rows
    )

    SELECT *
    FROM expanded_price_changes

