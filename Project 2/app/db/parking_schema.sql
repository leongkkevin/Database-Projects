CREATE DATABASE parking_db;

CREATE TABLE fan(
    phone BIGINT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE car (
    license_plate VARCHAR(10) PRIMARY KEY,
    vehicle_type VARCHAR(50),
    fan BIGINT,
    FOREIGN KEY (fan) REFERENCES fan(phone)
);

CREATE TABLE stadium (
    name VARCHAR(30) PRIMARY KEY,
    address VARCHAR(50)
);

CREATE TABLE event(
    name VARCHAR(50),
    event_date DATE,
    PRIMARY KEY (name, event_date),

    start_time TIME,
    end_time TIME,

    stadium VARCHAR(30),
    FOREIGN KEY (stadium) REFERENCES stadium(name)
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
    is_Valet BOOLEAN,
    FOREIGN KEY (lot) REFERENCES parking_lot(name),
    FOREIGN KEY (car) REFERENCES car(license_plate),
    PRIMARY KEY (number, lot)
);

CREATE TABLE parking_employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    parking_lot VARCHAR(2),
    valet_certified BOOLEAN,
    FOREIGN KEY (parking_lot) REFERENCES parking_lot(name)
);

CREATE TABLE allocation(
    id SERIAL PRIMARY KEY,

    parking_lot VARCHAR(2),
    parking_space INT,

    car VARCHAR(10),
    employee BIGINT UNSIGNED,

    event_name VARCHAR(50),
    event_date DATE,

    is_Valet BOOLEAN,
    employee_park BIGINT UNSIGNED,
    employee_return BIGINT UNSIGNED,

    FOREIGN KEY(car) REFERENCES car(license_plate),

    FOREIGN KEY (employee) REFERENCES parking_employee(id),
    FOREIGN KEY (parking_lot, parking_space) REFERENCES parking_space(lot, number),

    FOREIGN KEY (event_name, event_date) REFERENCES event(name, event_date),

    FOREIGN KEY (employee_park) REFERENCES parking_employee(id),
    FOREIGN KEY (employee_return) REFERENCES parking_employee(id)
);

CREATE TABLE event_fan_join(
    event_name VARCHAR(50),
    event_date DATE,
    fan_phone BIGINT,

    FOREIGN KEY (event_name, event_date) REFERENCES event(name, event_date),
    FOREIGN KEY (fan_phone) REFERENCES fan(phone)
);

INSERT INTO fan(phone, name) VALUES (7268905647, 'Jeff Jefferson'),
                                 (1234567890, 'Be Yonce'),
                                 (8945673421, 'Jay Kynerd'),
                                 (7028584599, 'Kevin Leong'),
                                 (0001112222, 'Barney the Dino'),
                                 (1234509876, 'Big Bird'),
                                 (1211121121, 'Anonymous Fan'),
                                 (0010010001, 'Mans Mannerson'),
                                 (1112223333, 'Jeff Jefferson');

INSERT INTO car (license_plate, vehicle_type, fan) VALUES ('LOLSPD', 'Sedan', 7268905647),
                                                          ('2FST4U', 'Minivan', 7028584599),
                                                          ('SPDDEMN', 'Hatchback', 8945673421),
                                                          ('2SlWLOL', 'RV', 1234509876),
                                                          ('1234ABC', 'Sedan', 1211121121),
                                                          ('COWBOYZ', 'SUV', 0001112222),
                                                          ('TESTTST', 'Minivan', 0010010001),
                                                          ('1234567', 'Truck', 1234567890),
                                                          ('7654321', 'Truck', 1112223333);

INSERT INTO stadium (name, address) VALUES
    ('Cowpokes Stadium', '555 Fan Ave, Arlington, TX'),
    ('The Rodeo', '123 Rodeo Way, Ft. Worth, TX');

INSERT INTO parking_lot (name, stadium) VALUES
    ('cA', 'Cowpokes Stadium'),
    ('cB', 'Cowpokes Stadium'),
    ('cC', 'Cowpokes Stadium'),
    ('rA', 'The Rodeo'),
    ('rB', 'The Rodeo'),
    ('rC', 'The Rodeo');

INSERT INTO event (name, event_date, start_time, end_time, stadium) VALUES
    ('Big Ol Tourney', '2022-02-19', '19:30', '21:00', 'Cowpokes Stadium'),
    ('Small Lil Tourney', '2021-12-29', '21:30', '23:00', 'Cowpokes Stadium'),
    ('Practice Scrim', '2022-01-28', '18:30', '21:30', 'The Rodeo'),
    ('Practice Scrim', '2021-11-18', '17:30', '20:30', 'The Rodeo');


