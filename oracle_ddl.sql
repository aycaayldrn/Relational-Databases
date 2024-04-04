CREATE TABLE Human (
    Pesel_no integer  NOT NULL,
    name varchar2(20)  NOT NULL,
    surname varchar2(40)  NOT NULL,
    CONSTRAINT Human_pk PRIMARY KEY (Pesel_no)
) ;


CREATE TABLE architect (
    Pesel_no integer  NOT NULL,
    CONSTRAINT architect_pk PRIMARY KEY (Pesel_no)
) ;

CREATE TABLE building_type (
    type_id integer  NOT NULL,
    purpose varchar2(40)  NOT NULL,
    num_of_bedroom integer  NOT NULL,
    num_of_bathroom integer  NOT NULL,
    floor_space integer  NOT NULL,
    num_of_parkingspace integer  NOT NULL,
    num_of_balconies integer  NOT NULL,
    CONSTRAINT building_type_pk PRIMARY KEY (type_id)
) ;

CREATE TABLE city (
    city_id integer  NOT NULL,
    name varchar2(20)  NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY (city_id)
) ;

CREATE TABLE client (
    Pesel_no integer  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (Pesel_no)
) ;

CREATE TABLE construction (
    Cons_ID integer  NOT NULL,
    date_of_start date  NOT NULL,
    date_of_completion date  NULL,
    project_manager integer  NOT NULL,
    project integer  NOT NULL,
    CONSTRAINT construction_pk PRIMARY KEY (Cons_ID)
) ;

CREATE TABLE country (
    country_id integer  NOT NULL,
    name varchar2(20)  NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY (country_id)
) ;

CREATE TABLE date_of_inv (
    project integer  NOT NULL,
    architect integer  NOT NULL,
    date_of_start date  NOT NULL,
    date_of_end date  NULL,
    CONSTRAINT date_of_inv_pk PRIMARY KEY (project,architect)
) ;

CREATE TABLE employee (
    Pesel_no integer  NOT NULL,
    date_of_birth date  NOT NULL,
    date_of_employment date  NOT NULL,
    date_of_dismissal date  NULL,
    salary integer  NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY (Pesel_no)
) ;

CREATE TABLE engineer (
    Pesel_no integer  NOT NULL,
    CONSTRAINT engineer_pk PRIMARY KEY (Pesel_no)
) ;

CREATE TABLE engineer_project (
    project_ID integer  NOT NULL,
    Pesel_no integer  NOT NULL,
    CONSTRAINT engineer_project_pk PRIMARY KEY (project_ID,Pesel_no)
) ;

CREATE TABLE location (
    location_id integer  NOT NULL,
    postal_code char(6)  NOT NULL,
    cardinal_direction char(1)  NOT NULL,
    country integer  NOT NULL,
    city integer  NOT NULL,
    CONSTRAINT location_pk PRIMARY KEY (location_id)
) ;

CREATE TABLE project (
    project_ID integer  NOT NULL,
    budget integer  NOT NULL,
    description varchar2(900)  NOT NULL,
    client_Pesel_no integer  NOT NULL,
    location_id integer  NOT NULL,
    building_id integer  NOT NULL,
    CONSTRAINT project_pk PRIMARY KEY (project_ID)
) ;

CREATE TABLE worker (
    Pesel_no integer  NOT NULL,
    CONSTRAINT worker_pk PRIMARY KEY (Pesel_no)
) ;

CREATE TABLE worker_construction (
    Pesel_no integer  NOT NULL,
    construction_id integer  NOT NULL,
    CONSTRAINT worker_construction_pk PRIMARY KEY (Pesel_no,construction_id)
) ;


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




