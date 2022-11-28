CREATE TABLE salesman(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40)
);

CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40)

);

CREATE TABLE cars(
    car_dealership_id SERIAL PRIMARY KEY,
    price VARCHAR(20),
    make_model VARCHAR(50)
);

CREATE TABLE mechanics(
    mechanics_id SERIAL PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40)
);

CREATE TABLE customer_cars(
    car_customer_id SERIAL PRIMARY KEY,
    make_model VARCHAR(50),
    customer_id INTEGER,
    car_dealership_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (car_dealership_id) REFERENCES cars(car_dealership_id)
);

CREATE TABLE invoice(
    invoice_id SERIAL PRIMARY KEY,
    date_of_sale TIMESTAMP,
    employee_id INTEGER,
    customer_id INTEGER,
    car_dealership_id INTEGER,
    FOREIGN KEY (employee_id) REFERENCES salesman(employee_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (car_dealership_id) REFERENCES cars(car_dealership_id)


);

CREATE TABLE service_ticket(
    service_ticket_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    car_customer_id INTEGER,
    mechanics_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (car_customer_id) REFERENCES customer_cars(car_customer_id),
    FOREIGN KEY (mechanics_id) REFERENCES mechanics(mechanics_id)

);