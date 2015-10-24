-- 20 CREATE and USE DATABASE
-- database: none

CREATE DATABASE foo;
USE foo;
CREATE TABLE foo ( a INT, b TEXT );
INSERT INTO foo VALUES ( 1, 'foo' );
SELECT * FROM foo;
DROP TABLE foo;
DROP DATABASE foo;

-- 21 USING TABLES
-- database: scratch

DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id INTEGER,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip CHAR(10)
);
DESCRIBE test;
SHOW TABLE STATUS;
SHOW CREATE TABLE test;

CREATE TABLE test (
    id INTEGER,
    name VARCHAR(255),
    address VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2),
    zip CHAR(10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE test;
DROP TABLE IF EXISTS test;

-- 22 ADDING INDEXES
-- database: scratch

DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id INTEGER,
    a VARCHAR(255),
    b VARCHAR(255)
);
INSERT INTO TEST ( id, a, b ) VALUES ( 1, 'one', 'two' );
INSERT INTO TEST ( id, a, b ) VALUES ( 2, 'two', 'three' );
INSERT INTO TEST ( id, a, b ) VALUES ( 3, 'three', 'four' );
SELECT * FROM test;
DESCRIBE test;
SHOW INDEXES FROM test;

DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id INTEGER,
    a VARCHAR(255),
    b VARCHAR(255),
    INDEX ab (a, b)
    INDEX(a),
    INDEX(b)
);

DROP INDEX a ON test;
DROP INDEX ab ON test;
DROP TABLE IF EXISTS test;

-- 23 CONSTRAINTS
-- database: scratch

DROP TABLE IF EXISTS test;
CREATE TABLE test (
    a INTEGER,
    b VARCHAR(255)
);
INSERT INTO TEST ( b ) VALUES ( 'one' );
DESCRIBE test;
SELECT * FROM test;

CREATE TABLE test (
    a INTEGER NOT NULL,
    b VARCHAR(255)
);

CREATE TABLE test (
    a INTEGER NOT NULL DEFAULT 50,
    b VARCHAR(255) UNIQUE
);

INSERT INTO TEST ( b ) VALUES ( NULL );
SHOW INDEX FROM test;

DROP TABLE IF EXISTS test;

-- 24 AUTO_INCREMENT, PRIMARY KEY, SERIAL
-- database: scratch

DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id INTEGER,
    a VARCHAR(255),
    b VARCHAR(255)
);
INSERT INTO TEST ( id, a, b ) VALUES ( 1, 'one', 'two' );
INSERT INTO TEST ( id, a, b ) VALUES ( 2, 'two', 'three' );
INSERT INTO TEST ( id, a, b ) VALUES ( 3, 'three', 'four' );
SELECT * FROM test;
DESCRIBE test;
SHOW TABLE STATUS like 'test';
SHOW CREATE TABLE test;
SHOW INDEXES FROM test;

DROP TABLE IF EXISTS test;
CREATE TABLE test (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,  -- SERIAL
    a VARCHAR(255),
    b VARCHAR(255)
);
INSERT INTO TEST ( a, b ) VALUES ( 'one', 'two' );
INSERT INTO TEST ( a, b ) VALUES ( 'two', 'three' );
INSERT INTO TEST ( a, b ) VALUES ( 'three', 'four' );
SELECT * FROM test;
DESCRIBE test;
SHOW TABLE STATUS like 'test';
SHOW CREATE TABLE test;
SHOW INDEXES FROM test;

SELECT LAST_INSERT_ID();

DROP TABLE IF EXISTS test;

-- 25 FOREIGN KEY
-- database: scratch

DROP TABLE IF EXISTS lend;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS book;

CREATE TABLE client (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO client ( name ) VALUES ( 'Amir' );
INSERT INTO client ( name ) VALUES ( 'Babak' );
INSERT INTO client ( name ) VALUES ( 'Maziar' );
SELECT * FROM client;

CREATE TABLE book (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title TEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO book ( title ) VALUES ( 'Harry Potter' );
INSERT INTO book ( title ) VALUES ( 'Twilight' );
INSERT INTO book ( title ) VALUES ( 'A Game of Thrones' );
SELECT * FROM book;

CREATE TABLE lend (
  id INT AUTO_INCREMENT PRIMARY KEY,
  stamp TIMESTAMP, 
  c_id INT,
  b_id INT
);

INSERT INTO lend ( c_id, b_id ) VALUES ( 1, 1 );
INSERT INTO lend ( c_id, b_id ) VALUES ( 1, 2 );
INSERT INTO lend ( c_id, b_id ) VALUES ( 3, 3 );
INSERT INTO lend ( c_id, b_id ) VALUES ( 2, 5 );
SELECT * FROM lend;

SELECT l.id, l.stamp, c.name, b.title
  FROM lend AS l
  LEFT JOIN client AS c ON l.c_id = c.id
  LEFT JOIN book AS b ON l.b_id = b.id
;

-- lend table with FOREIGN KEY constraint

CREATE TABLE lend (
  id INT AUTO_INCREMENT PRIMARY KEY,
  stamp TIMESTAMP, 
  c_id INT,
  b_id INT,
  FOREIGN KEY (c_id) REFERENCES client(id),
  FOREIGN KEY (b_id) REFERENCES book(id)
);

-- drop tables

DROP TABLE IF EXISTS lend;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS book;


-- 26 ALTER TABLE
-- database: scratch

CREATE TABLE test ( a VARCHAR(10), b VARCHAR(10), c VARCHAR(10) );
INSERT INTO test VALUES ( 'one', 'two', 'three');
INSERT INTO test VALUES ( 'two', 'three', 'four');
INSERT INTO test VALUES ( 'three', 'four', 'five');
SELECT * FROM test;

ALTER TABLE test ADD d INT;
ALTER TABLE test DROP d;
ALTER TABLE test DROP b;
ALTER TABLE test ADD bb VARCHAR(10) AFTER a;
ALTER TABLE test ADD aa INT FIRST;
ALTER TABLE test ADD d VARCHAR(10) DEFAULT 'panda';
ALTER TABLE test ADD id SERIAL FIRST;
SHOW CREATE TABLE test;

DROP TABLE test;
