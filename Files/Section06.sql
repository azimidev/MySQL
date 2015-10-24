-- 41 Database Transaction
-- database: scratch

CREATE TABLE widgetInventory (
  id SERIAL,
  description VARCHAR(255),
  onhand INTEGER NOT NULL
);

CREATE TABLE widgetSales (
  id SERIAL,
  inv_id INTEGER,
  quan INTEGER,
  price INTEGER
);

INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'rock', 25 );
INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'paper', 25 );
INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'scissors', 25 );

SELECT * FROM widgetInventory;

START TRANSACTION;
INSERT INTO widgetSales ( inv_id, quan, price ) VALUES ( 1, 5, 500 );
UPDATE widgetInventory SET onhand = ( onhand - 5 ) WHERE id = 1;
COMMIT;

SELECT * FROM widgetInventory;
SELECT * FROM widgetSales;

START TRANSACTION;
INSERT INTO widgetInventory ( description, onhand ) VALUES ( 'toy', 25 );
ROLLBACK;
SELECT * FROM widgetInventory;
SELECT * FROM widgetSales;

-- restore database
DROP TABLE IF EXISTS widgetInventory;
DROP TABLE IF EXISTS widgetSales;

-- 42 Transaction and Performance
-- database: scratch

CREATE TABLE test ( id SERIAL, data VARCHAR(256) );

-- copy / paste 1,000 of these ...
INSERT INTO test ( data ) VALUES ( 'This is a line of text.' );

-- count the rows in the table
SELECT COUNT(*) FROM test;

-- put this before the 1,000 INSERT statements
START TRANSACTION;

-- put this after the 1,000 INSERT statements
COMMIT;

-- restore database
DROP TABLE test;

