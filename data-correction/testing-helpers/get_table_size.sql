/*
	'get_table_size' FUNCTION: Find the count of records on a specific table.

	Sample query;
	```
		> 	SELECT * FROM get_table_size('city');
		<	table_name	| 	size
			----+-------------
			city 		|	274
			(1 row)
	```
*/

CREATE OR REPLACE FUNCTION get_table_size(table_n character varying) 
    RETURNS TABLE( table_name character varying, size bigint) as
$BODY$   
    SELECT relname, n_tup_ins - n_tup_del as rowcount 
	FROM pg_stat_all_tables 
	WHERE schemaname = 'public' AND relname = table_n;	
$BODY$
      LANGUAGE sql;

