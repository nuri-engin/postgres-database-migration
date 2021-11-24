
-- What is the result?
SELECT MAX(id) FROM <table_name>;

-- Then run...
-- This should be higher than the last result.
SELECT nextval('<table_id_seq>');

-- If it's not higher... run this set the sequence last to your highest id. 
-- (wise to run a quick pg_dump first...)

BEGIN;
-- protect against concurrent inserts while you update the counter
LOCK TABLE <table_name> IN EXCLUSIVE MODE;
-- Update the sequence
SELECT setval('table_id_seq', COALESCE((SELECT MAX(id)+1 FROM your_table), 1), false);
COMMIT;