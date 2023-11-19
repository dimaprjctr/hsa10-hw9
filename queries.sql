SET profiling = 1; -- Enable profiling

-- Without index

SELECT COUNT(*) FROM users WHERE date_of_birth > '2023-01-01' AND date_of_birth < '2024-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth > '2022-01-01' AND date_of_birth < '2023-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth > '2021-01-01' AND date_of_birth < '2022-01-01';


SELECT COUNT(*) FROM users WHERE date_of_birth = '2023-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth = '2022-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth = '2021-01-01';

-- BTREE
CREATE INDEX users_date_of_birth ON users(date_of_birth) USING BTREE;
SELECT COUNT(*) FROM users WHERE date_of_birth > '2023-01-01' AND date_of_birth < '2024-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth > '2022-01-01' AND date_of_birth < '2023-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth > '2021-01-01' AND date_of_birth < '2022-01-01';

SELECT COUNT(*) FROM users WHERE date_of_birth = '2023-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth = '2022-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth = '2021-01-01';

DROP INDEX users_date_of_birth ON users;

-- HASH
CREATE INDEX users_date_of_birth ON users(date_of_birth) USING HASH;
SELECT COUNT(*) FROM users WHERE date_of_birth > '2023-01-01' AND date_of_birth < '2024-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth > '2022-01-01' AND date_of_birth < '2023-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth > '2021-01-01' AND date_of_birth < '2022-01-01';

SELECT COUNT(*) FROM users WHERE date_of_birth = '2023-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth = '2022-01-01';
SELECT COUNT(*) FROM users WHERE date_of_birth = '2021-01-01';

DROP INDEX users_date_of_birth ON users;

SHOW PROFILES; -- Show profiling information

SET profiling = 0; -- Disable profiling
