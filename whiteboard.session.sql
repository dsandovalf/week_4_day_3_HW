-- Create Two Tables:
    -- customer table
        -- customer_id <-- PK
        -- first_name : string's length of 100
        -- last_name  : string's length of 100
        -- email : string's length of 200
        -- address  : string's length of 150
        -- city  : string's length of 150
        -- customer_state  : string's length of 100
        -- zip code  : string's length of 50

    -- order table
        -- order_id <-- PK
        -- order_date : if nothing is inserted use the current date
        -- amount : number with 2 decimal places
        -- customer_id <-- FK


CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
    email VARCHAR(200),
    address VARCHAR(150),
    city VARCHAR(150),
    customer_state VARCHAR(100),
    zip_code VARCHAR(50)
);

CREATE TABLE "order"(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	amount NUMERIC(3,2),
    customer_id INTEGER NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE
);