BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS breweries;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS events;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    role VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL
    username varchar(50) NOT NULL UNIQUE,
    password_hash varchar(200) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
    city VARCHAR(55) NOT NULL,
    state VARCHAR(2) NOT NULL,
    zip VARCHAR(10) NOT NULL
);


CREATE TABLE breweries (
    brewery_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    image TEXT,
    history TEXT,
	website TEXT,
    hours_days_operation VARCHAR(255),
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users (user_id)
);



CREATE TABLE beers (
    beer_id SERIAL PRIMARY KEY,
	brewery_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    abv DOUBLE PRECISION NOT NULL,
    beer_type VARCHAR(50) NOT NULL,
	FOREIGN KEY (brewery_id) REFERENCES breweries (brewery_id)

);


CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT,
    brewery_id INT NOT NULL,
    beer_id INT,
    text TEXT,
    date DATE NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
	for_beer BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (brewery_id) REFERENCES breweries (brewery_id),
    FOREIGN KEY (beer_id) REFERENCES beers (beer_id)
);

CREATE TABLE events (
	event_id SERIAL PRIMARY KEY,
	brewery_id INT NOT NULL,
	date DATE NOT NULL,
	time_start TIME NOT NULL,
	time_end TIME,
	description TEXT,
	FOREIGN KEY (brewery_id) REFERENCES breweries (brewery_id)
);

COMMIT TRANSACTION;
