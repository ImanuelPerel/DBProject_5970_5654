-- person
INSERT INTO person VALUES (1, 'John', 'Doe', 'john@example.com', 'Street 1', 123456789, DATE '1990-01-01');
INSERT INTO person VALUES (2, 'Jane', 'Smith', 'jane@example.com', 'Street 2', 987654321, DATE '1985-06-15');
INSERT INTO person VALUES (3, 'Avi', 'Cohen', 'avi@example.com', 'Street 3', 111222333, DATE '1992-12-30');

-- employee
INSERT INTO employee VALUES (1, 'Manager', 1234, DATE '2020-01-10');
INSERT INTO employee VALUES (2, 'Technician', 2345, DATE '2021-05-20');
INSERT INTO employee VALUES (3, 'Cleaner', 3456, DATE '2022-03-01');

-- hourlyworker
INSERT INTO hourlyworker VALUES (1, 45.5, 200.0, 60.0);
INSERT INTO hourlyworker VALUES (2, 40.0, 150.0, 55.0);
INSERT INTO hourlyworker VALUES (3, 50.0, 250.0, 65.0);

-- monthlyworker
INSERT INTO monthlyworker VALUES (1, 8000.0, 100.0, 15);
INSERT INTO monthlyworker VALUES (2, 9000.0, 120.0, 18);
INSERT INTO monthlyworker VALUES (3, 8500.0, 110.0, 12);

-- shiftforworker
INSERT INTO shiftforworker VALUES (1, 800, 1600, 2);
INSERT INTO shiftforworker VALUES (2, 900, 1700, 3);
INSERT INTO shiftforworker VALUES (3, 1000, 1800, 4);

-- customer
INSERT INTO customer VALUES (1, 'shlomi', 1, DATE '2025-10-10');
INSERT INTO customer VALUES (2, 'haiim', 2, DATE '2025-11-11');
INSERT INTO customer VALUES (3, 'moshe', 1, DATE '2025-12-31');

-- service
INSERT INTO service VALUES ('Cleaning', 'Vacuum, Mop', 100.0);
INSERT INTO service VALUES ('Polishing', 'Polisher, Cloths', 200.0);
INSERT INTO service VALUES ('Washing', 'Water Hose, Brush', 150.0);

-- ordered
INSERT INTO ordered VALUES (1, 'Cleaning', DATE '2025-01-01', DATE '2025-01-02');
INSERT INTO ordered VALUES (2, 'Washing', DATE '2025-01-05', DATE '2025-01-06');
INSERT INTO ordered VALUES (3, 'Polishing', DATE '2025-01-10', DATE '2025-01-11');
