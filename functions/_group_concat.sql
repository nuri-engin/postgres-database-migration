/**
    Target Server: PostgreSQL
    Server Version: 10
*/

-- Name: _group_concat(text, text); Type: FUNCTION; Schema: public; Owner: postgres
CREATE FUNCTION public._group_concat(text, text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT CASE
  WHEN $2 IS NULL THEN $1
  WHEN $1 IS NULL THEN $2
  ELSE $1 || ', ' || $2
END
$_$;

ALTER FUNCTION public._group_concat(text, text) OWNER TO postgres;