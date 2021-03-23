CREATE DATABASE bank;
\c bank
CREATE TABLE credits (id serial, name varchar, credit int);
INSERT INTO credits(name, credit) VALUES ('Xavier', 1000), ('Hamza', 1000), ('Jonata', 1000);

BEGIN TRANSACTION;
SAVEPOINT SP1;
UPDATE credits SET credit = credit-500 WHERE id=1;
UPDATE credits SET credit = credit+500 WHERE id=3;
SELECT * FROM credits;

SAVEPOINT SP2;
UPDATE credits SET credit = credit-700 WHERE id=2;
UPDATE credits SET credit = credit+700 WHERE id=1;
SELECT * FROM credits;

SAVEPOINT SP3;
UPDATE credits SET credit = credit-100 WHERE id=2;
UPDATE credits SET credit = credit+100 WHERE id=3;
SELECT * FROM credits;

ROLLBACK TO SP3;
SELECT * FROM credits;

ROLLBACK TO SP2;
SELECT * FROM credits;

ROLLBACK TO SP1;
SELECT * FROM credits;

END TRANSACTION;


