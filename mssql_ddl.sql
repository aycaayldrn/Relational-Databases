SET DATEFORMAT DMY;


CREATE TABLE Human (
    Pesel_no INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    surname VARCHAR(40) NOT NULL
);

CREATE TABLE architect (
    Pesel_no INT NOT NULL PRIMARY KEY
);

CREATE TABLE building_type (
    type_id INT NOT NULL PRIMARY KEY,
    purpose VARCHAR(40) NOT NULL,
    num_of_bedroom INT NOT NULL,
    num_of_bathroom INT NOT NULL,
    floor_space INT NOT NULL,
    num_of_parkingspace INT NOT NULL,
    num_of_balconies INT NOT NULL
);

CREATE TABLE city (
    city_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE client (
    Pesel_no INT NOT NULL PRIMARY KEY
);

CREATE TABLE construction (
    Cons_ID INT NOT NULL PRIMARY KEY,
    date_of_start DATE NOT NULL,
    date_of_completion DATE NULL,
    project_manager INT NOT NULL,
    project INT NOT NULL
);

CREATE TABLE country (
    country_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE date_of_inv (
    project INT NOT NULL,
    architect INT NOT NULL,
    date_of_start DATE NOT NULL,
    date_of_end DATE NULL,
    PRIMARY KEY (project, architect)
);

CREATE TABLE employee (
    Pesel_no INT NOT NULL PRIMARY KEY,
    date_of_birth DATE NOT NULL,
    date_of_employment DATE NOT NULL,
    date_of_dismissal DATE NULL,
    salary INT NOT NULL
);

CREATE TABLE engineer (
    Pesel_no INT NOT NULL PRIMARY KEY
);

CREATE TABLE engineer_project (
    project_ID INT NOT NULL,
    Pesel_no INT NOT NULL,
    PRIMARY KEY (project_ID, Pesel_no)
);

CREATE TABLE location (
    location_id INT NOT NULL PRIMARY KEY,
    postal_code CHAR(6) NOT NULL,
    cardinal_direction CHAR(1) NOT NULL,
    country INT NOT NULL,
    city INT NOT NULL
);

CREATE TABLE project (
    project_ID INT NOT NULL PRIMARY KEY,
    budget INT NOT NULL,
    description VARCHAR(900) NOT NULL,
    client_Pesel_no INT NOT NULL,
    location_id INT NOT NULL,
    building_id INT NOT NULL
);

CREATE TABLE worker (
    Pesel_no INT NOT NULL PRIMARY KEY
);

CREATE TABLE worker_construction (
    Pesel_no INT NOT NULL,
    construction_id INT NOT NULL,
    PRIMARY KEY (Pesel_no, construction_id)
);


ALTER TABLE architect ADD CONSTRAINT architect_employee
    FOREIGN KEY (Pesel_no)
    REFERENCES employee (Pesel_no);

ALTER TABLE worker ADD CONSTRAINT building_worker_employee
    FOREIGN KEY (Pesel_no)
    REFERENCES employee (Pesel_no);

ALTER TABLE client ADD CONSTRAINT client_Human
    FOREIGN KEY (Pesel_no)
    REFERENCES Human (Pesel_no);

ALTER TABLE construction ADD CONSTRAINT construction_architect
    FOREIGN KEY (project_manager)
    REFERENCES architect (Pesel_no);

ALTER TABLE worker_construction ADD CONSTRAINT construction_building_worker
    FOREIGN KEY (Pesel_no)
    REFERENCES worker (Pesel_no);

ALTER TABLE construction ADD CONSTRAINT construction_project
    FOREIGN KEY (project)
    REFERENCES project (project_ID);

ALTER TABLE date_of_inv ADD CONSTRAINT date_of_inv_architect
    FOREIGN KEY (architect)
    REFERENCES architect (Pesel_no);

ALTER TABLE date_of_inv ADD CONSTRAINT date_of_inv_project
    FOREIGN KEY (project)
    REFERENCES project (project_ID);

ALTER TABLE employee ADD CONSTRAINT employee_Human
    FOREIGN KEY (Pesel_no)
    REFERENCES Human (Pesel_no);

ALTER TABLE engineer ADD CONSTRAINT engineer_employee
    FOREIGN KEY (Pesel_no)
    REFERENCES employee (Pesel_no);

ALTER TABLE engineer_project ADD CONSTRAINT engineer_project_project
    FOREIGN KEY (project_ID)
    REFERENCES project (project_ID);

ALTER TABLE location ADD CONSTRAINT location_city
    FOREIGN KEY (city)
    REFERENCES city (city_id);

ALTER TABLE location ADD CONSTRAINT location_country
    FOREIGN KEY (country)
    REFERENCES country (country_id);

ALTER TABLE project ADD CONSTRAINT project_building_type
    FOREIGN KEY (building_id)
    REFERENCES building_type (type_id);

ALTER TABLE project ADD CONSTRAINT project_client
    FOREIGN KEY (client_Pesel_no)
    REFERENCES client (Pesel_no);

ALTER TABLE engineer_project ADD CONSTRAINT project_engineer
    FOREIGN KEY (Pesel_no)
    REFERENCES engineer (Pesel_no);

ALTER TABLE project ADD CONSTRAINT project_location
    FOREIGN KEY (location_id)
    REFERENCES location (location_id);

ALTER TABLE worker_construction ADD CONSTRAINT worker_construction
    FOREIGN KEY (construction_id)
    REFERENCES construction (Cons_ID);


