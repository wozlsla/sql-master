-- Data Definition Language (DDL)
-- DB가 어떤 데이터를 가질지 정의하는 명령에 집중
CREATE TABLE movies (
	title,
	released,
	overview,
	rating,
	director
);


-- Data Types
CREATE TABLE movies (
	title TEXT,
	released INTEGER,
	overview TEXT,
	rating REAL,
	director TEXT,
	for_kids INTEGER -- 0 or 1
	-- poster BLOB -- image (Binary Large Object)
) STRICT;


-- Constraints/CHECK Constraint
-- Primary Key
CREATE TABLE movies (
	movie_id INTEGER PRIMARY KEY AUTOINCREMENT,
	title TEXT UNIQUE NOT NULL,
	released INTEGER NOT NULL CHECK (released > 0),
	overview TEXT NOT NULL CHECK (LENGTH(overview) <= 100),
	rating REAL NOT NULL CHECK (rating BETWEEN 0 AND 10),
	director TEXT,
	for_kids INTEGER NOT NULL DEFAULT 0 CHECK (for_kids = 0 OR for_kids = 1)-- 0 or 1
	-- poster BLOB -- image (Binary Large Object)
) STRICT;


DROP TABLE movies; 


-- Data Manipulation Language (DML)
INSERT INTO movies VALUES 
	('The Gotfather', 1980, 'The best movie', 10, 'F.F.C'),
	('1984', NULL, 'Good', 10, 'dont know');

INSERT INTO movies
	(title, rating, released, overview) 
VALUES
	('The Lord of The Rings', 0.8, 1, 'Rings and hobbits'), 
	('Dune: Part One', 10, 1, 'Sand');