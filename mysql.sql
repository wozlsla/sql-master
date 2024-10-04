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
)



