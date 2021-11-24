/**
    '<TABLE>' table data-correction scripts

    Ensure those functions below are already implemented in the database;
    - '/data-correction/testing-helpers/get_table_size.sql'
    - '/data-correction/testing-helpers/get_column_type.sql'
*/

BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE <table> IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval('table_id_seq', COALESCE((SELECT MAX(id)+1 FROM <table>), 1), false);
COMMIT;

--#1: Get the table size as total records/row counts. 
SELECT * FROM get_table_size('<table>'); -- Expect: Unstable value!

--#2: Get lastest record SEQUENCE
SELECT last_value FROM <table>_<table>_id_seq; -- Expect: Unstable value!

--#3: Compare latest records with original DB and confirm lastest record SEQUENCE 
SELECT * FROM <table> ORDER BY <table>_id DESC LIMIT 5; -- Expect: Observable value.

--#4: Insert a TEST record: Repeat the step #3 to confirm the INSERT process succeed!
-- SCRIPT TO HERE!

--#5: Remove the TEST record: Repeat the step #3 to confirm the REMOVING process succeed!
DELETE FROM <table> 
WHERE <condition>;
	--OR <table>_id=<result-of-nextval('<table>_<table>_id_seq')>;

--#6: Column Types correction.
SELECT * FROM get_column_type('<table>', '<column_name>'); -- Expect: <data_type>
SELECT * FROM get_column_type('<table>', '<column_name>'); -- Expect: <data_type>
SELECT * FROM get_column_type('<table>', '<column_name>'); -- Expect: <data_type>
