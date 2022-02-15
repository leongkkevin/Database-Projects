-- How many total parking spaces do I have?
SELECT count(*) FROM parking_space;

-- How many parking lots are there at Cowpokes Stadium?
SELECT count(*) FROM parking_lot
WHERE parking_lot.stadium = 'Cowpokes Stadium';

-- How many parking spaces are there at Cowpokes Stadium?
SELECT count(*) FROM parking_space
JOIN parking_lot ON parking_space.lot = parking_lot.name
WHERE parking_lot.stadium = 'Cowpokes Stadium';

-- What parking spaces are currently available for use?
SELECT lot, number FROM parking_space
WHERE available = TRUE;

-- What parking spaces ended up being used for Event 1?
SELECT parking_lot, parking_space FROM allocation
WHERE event_name = 'Big Ol Tourney' AND event_date = '2022-02-19';

-- What parking spaces ended up being used for Event 2?
SELECT parking_lot, parking_space FROM allocation
WHERE event_name = 'Small Lil Tourney' AND event_date = '2021-12-29';

-- What employees occupy lot 2 at Rodeo Stadium?
SELECT id, parking_employee.name, parking_lot.stadium FROM parking_employee
JOIN parking_lot ON parking_employee.parking_lot = parking_lot.name
WHERE parking_lot.name = 'rB';

-- How many Trucks have parked at any of my venues?
SELECT count(*) FROM car
JOIN allocation ON license_plate = allocation.car
WHERE car.vehicle_type = 'Truck';

-- How many of each vehicle type have parked at any of my venues?
SELECT vehicle_type, count(*) FROM car
JOIN allocation ON license_plate = allocation.car
GROUP BY car.vehicle_type;

-- On average, how many vehicles come to an event?
SELECT AVG(count) FROM (
    SELECT count(car) FROM allocation
    GROUP BY (event_name, event_date)
    ) as count;

-- EXTRA FOR TEAM OF 2
-- How many total valet spots are there in all parking lots?
SELECT count(*) FROM parking_space
WHERE is_Valet = True;

-- Which employees are certified to valet cars
SELECT id, name FROM parking_employee
WHERE valet_certified = TRUE;

-- What are the names of the fans who's cars have been valeted?
SELECT name FROM fan
JOIN car c on fan.phone = c.fan
JOIN allocation a on c.license_plate = a.car
WHERE a.is_Valet = True;
