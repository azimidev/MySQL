-- 28 Numerics
-- database: scratch

DESCRIBE numerics;
SELECT * FROM numerics;
SELECT da + db, fa + fb FROM numerics;
SELECT da + db = .3 FROM numerics;
SELECT fa + fb = .3 FROM numerics;
SELECT fa + fb FROM numerics;

-- 30 Date and Time
-- database: scratch

DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id SERIAL,
  stamp TIMESTAMP,
  note VARCHAR(255)
);
INSERT INTO test ( note ) VALUES ( 'Avicenna' );
INSERT INTO test ( note ) VALUES ( 'Saadi Shirazi' );
INSERT INTO test ( note ) VALUES ( 'Ferdowsi' );
DESCRIBE test;
SHOW CREATE TABLE test;
SELECT * FROM test;

UPDATE test SET note = 'Hafez' WHERE id = 2;
SELECT * FROM test;

DROP TABLE IF EXISTS test;

SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW();

SET time_zone = 'UK/London';
SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW();

-- 31 BIT
-- database: scratch

DROP TABLE IF EXISTS test;
CREATE TABLE test ( id SERIAL, a BIT(3), b BIT(5) );
INSERT INTO test ( a, b ) VALUES ( 5, 29 );
INSERT INTO test ( a, b ) VALUES ( 6, 30 );
INSERT INTO test ( a, b ) VALUES ( 7, 31 );
INSERT INTO test ( a, b ) VALUES ( 8, 32 );
INSERT INTO test ( a, b ) VALUES ( 9, 33 );
INSERT INTO test ( a, b ) VALUES ( 199, 199 );
SELECT * FROM test;

DROP TABLE IF EXISTS test;

-- 32 BOOLEAN
-- database: scratch

DROP TABLE IF EXISTS test;
CREATE TABLE test ( a BOOLEAN, b BOOLEAN );
INSERT INTO test VALUES ( TRUE, FALSE );
SELECT * FROM test;
DESCRIBE test;
SHOW CREATE TABLE test;

SELECT a AND b FROM test;
SELECT a OR b FROM test;

DROP TABLE IF EXISTS test;

-- 33 ENUM and SET
-- database: scratch

-- ENUM

DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id SERIAL,
  a ENUM( 'Pablo', 'Henri', 'Jackson' )
);
INSERT INTO test ( a ) VALUES ( 'Pablo' );
INSERT INTO test ( a ) VALUES ( 'Henri' );
INSERT INTO test ( a ) VALUES ( 'Jackson' );
INSERT INTO test ( a ) VALUES ( 1 );
INSERT INTO test ( a ) VALUES ( 2 );
INSERT INTO test ( a ) VALUES ( 3 );

SELECT * FROM test;

-- SET

DROP TABLE IF EXISTS test;
CREATE TABLE test (
  id SERIAL,
  a SET( 'Pablo', 'Henri', 'Jackson' )
);
INSERT INTO test ( a ) VALUES ( 'Pablo' );
INSERT INTO test ( a ) VALUES ( 'Henri' );
INSERT INTO test ( a ) VALUES ( 'Jackson' );
INSERT INTO test ( a ) VALUES ( 'Pablo,Jackson,Henri,Henri,Henri' );
INSERT INTO test ( a ) VALUES ( 1 );
INSERT INTO test ( a ) VALUES ( 2 );
INSERT INTO test ( a ) VALUES ( 3 );
INSERT INTO test ( a ) VALUES ( 4 );
INSERT INTO test ( a ) VALUES ( 5 );
INSERT INTO test ( a ) VALUES ( 6 );
INSERT INTO test ( a ) VALUES ( 7 );
SELECT COUNT(*) FROM test;
SELECT * FROM test;
DESCRIBE test;
SHOW CREATE TABLE test;
