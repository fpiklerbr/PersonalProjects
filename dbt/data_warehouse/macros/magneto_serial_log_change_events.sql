{% macro magento_serial_log_change_events(change_type) %}

    with log_events as
    (
        SELECT serial_log_id
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            -- utc is the hint of convert timestamptz to timestamp, but here still keep timestamptz
            , log_event
            , _synched_from_source_at
        FROM {{ ref('stg_magento_log_events') }}
        WHERE NULLIF(LTRIM(RTRIM(serial_number)), '') IS NOT NULL
    ),
    {{change_type}}_changes as 
    (
        SELECT serial_log_id
            , _synched_from_source_at
            , old_{{change_type}}
            , {{ change_type }} 
        FROM (
            SELECT serial_log_id
            , COALESCE(p._synched_from_source_at, c._synched_from_source_at) _synched_from_source_at
            , old_{{change_type}}
            , {{ change_type }} 
            FROM {{ref('stg_magento_prices')}} p 
                FULL OUTER JOIN {{ref('stg_magento_status_ids')}} c 
                using (serial_log_id)
        ) recs
        WHERE COALESCE(old_{{ change_type }}, -1) <> COALESCE({{ change_type }}, -1) 
    ),
    ordered_{{ change_type }}_changes as 
    (
        SELECT serial_log_id
            , COALESCE(p._synched_from_source_at, e._synched_from_source_at) as _synched_from_source_at
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , old_{{ change_type }}
            , {{ change_type }}
            , log_event 
            , ROW_NUMBER() OVER (PARTITION BY serial_number order by log_timestamp_utc, serial_log_id) as serial_row_number
        FROM {{ change_type }}_changes p 
            LEFT JOIN log_events e using (serial_log_id)
    ),
    resequenced_rows as 
    (
        SELECT serial_log_id
            , _synched_from_source_at
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , old_{{ change_type }}
            , {{ change_type }}
            , log_event 
            , serial_row_number * 10 as serial_row_number
        FROM ordered_{{ change_type }}_changes
    ),
    lookback_rows as 
    (
        SELECT serial_log_id
            , _synched_from_source_at
            , serial_number
            , serial_creation_utc 
            , log_timestamp_utc 
            , old_{{ change_type }} 
            , {{ change_type }} 
            , case 
                when serial_row_number = 10 then old_{{ change_type }}
                else lag({{ change_type }}) OVER (ORDER BY serial_number, serial_row_number) 
            end as prev_{{ change_type }}
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
            , old_{{ change_type }} 
            , {{ change_type }} 
            , prev_{{ change_type }}
            , prev_log_timestamp_utc
            , log_event 
            , serial_row_number 
            , prev_serial_row_number
        FROM lookback_rows 
        where old_{{ change_type }} <> prev_{{ change_type }}
    ),
    artifical_rows as 
    (
        SELECT NULL as serial_log_id 
            , serial_number
            , serial_creation_utc
            /* to deal with interval /2, use millisecond */
            , {{localize_timestamp_to_timestamptz(dbt_utils.dateadd(
               "millisecond"
           , "CAST((CAST( " ~ dbt_utils.datediff("prev_log_timestamp_utc","log_timestamp_utc","millisecond") ~ " AS " ~ data_type('bigint') ~ ")/2) AS " ~ data_type('bigint') ~ " )"
               , "prev_log_timestamp_utc"
               ), "'Etc/UTC'")}} as log_timestamp_utc
            , prev_{{ change_type }} as old_{{ change_type }} 
            , old_{{ change_type }} as {{ change_type }} 
            , NULL as log_event
            , (CAST(serial_row_number AS {{data_type('int')}})+ CAST(prev_serial_row_number AS {{data_type('int')}})) / 2 as serial_row_number
            , CAST('1776-07-04 00:00:00+00' AS {{data_type("timestamptz")}}) as _synched_from_source_at
        FROM discontinuous_rows

        UNION ALL 

        SELECT serial_log_id
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , old_{{ change_type }} 
            , {{ change_type }} 
            , log_event 
            , serial_row_number
            , _synched_from_source_at
        FROM discontinuous_rows
    ),
    expanded_{{ change_type }}_changes as
    (
        SELECT NULL as serial_log_id
                , serial_number
                , serial_creation_utc
                , serial_creation_utc AS log_timestamp_utc
                , NULL as old_{{ change_type }}
                , old_{{ change_type }} as {{ change_type }}
                , NULL as log_event 
                , 0 as serial_row_number
                , CAST('1776-07-04 00:00:00+00' AS {{data_type("timestamptz")}}) as _synched_from_source_at
        FROM lookback_rows
        WHERE serial_row_number = 10
        AND old_{{ change_type }} IS NOT NULL

        UNION DISTINCT

        SELECT serial_log_id
            , serial_number
            , serial_creation_utc
            , log_timestamp_utc
            , COALESCE(old_{{ change_type }}
                , lag({{ change_type }}) OVER 
                    (ORDER BY serial_number, serial_row_number)) as old_{{ change_type }}
            , {{ change_type }}
            , log_event
            , serial_row_number as serial_row_number
            , _synched_from_source_at
        FROM artifical_rows

        UNION DISTINCT

        SELECT serial_log_id
            ,  serial_number
            ,  serial_creation_utc
            , log_timestamp_utc
            , old_{{ change_type }}
            , {{ change_type }} 
            , log_event
            , serial_row_number
            , _synched_from_source_at
        FROM lookback_rows
    )

    SELECT *
    FROM expanded_{{ change_type }}_changes

{% endmacro %}
