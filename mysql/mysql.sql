CREATE TABLE users (
	user_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	username CHAR(10) NOT NULL UNIQUE, -- 'jimin' : 'jimin      ' 로 저장, max(limit) 255
	email VARCHAR(50) NOT NULL, -- 'abc@gmail.com' 로 저장 - 가변적 길이를 가진 str 저장, max 설정
	gender ENUM('Male', 'Female') NOT NULL, -- 2 options
	interests SET (
		'Technology',
		'Sports',
		'Music',
		'Art',
		'Travel',
		'Food',
		'Fashion',
		'Science'
	) NOT NULL, -- options, multiple values
	bio TEXT NOT NULL,
	profile_pic TINYBLOB,
	age INT UNSIGNED NOT NULL,
	is_admin BOOLEAN DEFAULT FALSE NOT NULL, -- TINYINT(0,1)
	balance FLOAT DEFAULT 0.0 NOT NULL, -- DECIMAL(p,s)
	joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- TIMESTAMP
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
	birth_date DATE NOT NULL,
	bed_time TIME NOT NULL,
	graduation_year YEAR NOT NULL, -- 1901 to 2155
	-- JSON, GEOMETRY, POINT, LINESTRING, POLYGON, MULTIPOINT, MULTILINESTRING, MULTIPOLYGON, & GEOMETRYCOLLECTION
	
	CONSTRAINT chk_age CHECK(age < 100),
	CONSTRAINT uq_email UNIQUE (email)
);


DROP TABLE users;


INSERT INTO users (
	username,
	email,
	gender,
	interests,
	bio,
	age,
	is_admin,
	birth_date,
	bed_time,
	graduation_year
) VALUES (
	'p1',
	'p1@harmony.com',
	'Female',
	'Music,Art',
	'I like kpop',
	29,
	TRUE,
	'1996.03.07', -- 19960307 1996-03-07 1996/03/07
	'23:30', -- 233000 23:30:00 23 
	'2024'
);



-- drop column
ALTER TABLE users DROP COLUMN profile_pic;

-- rename column
ALTER TABLE users CHANGE COLUMN bio about_me TEXT;

-- drop constraints
ALTER TABLE users DROP CONSTRAINT uq_email;
ALTER TABLE users
	DROP CONSTRAINT username,
	DROP CONSTRAINT chk_age;

-- adding constraints
ALTER TABLE users
	ADD CONSTRAINT uq_email UNIQUE (email),
	ADD CONSTRAINT uq_username UNIQUE (username);

ALTER TABLE users ADD CONSTRAINT chk_age CHECK (age < 100);

-- add or remove a NULL constraint
ALTER TABLE users MODIFY COLUMN bed_time TIME NULL;
ALTER TABLE users MODIFY COLUMN bed_time TIME NOT NULL;

-- change the column type
ALTER TABLE users MODIFY COLUMN about_me TINYTEXT;

-- rename database
ALTER TABLE users RENAME TO customers;


SHOW CREATE TABLE users;

CREATE TABLE `users` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` char(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `interests` set('Technology','Sports','Music','Art','Travel','Food','Fashion','Science') NOT NULL,
  `about_me` tinytext,
  `age` int unsigned NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `balance` float NOT NULL DEFAULT '0',
  `joined_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `birth_date` date NOT NULL,
  `bed_time` time NOT NULL,
  `graduation_year` year NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uq_email` (`email`),
  UNIQUE KEY `uq_username` (`username`),
  CONSTRAINT `chk_age` CHECK ((`age` < 100))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci




/* CASE : Conflict */
ALTER TABLE users MODIFY COLUMN graduation_year DATE; -- error

-- 1.
ALTER TABLE users ADD COLUMN graduation_date DATE;
UPDATE users SET graduation_date = MAKEDATE(graduation_year, 1);
ALTER TABLE users DROP COLUMN graduation_year;
ALTER TABLE users MODIFY COLUMN graduation_date DATE NOT NULL;

-- 2.
ALTER TABLE users ADD COLUMN graduation_date DATE NOT NULL DEFAULT MAKEDATE(graduation_year, 1);