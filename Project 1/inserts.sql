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