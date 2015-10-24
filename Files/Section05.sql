-- 34 String functions
-- database: world

SELECT Name, LocalName, LENGTH(LocalName) AS len FROM Country WHERE Continent = 'Europe' ORDER BY len DESC;

SELECT Name, LocalName, LENGTH(LocalName) AS len, CHAR_LENGTH(LocalName) as chars
    FROM Country WHERE Continent = 'Europe' ORDER BY len DESC;

SELECT Name, LEFT(Name, 3), RIGHT(Name, 3), MID(Name, 2, 3) FROM Country WHERE Continent = 'Europe';

SELECT CONCAT(Name, LocalName ) FROM Country WHERE Continent = 'Europe';
SELECT CONCAT_WS(', ', Name, LocalName, Region, Continent ) FROM Country WHERE Continent = 'Europe';

SELECT LOCATE('bar', 'foobarbaz');
SELECT Name, LOCATE('stan', Name) FROM Country WHERE Name LIKE '%stan%';
SELECT Name, LOCATE('k', Name) FROM Country WHERE Name LIKE '%k%';

SELECT Name, UPPER(Name), LocalName, UPPER(LocalName) FROM Country WHERE Continent = 'Europe';
SELECT Name, LOWER(Name), LocalName, LOWER(LocalName) FROM Country WHERE Continent = 'Europe';

SELECT Name, REVERSE(Name), LocalName, REVERSE(LocalName) FROM Country WHERE Continent = 'Europe';

-- 35 Numeric functions and operators
-- database: world

SELECT 7 + 3;
SELECT 7 - 3;
SELECT 7 * 3;
SELECT 7 / 3;
SELECT 7 DIV 3;
SELECT 7 MOD 3;
SELECT 7 % 3;

SELECT POWER(7, 3), 7 * 7 * 7;

SELECT ABS(7);
SELECT ABS(-7);
SELECT SIGN(7);
SELECT SIGN(-7);

SELECT CONV(57, 10, 16);
SELECT CONV(39, 16, 10);
SELECT CONV(57, 10, 32);

SELECT PI();
SELECT ROUND(PI());
SELECT ROUND(PI(), 2);
SELECT ROUND(PI(), 3);
SELECT TRUNCATE(PI(), 3);
SELECT CEIL(PI());
SELECT FLOOR(PI());

SELECT Name, RAND() FROM Country LIMIT 5;
SELECT Name, RAND(7) FROM Country LIMIT 5;

-- 36 Date and time functions
-- database: none

SELECT NOW();
SELECT CURRENT_TIMESTAMP();
SELECT UNIX_TIMESTAMP();
SELECT UTC_TIMESTAMP();

SELECT DAYNAME(NOW());
SELECT DAYOFMONTH(NOW());
SELECT DAYOFWEEK(NOW());
SELECT DAYOFYEAR(NOW());
SELECT MONTHNAME(NOW());

SELECT TIME_TO_SEC('00:03:00');
SELECT SEC_TO_TIME(180);

SELECT ADDTIME('1:00:00', '00:29:45');
SELECT SUBTIME('1:30:00', '00:15:00');

SELECT ADDDATE('2008-01-02', INTERVAL 31 DAY);
SELECT SUBDATE('2008-01-02', INTERVAL 31 DAY);

-- 04 Time zone support
-- database: none

SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW();
SET time_zone = 'Europe/London';
SHOW VARIABLES LIKE '%time_zone%';
SELECT NOW();

-- 05 DATE_FORMAT
-- database: none

SELECT DATE_FORMAT(NOW(), '%W, %D of %M, %Y');
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %T');

-- 39 Grouping Functions
-- database: world

SELECT COUNT(*) FROM Country;
SELECT COUNT(Population) FROM Country;
SELECT Continent, COUNT(*) AS Count FROM Country GROUP BY Continent ORDER BY Count DESC;
SELECT COUNT(DISTINCT Continent) FROM Country ;

SELECT GROUP_CONCAT(Name) FROM Country WHERE Region = 'Western Europe';
SELECT GROUP_CONCAT(Name) FROM Country GROUP BY Region;
SELECT GROUP_CONCAT(DISTINCT Continent ORDER BY Continent SEPARATOR '/') FROM Country;

SELECT AVG(Population) FROM Country WHERE Region = 'Western Europe';
SELECT MIN(Population), MAX(Population) FROM Country WHERE Region = 'Western Europe';
SELECT SUM(Population), STD(Population) FROM Country WHERE Region = 'Western Europe';

-- 40 Conditional Function
-- database: scratch

DROP TABLE IF EXISTS booltest;
CREATE TABLE booltest (a INTEGER, b INTEGER);
INSERT INTO booltest VALUES (1, 0);
SELECT * FROM booltest;

SELECT
    CASE WHEN a THEN 'true' ELSE 'false' END as boolA,
    CASE WHEN b THEN 'true' ELSE 'false' END as boolB
    FROM booltest
;

SELECT
  CASE a WHEN 1 THEN 'true' ELSE 'false' END AS boolA,
  CASE b WHEN 1 THEN 'true' ELSE 'false' END AS boolB 
  FROM booltest
;

DROP TABLE IF EXISTS booltest;
