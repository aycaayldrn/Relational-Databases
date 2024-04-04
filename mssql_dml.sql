INSERT INTO Human (Pesel_no, name, surname)
VALUES
    (123, 'Monica', 'Geller-Bing'),
    (245, 'Rachel', 'Green'),
    (184, 'Pheobe', 'Buffay'),
    (138, 'Ross', 'Geller'),
    (567, 'Chandler', 'Bing'),
    (688, 'Joey', 'Tribbiani'),
    (430, 'Robin', 'Sherbatsky'),
    (243, 'Lily', 'Aldrin'),
    (678, 'Marshall', 'Eriksen'),
    (900, 'Jake', 'Peralta'),
    (278, 'Amy', 'Santiago'),
    (357, 'Gina', 'Linetti'),
    (894, 'Ted', 'Mosby'),
    (999, 'Barney', 'Stinson'),
    (565, 'Quinn', 'Garvey'),
    (734, 'Mitchel', 'Pritchett'),
    (269, 'Cameron', 'Tucker');

INSERT INTO employee (Pesel_no, date_of_birth, date_of_employment, date_of_dismissal, salary)
VALUES
    (567, '1969-08-19', '2000-07-04', null, 6000),
    (138, '1969-11-18', '2003-12-27', '2022-02-02', 8000),
    (678, '1978-06-24', '1990-09-13', null, 6300),
    (894, '1978-04-25', '2005-08-26', null, 9000),
    (278, '1982-04-16', '2010-09-14', null, 6500),
    (900, '1981-07-24', '2014-03-25', '2020-02-16', 5600),
    (269, '1972-02-20', '1999-01-12', null, 8700),
    (565, '1986-09-07', '2015-01-12', null, 4900),
    (734, '1973-01-04', '2020-01-31', null, 7200);

INSERT INTO client (Pesel_no)
VALUES
    (123),
    (245),
    (184),
    (688),
    (430),
    (243),
    (357),
    (999);

INSERT INTO worker (Pesel_no)
VALUES
    (567),
    (678),
    (278);

INSERT INTO architect (Pesel_no)
VALUES
    (894),
    (900),
    (269),
    (734);

INSERT INTO engineer (Pesel_no)
VALUES
    (138),
    (565);

INSERT INTO building_type (type_id, purpose, num_of_bedroom, num_of_bathroom, floor_space, num_of_parkingspace, num_of_balconies)
VALUES
    (1, 'Hotel', 100, 120, 5000, 200, 100),
    (2, 'Apartment', 4, 2, 120, 0, 1),
    (3, 'AVM', 0, 98, 5000, 1000, 100),
    (4, 'Office', 40, 20, 1000, 200, 5),
    (5, 'Theatre', 0, 10, 2000, 500, 0);

INSERT INTO country (country_id, name)
VALUES
    (400, 'USA'),
    (6, 'ENGLAND'),
    (5, 'ITALY'),
    (4, 'GERMANY'),
    (3, 'HOLLAND');

INSERT INTO city (city_id, name)
VALUES
    (10, 'Manhattan'),
    (20, 'London'),
    (30, 'Rome'),
    (40, 'Berlin'),
    (50, 'Amsterdam');

INSERT INTO location (location_id, postal_code, cardinal_direction, country, city)
VALUES
    (113344,02020,'N',3,30),
    (288776,03397,'W',400,10),
    (689573,00359,'E',5,30),
    (900238,39007,'S',4,40),
    (358905,08902,'E',6,20);

INSERT INTO project (project_ID, budget, description, client_Pesel_no, location_id, building_id)
VALUES
    (12345,68000,'Loft apartment for entertainment use',999,288776,2),
    (23456,100000,'Shopping mall for luxury brands',245,689573,3),
    (34567,10000,'Spiritual Product Office',184,900238,4),
    (45678,500000,'Canada themed hotel',430,113344,1),
    (56789,40000,'Food themed theatre',688,689573,5),
    (67890,250000,'Clean looking villa',123,358905,2);

INSERT INTO engineer_project (project_ID, Pesel_no)
VALUES
    (12345,565),
    (23456,138),
    (34567,138),
    (45678,565),
    (56789,138),
    (67890,565);

INSERT INTO date_of_inv (project, architect, date_of_start, date_of_end)
VALUES
    (12345,894,'27-08-2005','27-02-2006'),
    (23456,269,'14-12-2002','15-04-2003'),
    (34567,900,'28-06-2015','28-09-2015'),
    (45678,894,'01-08-2006','15-06-2007'),
    (56789,900,'01-12-2019','28-11-2020'),
    (67890,269,'19-05-2015','18-01-2019');

INSERT INTO construction (Cons_ID, date_of_start, date_of_completion, project_manager, project)
VALUES
    (12,'27-10-2005','27-02-2006',894,12345),
    (22,'01-01-2003','15-04-2003',269,23456),
    (32,'27-07-2005','28-09-2015',900,34567),
    (42,'20-01-2007','15-06-2007',894,45678),
    (52,'15-12-2009','28-11-2020',900,56789),
    (62,'05-05-2017','18-01-2019',269,67890);

INSERT INTO worker_construction (Pesel_no, construction_id)
VALUES
    (567,12),
    (678,22),
    (278,62);

