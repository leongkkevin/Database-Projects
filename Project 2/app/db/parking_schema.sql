CREATE DATABASE parking_db;

CREATE TABLE parking_db.fan(
    phone BIGINT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE parking_db.car (
    license_plate VARCHAR(10) PRIMARY KEY,
    vehicle_type VARCHAR(50),

    fan BIGINT,
    FOREIGN KEY (fan) REFERENCES parking_db.fan(phone)
);

CREATE TABLE parking_db.stadium (
    name VARCHAR(30) PRIMARY KEY,
    address VARCHAR(50)
);

CREATE TABLE parking_db.event(
    name VARCHAR(50),
    event_date DATE,
    PRIMARY KEY (name, event_date),

    start_time TIME,
    end_time TIME,

    stadium VARCHAR(30),
    FOREIGN KEY (stadium) REFERENCES parking_db.stadium(name)
);

CREATE TABLE parking_db.parking_lot (
    name VARCHAR(2) PRIMARY KEY,
    stadium VARCHAR(30),
    FOREIGN KEY (stadium) REFERENCES parking_db.stadium(name)
);

CREATE TABLE parking_db.parking_space (
    number INT,
    lot VARCHAR(2),
    car VARCHAR(10),
    available BOOLEAN,
    handicap BOOLEAN,
    is_Valet BOOLEAN,
    FOREIGN KEY (lot) REFERENCES parking_db.parking_lot(name),
    FOREIGN KEY (car) REFERENCES parking_db.car(license_plate),
    PRIMARY KEY (number, lot)
);

CREATE TABLE parking_db.employee (
    name VARCHAR(50),
    username VARCHAR(50) PRIMARY KEY ,
    password VARCHAR(100),
    parking_lot VARCHAR(2),
    valet_certified BOOLEAN,
    FOREIGN KEY (parking_lot) REFERENCES parking_db.parking_lot(name)
);

CREATE TABLE parking_db.allocation(
    id SERIAL PRIMARY KEY,

    parking_lot VARCHAR(2),
    parking_space INT,

    car VARCHAR(10),
    employee VARCHAR(50),

    event_name VARCHAR(50),
    event_date DATE,

    is_Valet BOOLEAN,
    employee_park VARCHAR(50),
    employee_return VARCHAR(50),

    FOREIGN KEY(car) REFERENCES car(license_plate),

    FOREIGN KEY (employee) REFERENCES employee(username),
    FOREIGN KEY (parking_lot, parking_space) REFERENCES parking_db.parking_space(lot, number),

    FOREIGN KEY (event_name, event_date) REFERENCES parking_db.event(name, event_date),

    FOREIGN KEY (employee_park) REFERENCES employee(username),
    FOREIGN KEY (employee_return) REFERENCES employee(username)
);

CREATE TABLE parking_db.event_fan_join(
    event_name VARCHAR(50),
    event_date DATE,
    fan_phone BIGINT,

    FOREIGN KEY (event_name, event_date) REFERENCES parking_db.event(name, event_date),
    FOREIGN KEY (fan_phone) REFERENCES parking_db.fan(phone)
);

CREATE TABLE parking_db.session (
    token VARCHAR(250),
    username VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(100),

    PRIMARY KEY (token)
);


INSERT INTO parking_db.fan(phone, name) VALUES (7268905647, 'Jeff Jefferson'),
                                 (1234567890, 'Be Yonce'),
                                 (8945673421, 'Jay Kynerd'),
                                 (7028584599, 'Kevin Leong'),
                                 (0001112222, 'Barney the Dino'),
                                 (1234509876, 'Big Bird'),
                                 (1211121121, 'Anonymous Fan'),
                                 (0010010001, 'Mans Mannerson'),
                                 (1112223333, 'Jeff Jefferson');

INSERT INTO parking_db.car (license_plate, vehicle_type, fan) VALUES ('LOLSPD', 'Sedan', 7268905647),
                                                          ('2FST4U', 'Minivan', 7028584599),
                                                          ('SPDDEMN', 'Hatchback', 8945673421),
                                                          ('2SlWLOL', 'RV', 1234509876),
                                                          ('1234ABC', 'Sedan', 1211121121),
                                                          ('COWBOYZ', 'SUV', 0001112222),
                                                          ('TESTTST', 'Minivan', 0010010001),
                                                          ('1234567', 'Truck', 1234567890),
                                                          ('7654321', 'Truck', 1112223333);

INSERT INTO parking_db.stadium (name, address) VALUES
    ('Cowpokes Stadium', '555 Fan Ave, Arlington, TX'),
    ('The Rodeo', '123 Rodeo Way, Ft. Worth, TX');

INSERT INTO parking_db.parking_lot (name, stadium) VALUES
    ('cA', 'Cowpokes Stadium'),
    ('cB', 'Cowpokes Stadium'),
    ('cC', 'Cowpokes Stadium'),
    ('rA', 'The Rodeo'),
    ('rB', 'The Rodeo'),
    ('rC', 'The Rodeo');

INSERT INTO parking_db.event (name, event_date, start_time, end_time, stadium) VALUES
    ('Big Ol Tourney', '2022-02-19', '19:30', '21:00', 'Cowpokes Stadium'),
    ('Small Lil Tourney', '2021-12-29', '21:30', '23:00', 'Cowpokes Stadium'),
    ('Practice Scrim', '2022-01-28', '18:30', '21:30', 'The Rodeo'),
    ('Practice Scrim', '2021-11-18', '17:30', '20:30', 'The Rodeo');


INSERT INTO parking_db.parking_space (number, lot, car, available, handicap, is_Valet) VALUES
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

INSERT INTO parking_db.parking_space (number, lot, car, available, handicap, is_Valet) VALUES (0010, 'cA', NULL, False, False, True),
                                                                                   (0011, 'cA', NULL, False, False, True),
                                                                                   (0010, 'cB', NULL, False, False, True),
                                                                                   (0011, 'cB', NULL, False, False, True),
                                                                                   (0010, 'rA', NULL, False, False, True),
                                                                                   (0010, 'rB', NULL, False, False, True),
                                                                                   (0010, 'rC', NULL, False, False, True);

INSERT INTO parking_db.employee (name, username, parking_lot, valet_certified) VALUES ('Working Man', 'wm', 'cA', True),
                                                         ('Billy Worker', 'bw', 'cA', False),
                                                         ('Jeff Workman', 'jw', 'cA', True),
                                                         ('Bob Bobbyson', 'bb','cB', False),
                                                         ('Test Man', 'tm','cB', False),
                                                         ('Jeff Goldblum', 'jg','cB', True),
                                                         ('Phil Collins', 'pc','rB', False),
                                                         ('Nick Jonas', 'nj','rA', True),
                                                         ('Kevin Jonas', 'kj', 'rB', True),
                                                         ('Joe Jonas', 'jj', 'rC', False),
                                                         ('Bonus Jonas', 'bj', 'rC', True),
                                                         ('Demi Lovato', 'dl', 'rC', False);

INSERT INTO parking_db.allocation (parking_lot, parking_space, car, employee, event_name, event_date, is_Valet) VALUES
    ('cA', 0002, 'LOLSPD', 'bw','Big Ol Tourney', '2022-02-19', False),
    ('cA', 0005, '2SlWLOL', 'jw','Big Ol Tourney', '2022-02-19', False),
    ('cB', 0001, 'SPDDEMN', 'tm','Small Lil Tourney', '2021-12-29', False),
    ('cB', 0003, 'COWBOYZ', 'bj', 'Small Lil Tourney', '2021-12-29', False),
    ('rA', 0003, '1234ABC', 'pc','Practice Scrim', '2021-11-18', False),
    ('rB', 0002, 'COWBOYZ', 'pc','Practice Scrim', '2021-11-18', False),
    ('rB', 0001, '2FST4U', 'jg','Practice Scrim', '2022-01-28', False),
    ('rC', 0003, 'TESTTST', 'nj','Practice Scrim', '2022-01-28', False);


INSERT INTO parking_db.event_fan_join (event_name, event_date, fan_phone) VALUES ('Big Ol Tourney', '2022-02-19', 7268905647),
                                                                      ('Big Ol Tourney', '2022-02-19', 1234509876),
                                                                      ('Small Lil Tourney', '2021-12-29', 1112222),
                                                                      ('Practice Scrim', '2022-01-28', 7028584599),
                                                                      ('Practice Scrim', '2022-01-28', 10010001),
                                                                      ('Practice Scrim', '2021-11-18', 1112222),
                                                                      ('Practice Scrim', '2021-11-18', 1211121121);