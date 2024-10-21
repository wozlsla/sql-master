-- Data Manipulation Language (DML)
-- Two categories: 'Update commands' and 'Query command'

-- INSERT [O]
INSERT INTO movies
	(title, rating, released, overview) 
VALUES
	('The Lord of The Rings', 0.8, 1, 'Rings and hobbits'), 
	('Dune: Part One', 10, 1, 'Sand');


-- UPDATE
UPDATE moview SET rating = rating+8 WHERE title = 'The Lord of The Rings';

UPDATE moview SET director = 'Unknown' WHERE director IS NULL AND rating = 10;


-- DELETE
DELETE FROM movies WHERE movie_id = 2;


-- SELECT
SELECT
	REPLACE(title, ': Part One', 'I') AS title,
	rating * 2 AS double_rating,
	UPPER(overview) AS overview_upp
FROM
	movies;
