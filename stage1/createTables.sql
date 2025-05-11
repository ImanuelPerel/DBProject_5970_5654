CREATE TABLE person (
    pid INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    address VARCHAR(100),
    phone INTEGER,
    birthday DATE
);

CREATE TABLE employee (
    pid INTEGER PRIMARY KEY REFERENCES person(pid),
    job_title varchar(50),
    contract INTEGER,
    hire_date DATE
);

CREATE TABLE hourlyworker (
    pid INTEGER PRIMARY KEY REFERENCES employee(pid),
    hourly_wage DOUBLE PRECISION,
    bonus DOUBLE PRECISION,
    overtime_rate DOUBLE PRECISION
);

CREATE TABLE monthlyworker (
    pid INTEGER PRIMARY KEY REFERENCES employee(pid),
    monthly_wage DOUBLE PRECISION,
    overtime_rate DOUBLE PRECISION,
    vacation_days INTEGER
);

CREATE TABLE shiftforworker (
    pid INTEGER PRIMARY KEY REFERENCES hourlyworker(pid),
    checkin_time INTEGER,
    checkout_time INTEGER,
    day_of_week INTEGER
);

CREATE TABLE customer (
    pid INTEGER PRIMARY KEY REFERENCES person(pid),
    emergencycontactname varchar(50),
    membershiptype INTEGER,
    membershipexpirydate DATE
);

CREATE TABLE service (
    service_name VARCHAR(100) PRIMARY KEY,
    equipment_required VARCHAR(100),
    price DOUBLE PRECISION
);

CREATE TABLE ordered (
    pid INTEGER REFERENCES customer(pid),
    service_name VARCHAR(100) REFERENCES service(service_name),
    service_date_begin DATE,
    service_end_date DATE,
    PRIMARY KEY (pid, service_name, service_date_begin)
);
