CREATE EXTENSION pgcrypto;
CREATE SCHEMA wedapp;
SET search_path TO wedapp;

-- CREATE phone TABLE --
	CREATE TABLE wedapp.phones (
		phone_id SERIAL PRIMARY KEY,
		number VARCHAR(20) NOT NULL,
		international_number VARCHAR(20) NOT NULL,
		national_number VARCHAR(20) NOT NULL,
		country_code VARCHAR(10) NOT NULL,
		dial_code VARCHAR(10) NOT NULL
		);

-- CREATE guests TABLE --
	CREATE TABLE wedapp.guests (
		guest_id SERIAL PRIMARY KEY,
		name VARCHAR(255) NOT NULL,
		surname VARCHAR(255) NOT NULL,
		phone_id INTEGER NOT NULL,
		email VARCHAR(255) NOT NULL,
		attend VARCHAR(255) NOT NULL,
		people_count INTEGER NOT NULL,
		children_count INTEGER NOT NULL,
		arrival VARCHAR(255),
		transportation VARCHAR(255),
		from_location VARCHAR(255),
		transport_share BOOLEAN,
		event VARCHAR(255),
		dietary BOOLEAN,
		dietary_detail TEXT,
		songs TEXT,
		music_styles jsonb NOT NULL,
		brunch BOOLEAN,
		comment TEXT,
		register_date TIMESTAMP,
		CONSTRAINT fk_phone_id FOREIGN KEY(phone_id) REFERENCES wedapp.phones(phone_id)
		);

-- CREATE children TABLE --
	CREATE TABLE children (
		child_id SERIAL PRIMARY KEY,
		guest_id INTEGER NOT NULL,
		name VARCHAR(255) NOT NULL,
		age INTEGER NOT NULL,
		CONSTRAINT fk_guest_id FOREIGN KEY(guest_id) REFERENCES wedapp.guests(guest_id)
		);

		-- CREATE person TABLE --	
	CREATE TABLE persons (
		person_id SERIAL PRIMARY KEY,
		guest_id INTEGER NOT NULL,
		name VARCHAR(255) NOT NULL,
		surname VARCHAR(255) NOT NULL,
		CONSTRAINT fk_guest_id FOREIGN KEY(guest_id) REFERENCES wedapp.guests(guest_id)
		);