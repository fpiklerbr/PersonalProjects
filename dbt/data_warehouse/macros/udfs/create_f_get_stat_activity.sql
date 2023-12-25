{%- macro create_f_get_stat_activity() -%}

SET ROLE root
;

CREATE OR REPLACE FUNCTION {{ target.schema }}.f_get_stat_activity()
	RETURNS SETOF pg_stat_activity AS
		$$ SELECT * FROM pg_catalog.pg_stat_activity; $$
	LANGUAGE sql
	VOLATILE
	SECURITY DEFINER
;

RESET ROLE
;

{%- endmacro -%}
