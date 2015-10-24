-- 09 rows
-- database: world

SELECT 'Hello, World';
SELECT 1 + 2;
SELECT * FROM Country;
SELECT * FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy FROM Country ORDER BY Name;
SELECT Name, LifeExpectancy AS 'Life Expectancy' FROM Country ORDER BY Name;
SELECT COUNT(*) FROM Country;
SELECT * FROM Country ORDER BY Name LIMIT 5;
SELECT * FROM Country ORDER BY Name LIMIT 5 OFFSET 5;

-- 10 columns
-- database: world

SELECT * FROM Country ORDER BY Code;
SELECT Name, Code, Region, Population FROM Country ORDER BY Code;
SELECT Name AS Country, Code AS ISO, Region, Population AS Pop FROM Country ORDER BY Code;
SELECT Name AS Country, Code AS ISO, Region, Population / 1000 AS 'Pop (1000s)' FROM Country ORDER BY Code;

-- 11 ORDER BY
-- database: world

SELECT Name FROM Country;
SELECT Name FROM Country ORDER BY Name;
SELECT Name FROM Country ORDER BY Name DESC;
SELECT Name FROM Country ORDER BY Name ASC;
SELECT Name, Continent FROM Country ORDER BY Continent, Name;
SELECT Name, Continent, Region FROM Country ORDER BY Continent DESC, Region, Name;

-- 12 WHERE
-- database: world

SELECT * FROM Country;
SELECT Name, Continent, Population FROM Country WHERE Population < 100000 ORDER BY Population DESC;
SELECT Name, Continent, Population FROM Country WHERE Population < 100000 OR Population IS NULL ORDER BY Population DESC;
SELECT Name, Continent, Population FROM Country WHERE Population < 100000 AND Continent = 'Oceania' ORDER BY Population DESC;

-- 13 LIKE and IN
-- database: world

SELECT Name, Continent, Population FROM Country WHERE Name LIKE '%island%' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name LIKE '%island' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name LIKE 'island%' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name LIKE '_a%' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Continent IN ( 'Europe', 'Asia' );

-- 14 REGEXP
-- database: world

SELECT Name, Continent, Population FROM Country WHERE Name LIKE '_a%' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE
  Name LIKE '_a%' OR
  Name LIKE '_b%' OR
  Name LIKE '_c%' OR
  Name LIKE '_d%' OR 
  Name LIKE '_e%'
  ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP '^.[a-e].*' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP '.*g$' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP 'o.o' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP 'oc+o' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP 'oc*o' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP 'oc?o' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP '^.[aeiou].*' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP '^.[a-e].*' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP '^.[^a-e].*' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name REGEXP '[[:space:]]' ORDER BY Name;
SELECT Name, Continent, Population FROM Country WHERE Name RLIKE '[[:space:]]' ORDER BY Name;

-- 15 INSERT
-- database: scratch

CREATE TABLE test ( a INT, b TEXT, c TEXT );
INSERT INTO test VALUES ( 1, 'This', 'Right here!' ); 
SELECT * FROM test;
INSERT INTO test ( b, c ) VALUES ( 'That', 'Over there!' ); 
INSERT INTO test ( a, b, c ) SELECT id, name, description FROM item;

-- 16 UPDATE
-- database: scratch

SELECT * FROM test;
SELECT * FROM test WHERE a = 2;
UPDATE test SET c = 'Extra funny.' WHERE a = 2;
UPDATE test SET c = 'Even funnier.' WHERE a = 2;
UPDATE test SET c = NULL WHERE a = 2;

-- 17 DELETE
-- database: scratch

SELECT * FROM test;
DELETE FROM test WHERE a = 2;
DELETE FROM test WHERE a = 1;
DELETE FROM test;
DROP TABLE test;

-- 18 literal strings
-- database: [none]

SELECT 'hello, world';
SELECT 'hello' ', ' 'world';
SELECT "hello, world";
SELECT 'hello, "world"';
SELECT 'hello, ''world''';
SELECT 'hello, \'world\'';

-- 19 NULL
-- database: scratch

CREATE TABLE test ( a INT, b TEXT, c TEXT );
INSERT INTO test ( b, c ) VALUES ( 'This', 'That' ); 
SELECT * FROM test;
SELECT * FROM test WHERE a = NULL;
SELECT * FROM test WHERE a IS NULL;
SELECT * FROM test WHERE a IS NOT NULL;
DELETE FROM test;
INSERT INTO test ( a, b, c ) VALUES ( 0, NULL, '' );
SELECT * FROM test;
SELECT * FROM test WHERE b IS NULL;
SELECT * FROM test WHERE b = '';
SELECT * FROM test WHERE c = '';
SELECT * FROM test WHERE c IS NULL;
DROP TABLE test;
