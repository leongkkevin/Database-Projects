CREATE DATABASE parking_db;

CREATE TABLE fan(
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE car (
    license_plate VARCHAR(10) PRIMARY KEY,
    vehicle_type VARCHAR(50),

    fan INT,
    FOREIGN KEY (fan) REFERENCES fan(id)
);

CREATE TABLE event(
    name VARCHAR(50),
    event_date DATE,
    PRIMARY KEY (name, event_date),

    start_time TIME,
    end_time TIME
);

CREATE TABLE stadium (
    name VARCHAR(30) PRIMARY KEY,
    address VARCHAR(50)
);

CREATE TABLE parking_lot (
    name VARCHAR(2) PRIMARY KEY,
    stadium VARCHAR(30),
    FOREIGN KEY (stadium) REFERENCES stadium(name)
);

CREATE TABLE parking_space (
    number INT,
    lot VARCHAR(2),
    car VARCHAR(10),
    available BOOLEAN,
    handicap BOOLEAN,
    FOREIGN KEY (lot) REFERENCES parking_lot(name),
    FOREIGN KEY (car) REFERENCES car(license_plate),
    PRIMARY KEY (number, lot)
);

CREATE TABLE allocation(
    id INT PRIMARY KEY,

    parking_lot VARCHAR(2),
    parking_space INT,

    car VARCHAR(10),
    employee INT,

    event_name VARCHAR(50),
    event_date DATE,

    FOREIGN KEY (parking_lot, parking_space) REFERENCES parking_space(lot, number),

    FOREIGN KEY (event_name, event_date) REFERENCES event(name, event_date)
);

CREATE TABLE parking_employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    stadium VARCHAR(30),
    parking_lot VARCHAR(2),
    FOREIGN KEY (stadium) REFERENCES stadium(name),
    FOREIGN KEY (parking_lot) REFERENCES parking_lot(name)
);

CREATE TABLE event_fan_join(
    event_name VARCHAR(50),
    event_date DATE,
    fan_id INT,

    FOREIGN KEY (event_name, event_date) REFERENCES event(name, event_date),
    FOREIGN KEY (fan_id) REFERENCES fan(id)
);

