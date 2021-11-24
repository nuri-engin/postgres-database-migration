/*
	'get_column_type' FUNCTION: Find the expected column data type quickly.

	Sample query;
	```
		> 	SELECT * FROM get_column_type('city', 'city_id');
		<	column_name |	column_type
			----+-------------
			city_id 	| 	integer
			(1 row)
	```
*/

CREATE OR REPLACE FUNCTION get_column_type(table_n character varying, column_n character varying) 
    RETURNS TABLE( column_name character varying, column_type character varying) as
$BODY$   
    SELECT column_n, data_type 
	FROM information_schema.columns 
	WHERE 
		table_name = table_n AND 
		column_name = column_n;	
$BODY$
      LANGUAGE sql;