INSERT INTO parking_space (number, lot, car, available, handicap, is_Valet) VALUES
    (0001, 'cA', NULL, True, True, False),
    (0002, 'cA', NULL, True, False, False),
    (0003, 'cA', NULL, True, False, False),
    (0004, 'cA', NULL, True, False, False),
    (0005, 'cA', NULL, True, False, False),

    (0001, 'cB', NULL, True, True, False),
    (0002, 'cB', NULL, True, False, False),
    (0003, 'cB', NULL, True, False, False),
    (0004, 'cB', NULL, True, False, False),
    (0005, 'cB', NULL, True, False, False),

    (0001, 'cC', NULL, True, True, False),
    (0002, 'cC', NULL, True, False, False),
    (0003, 'cC', NULL, True, False, False),
    (0004, 'cC', NULL, True, False, False),
    (0005, 'cC', NULL, True, False, False),

    (0001, 'rA', NULL, True, True, False),
    (0002, 'rA', NULL, True, False, False),
    (0003, 'rA', NULL, True, False, False),
    (0004, 'rA', NULL, True, False, False),
    (0005, 'rA', NULL, True, False, False),

    (0001, 'rB', NULL, True, True, False),
    (0002, 'rB', NULL, True, False, False),
    (0003, 'rB', NULL, True, False, False),
    (0004, 'rB', NULL, True, False, False),
    (0005, 'rB', NULL, True, False, False),

    (0001, 'rC', NULL, True, True, False),
    (0002, 'rC', NULL, True, False, False),
    (0003, 'rC', NULL, True, False, False),
    (0004, 'rC', NULL, True, False, False),
    (0005, 'rC', NULL, True, False, False);

INSERT INTO parking_space (number, lot, car, available, handicap, is_Valet) VALUES (0010, 'cA', NULL, False, False, True),
                                                                                   (0011, 'cA', NULL, False, False, True),
                                                                                   (0010, 'cB', NULL, False, False, True),
                                                                                   (0011, 'cB', NULL, False, False, True),
                                                                                   (0010, 'rA', NULL, False, False, True),
                                                                                   (0010, 'rB', NULL, False, False, True),
                                                                                   (0010, 'rC', NULL, False, False, True);

INSERT INTO parking_employee (name, parking_lot, valet_certified) VALUES ('Working Man', 'cA', True),
                                                         ('Billy Worker', 'cA', False),
                                                         ('Jeff Workman', 'cA', True),
                                                         ('Bob Bobbyson', 'cB', False),
                                                         ('Test Man', 'cB', False),
                                                         ('Jeff Goldblum', 'cB', True),
                                                         ('Phil Collins', 'rB', False),
                                                         ('Nick Jonas', 'rA', True),
                                                         ('Kevin Jonas', 'rB', True),
                                                         ('Joe Jonas', 'rC', False),
                                                         ('Bonus Jonas', 'rC', True),
                                                         ('Demi Lovato', 'rC', False);

INSERT INTO allocation (parking_lot, parking_space, car, employee, event_name, event_date, is_Valet) VALUES
    ('cA', 0002, 'LOLSPD', 1,'Big Ol Tourney', '2022-02-19', False),
    ('cA', 0005, '2SlWLOL', 3,'Big Ol Tourney', '2022-02-19', False),
    ('cB', 0001, 'SPDDEMN', 4,'Small Lil Tourney', '2021-12-29', False),
    ('cB', 0003, 'COWBOYZ', 5, 'Small Lil Tourney', '2021-12-29', False),
    ('rA', 0003, '1234ABC', 8,'Practice Scrim', '2021-11-18', False),
    ('rB', 0002, 'COWBOYZ', 9,'Practice Scrim', '2021-11-18', False),
    ('rB', 0001, '2FST4U', 7,'Practice Scrim', '2022-01-28', False),
    ('rC', 0003, 'TESTTST', 6,'Practice Scrim', '2022-01-28', False);

-- updates occupied parking spaces to be unavailable and store license plate of car
UPDATE parking_space
    SET available = FALSE,
        car = parking_db.allocation.car
FROM parking_db.allocation WHERE parking_db.parking_space.lot = parking_db.allocation.parking_lot
                AND parking_space.number = parking_db.allocation.parking_space;

-- VALET
INSERT INTO allocation(parking_lot, parking_space, car, employee, event_name, event_date, is_Valet, employee_park, employee_return) VALUES
    ('cA', 0010, 1234567, 1, 'Big Ol Tourney', '2022-02-19', True, 1, 3),
    ('cB', 0011, 1234567, 6, 'Small Lil Tourney', '2021-12-29', True, 6, 6),
    ('cA', 0011, 7654321, 3, 'Small Lil Tourney', '2021-12-29', True, 3, 1),
    ('rB', 0010, 1234567, 9, 'Practice Scrim', '2021-11-18', True, 8, 8),
    ('rC', 0010, 7654321, 9, 'Practice Scrim', '2021-11-18', True, 9, 10);

-- updates occupied parking spaces to be unavailable and store license plate of car
UPDATE parking_space
    SET available = FALSE,
        car = parking_db.allocation.car
FROM parking_db.allocation WHERE parking_db.parking_space.lot = parking_db.allocation.parking_lot
                AND parking_db.parking_space.number = parking_db.allocation.parking_space;

INSERT INTO event_fan_join (event_name, event_date, fan_phone) VALUES ('Big Ol Tourney', '2022-02-19', 7268905647),
                                                                      ('Big Ol Tourney', '2022-02-19', 1234509876),
                                                                      ('Small Lil Tourney', '2021-12-29', 1112222),
                                                                      ('Practice Scrim', '2022-01-28', 7028584599),
                                                                      ('Practice Scrim', '2022-01-28', 10010001),
                                                                      ('Practice Scrim', '2021-11-18', 1112222),
                                                                      ('Practice Scrim', '2021-11-18', 1211121121);

