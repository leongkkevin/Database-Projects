CREATE DATABASE parking_db;

CREATE TABLE fan(
    phone BIGINT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE car (
    license_plate VARCHAR(10) PRIMARY KEY,
    vehicle_type VARCHAR(50),

    fan BIGINT,
    FOREIGN KEY (fan) REFERENCES fan(id)
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
    FOREIGN KEY (lot) REFERENCES parking_lot(name),
    FOREIGN KEY (car) REFERENCES car(license_plate),
    PRIMARY KEY (number, lot)
);

CREATE TABLE allocation(
    id SERIAL PRIMARY KEY,

    parking_lot VARCHAR(2),
    parking_space INT,

    car VARCHAR(10),
    employee INT,

    event_name VARCHAR(50),
    event_date DATE,

    FOREIGN KEY (employee) REFERENCES parking_employee(id),
    FOREIGN KEY (parking_lot, parking_space) REFERENCES parking_space(lot, number),

    FOREIGN KEY (event_name, event_date) REFERENCES event(name, event_date)
);

CREATE TABLE parking_employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    parking_lot VARCHAR(2),
    FOREIGN KEY (parking_lot) REFERENCES parking_lot(name)
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
                                 (0010010001, 'Mans Mannerson');

INSERT INTO car (license_plate, vehicle_type, fan) VALUES ('LOLSPD', 'Sedan', 7268905647),
                                                          ('2FST4U', 'Minivan', 7028584599),
                                                          ('SPDDEMN', 'Hatchback', 8945673421),
                                                          ('2SlWLOL', 'RV', 1234509876),
                                                          ('1234ABC', 'Sedan', 1211121121),
                                                          ('COWBOYZ', 'SUV', 0001112222),
                                                          ('TESTTST', 'Minivan', 0010010001);

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


INSERT INTO parking_space (number, lot, car, available, handicap) VALUES
    (0001, 'cA', NULL, True, True),
    (0002, 'cA', NULL, True, False),
    (0003, 'cA', NULL, True, False),
    (0004, 'cA', NULL, True, False),
    (0005, 'cA', NULL, True, False),

    (0001, 'cB', NULL, True, True),
    (0002, 'cB', NULL, True, False),
    (0003, 'cB', NULL, True, False),
    (0004, 'cB', NULL, True, False),
    (0005, 'cB', NULL, True, False),

    (0001, 'cC', NULL, True, True),
    (0002, 'cC', NULL, True, False),
    (0003, 'cC', NULL, True, False),
    (0004, 'cC', NULL, True, False),
    (0005, 'cC', NULL, True, False),

    (0001, 'rA', NULL, True, True),
    (0002, 'rA', NULL, True, False),
    (0003, 'rA', NULL, True, False),
    (0004, 'rA', NULL, True, False),
    (0005, 'rA', NULL, True, False),

    (0001, 'rB', NULL, True, True),
    (0002, 'rB', NULL, True, False),
    (0003, 'rB', NULL, True, False),
    (0004, 'rB', NULL, True, False),
    (0005, 'rB', NULL, True, False),

    (0001, 'rC', NULL, True, True),
    (0002, 'rC', NULL, True, False),
    (0003, 'rC', NULL, True, False),
    (0004, 'rC', NULL, True, False),
    (0005, 'rC', NULL, True, False);

INSERT INTO parking_employee (name, parking_lot) VALUES ('Working Man', 'cA'),
                                                         ('Billy Worker', 'cA'),
                                                         ('Jeff Workman', 'cA'),
                                                         ('Bob Bobbyson', 'cB'),
                                                         ('Test Man', 'cB'),
                                                         ('Jeff Goldblum', 'cB'),
                                                         ('Phil Collins', 'rA'),
                                                         ('Nick Jonas', 'rA'),
                                                         ('Kevin Jonas', 'rA'),
                                                         ('Joe Jonas', 'rC'),
                                                         ('Bonus Jonas', 'rC'),
                                                         ('Demi Lovato', 'rC');

INSERT INTO allocation (parking_lot, parking_space, car, employee, event_name, event_date) VALUES ('cA', 0002, 'LOLSPD', 13,'Big Ol Tourney', '2022-02-19'),
                                                                                                  ('cA', 0005, '2SlWLOL', 15,'Big Ol Tourney', '2022-02-19'),
                                                                                                  ('cB', 0001, 'SDDEMN', 18,'Small Lil Tourney', '2021-12-29'),
                                                                                                  ('cB', 0003, 'COWBOYZ', 17, 'Small Lil Tourney', '2021-12-29'),
                                                                                                  ('rA', 0003, '1234ABC', 33,'Practice Scrim', '2021-11-18'),
                                                                                                  ('rA', 0002, 'COWBOYZ', 34,'Practice Scrim', '2021-11-18'),
                                                                                                  ('rC', 0001, '2FST4U', 35,'Practice Scrim', '2022-01-28'),
                                                                                                  ('rC', 0003, 'TESTTST', 35,'Practice Scrim', '2022-01-28');

INSERT INTO event_fan_join (event_name, event_date, fan_phone) VALUES ('Big Ol Tourney', '2022-02-19', 7268905647),
                                                                      ('Big Ol Tourney', '2022-02-19', 1234509876),
                                                                      ('Small Lil Tourney', '2021-12-29', 1112222),
                                                                      ('Practice Scrim', '2022-01-28', 7028584599),
                                                                      ('Practice Scrim', '2022-01-28', 10010001),
                                                                      ('Practice Scrim', '2021-11-18', 1112222),
                                                                      ('Practice Scrim', '2021-11-18', 1211121121);
SELECT * FROM car INNER JOIN allocation ON  event_date = '2022-01-28' AND license_plate = allocation.car;
