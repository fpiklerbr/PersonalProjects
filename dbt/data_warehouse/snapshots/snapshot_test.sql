{% snapshot test %}

{{
    config(
      target_schema='snapshots',
      unique_key='State',
      strategy='check',
      check_cols=['Status'],
    )
}}

select * from {{ ref('DBT_Data_with_Status_and_Date') }}

{% endsnapshot %}