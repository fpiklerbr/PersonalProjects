{% docs generate_base_model_from_source_table_description %}

This macro produces a cleaned, typed, aliased, anonymized, and otherwise processed base model from a raw source table by consuming and applying the relevant dbt documentation.

These docs are stored in **models/staging/{source_name}/{source_name}.yml** files, within the **columns** node for the relevant source table. 

For all columns in a source table, docs should include at least these properties:
- **name**: The raw column name in the source table. This may be different between BQ and PG, which can be handled in the docs via jinja
- **type**: The resulting column type in the base model. Defaults to `text` if not specified. (This property can also be named **data_type** -- either is fine for the macro, but only **type** is displayed on the dbt docs site so it is preferred.)
- **meta.alias**: The resulting column name in the base model. Defaults to **name** if not specified.

The macro generates a **column expression** to clean and process the source data. By default, this:
- trims leading and trailing whitespace
- interprets string literals in the **default_nulls** list (`nan`, `None`, `NaT`, and an empty string) as `NULL`

By default, some **type** values get special handling to avoid errors in BQ:
- **boolean_type** fields (`int`, `bigint`, `smallint`, `integer`) are interpreted as `TRUE` or `FALSE` according to whether they match these lists of string literals: 
  - **default_trues**: `T`, `TRUE`, `1`, `1.0`
  - **default_falses**: `F`, `FALSE`, `0`, `0.0`
- **integer_type** fields (`int`, `bigint`, `smallint`, `integer`) are cast first to floats, and then to integers
- `date` fields are cast first to timestamps, and then to dates

Further column-specific processing is possible through optional properties documented under the column's **meta** property:
- For fields of any type:
  - **meta.null_values**: list of string literals to treat as `NULL`, extending **default_nulls**
  - **meta.allowed_values**: list of string literals to preserve, overriding both **default_nulls** and **null_values**
  - **meta.pii_level**: a value corresponding to [Farfetch's Customer Personal Data levels](https://farfetch.atlassian.net/wiki/spaces/DATA/pages/48423498/Customer+Personal+Data). If > 0, source values are anonymized by hashing 
  - **meta.fill_nulls**: a default value, cast as **type** and used when source value after all other processing is `NULL`
  - **meta.trim_substring**: a string concatenating non-whitespace characters to be trimmed. N.B.
    - Whitespace will still be trimmed
    - Backslashes will be interpreted as initiating escape sequences in the SQL layer
    - Those escaping backslashes need to be escaped themselves compilation in the Jinja layer
  - **meta.replace_substring**: a dictionary of arguments to be passed to the SQL replace() function 
    - **from**: the substring to be replaced
    - **to**: the substring to replace it with
    - N.B. handling of escape sequences and backslashes is the same as in **meta.trim_substring** above
- For **boolean_type** fields:
  - **meta.true_values**: list of string literals to interpret as `TRUE`, overriding **default_trues**
  - **meta.false_values**: list of string literals to interpret as `FALSE`, overriding **default_falses**
- For `date`, `timestamp`, and `timestamptz` fields:
  - **meta.format_string**: a [strftime-valid](http://strftime.org) format string, used to parse non-standard datetime formats
- For `timestamptz` fields:
  - **meta.local_timezone**: the name of a canonical [IANA time zone](https://www.iana.org/time-zones), used to localize timestamp-naive source timestamps into a timezone-aware timestamps

Docs may not always reflect the latest source schema changes, so the macro returns all columns present in either the docs or the database. 
- Columns that are present in both the docs and the database are represented in the base model like this:
`cast({column_expression} AS {type}) AS {meta.alias}`
- In order to avoid breaking downstream dependencies, columns present in the docs but dropped from the database are represented like this:
`cast(NULL AS {type}) AS {meta.alias}`
- In order to expose new data for analysis while marking it as unprocessed, columns present in the database but not in the docs are represented like this:
`{name} AS _undocumented_{name}`

Two additional properties can be used to add columns not present in the source to the base model by deriving values based on the processed source columns. In these cases:
- **name** is _not_ the name of a column in the source but rather the alias of the derived column
- **type** is the type of the derived column 
- the derivation is specified by either the **meta.sql** or **meta.macro** property

**meta.sql** can be any SQL statement, as long as it's platform-independent (i.e. executable on both BigQuery and Postgres).
It will be applied _after_ the source columns are processed, so should refer to them by **meta.alias** and be confident that they are the appropriate **type**.
There is no need to apply a `cast` within the statement -- this will be done automatically by the macro based on **type**.    

The **meta.macro** property can be used to derive additional columns by passing processed source and/or sql-derived columns through a dbt macro.
It will be applied _after_ any SQL-derived columns are processed, so should refer to processed source columns by **meta.alias** and SQL-derived columns by their **name**, and be confident that all are the appropriate **type**.
This should have a key/value pair nested underneath, where the key is the name of a supported macro and the value is a dictionary of its arguments.
Currently, the supported macros (with their arguments) are:
  - **json_extract_element**:
    - **json_object**: a column with `json` **type**
    - **element_path**: a list of strings representing the path of the element to be extracted
  - **lookup_enumerated_values**:
    - **enumerated_column**: a column containing enumerated values
    - **enumerated_values**: a dictionary that maps the enumeration

N.B. all supported macros also take an **output_type** argument. This is supplied by **type** and does not need to be
specified under **meta.macro**.

Finally, two macro uses table-level properties to limit the size of the result set.
- For base models with `incremental` materializations, the **incremental_filter** argument is applied 
- For non-incremental models, the **base_limit** dbt variable is applied:
  - In production, there is no limit; in other environments, it defaults to 1000; like all dbt variables, this can be overridden on the command line via the `vars` flag
  - If the source table has a `loaded_at_field` property, the model will be sorted on it in descending order before the limit is applied.

{% enddocs %}