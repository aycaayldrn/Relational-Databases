INSERT ALL
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (123, 'Monica','Geller-Bing')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (245, 'Rachel','Green')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (184, 'Pheobe','Buffay')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (138, 'Ross','Geller')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (567, 'Chandler','Bing')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (688, 'Joey','Tribbiani')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (430, 'Robin','Sherbatsky')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (243, 'Lily','Aldrin')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (678, 'Marshall','Eriksen')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (900, 'Jake','Peralta')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (278, 'Amy','Santiago')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (357, 'Gina','Linetti')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (894, 'Ted','Mosby')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (999, 'Barney','Stinson')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (565, 'Quinn','Garvey')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (734, 'Mitchel','Pritchett')
    INTO Human (PESEL_NO, NAME, SURNAME) VALUES (269, 'Cameron','Tucker')
SELECT 1 FROM dual;

INSERT ALL
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (567,'19-08-1969','07-04-2000',null,6000)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (138,'18-11-1969','27-12-2003','02-02-2022',8000)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (678,'24-06-1978','13-09-1990',null,6300)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (894,'25-04-1978','26-08-2005','12-07-2007',9000)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (278,'16-04-1982','14-09-2010',null,6500)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (900,'24-07-1981','25-03-2014',null,5600)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (269,'20-02-1972','12-01-1999',null,8700)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (565,'07-09-1986','12-01-2015',null,4900)
    INTO employee (PESEL_NO, DATE_OF_BIRTH, DATE_OF_EMPLOYMENT, DATE_OF_DISMISSAL, SALARY) VALUES (734,'04-01-1973','31-01-2020',null,7200)
SELECT 1 FROM dual;

INSERT ALL
    INTO client (PESEL_NO) VALUES (123)
    INTO client (PESEL_NO) VALUES (245)
    INTO client (PESEL_NO) VALUES (184)
    INTO client (PESEL_NO) VALUES (688)
    INTO client (PESEL_NO) VALUES (430)
    INTO client (PESEL_NO) VALUES (243)
    INTO client (PESEL_NO) VALUES (357)
    INTO client (PESEL_NO) VALUES (999)
SELECT 1 FROM dual;

INSERT ALL
    INTO worker (PESEL_NO) VALUES (567)
    INTO worker (PESEL_NO) VALUES (678)
    INTO worker (PESEL_NO) VALUES (278)
SELECT 1 FROM dual;

INSERT ALL
    INTO architect (PESEL_NO) VALUES (894)
    INTO architect (PESEL_NO) VALUES (900)
    INTO architect (PESEL_NO) VALUES (269)
    INTO architect (PESEL_NO) VALUES (734)
SELECT 1 FROM dual;

INSERT ALL
    INTO engineer (PESEL_NO) VALUES (138)
    INTO engineer (PESEL_NO) VALUES (565)
SELECT 1 FROM dual;

INSERT ALL
    INTO building_type (TYPE_ID, PURPOSE, NUM_OF_BEDROOM, NUM_OF_BATHROOM, FLOOR_SPACE, NUM_OF_PARKINGSPACE, NUM_OF_BALCONIES) VALUES (1,'Hotel',100,120,5000,200,100)
    INTO building_type (TYPE_ID, PURPOSE, NUM_OF_BEDROOM, NUM_OF_BATHROOM, FLOOR_SPACE, NUM_OF_PARKINGSPACE, NUM_OF_BALCONIES) VALUES (2,'Apartment',4,2,120,0,1)
    INTO building_type (TYPE_ID, PURPOSE, NUM_OF_BEDROOM, NUM_OF_BATHROOM, FLOOR_SPACE, NUM_OF_PARKINGSPACE, NUM_OF_BALCONIES) VALUES (3,'AVM',0,98,5000,1000,100)
    INTO building_type (TYPE_ID, PURPOSE, NUM_OF_BEDROOM, NUM_OF_BATHROOM, FLOOR_SPACE, NUM_OF_PARKINGSPACE, NUM_OF_BALCONIES) VALUES (4,'Office',40,20,1000,200,5)
    INTO building_type (TYPE_ID, PURPOSE, NUM_OF_BEDROOM, NUM_OF_BATHROOM, FLOOR_SPACE, NUM_OF_PARKINGSPACE, NUM_OF_BALCONIES) VALUES (5,'Theatre',0,10,2000,500,0)
SELECT 1 from dual;

INSERT ALL
    INTO country (COUNTRY_ID, NAME) VALUES (400,'USA')
    INTO country (COUNTRY_ID, NAME) VALUES (6,'ENGLAND')
    INTO country (COUNTRY_ID, NAME) VALUES (5,'ITALY')
    INTO country (COUNTRY_ID, NAME) VALUES (4,'GERMANY')
    INTO country (COUNTRY_ID, NAME) VALUES (3,'HOLLAND')
SELECT 1 from dual;

INSERT ALL
    INTO city (CITY_ID, NAME) VALUES (10,'Manhattan')
    INTO city (CITY_ID, NAME) VALUES (20,'London')
    INTO city (CITY_ID, NAME) VALUES (30,'Rome')
    INTO city (CITY_ID, NAME) VALUES (40,'Berlin')
    INTO city (CITY_ID, NAME) VALUES (50,'Amsterdam')
SELECT 1 from dual;

INSERT ALL
    INTO location (LOCATION_ID, POSTAL_CODE, CARDINAL_DIRECTION, COUNTRY, CITY) VALUES (113344,02020,'N',3,30)
    INTO location (LOCATION_ID, POSTAL_CODE, CARDINAL_DIRECTION, COUNTRY, CITY) VALUES (288776,03397,'W',400,10)
    INTO location (LOCATION_ID, POSTAL_CODE, CARDINAL_DIRECTION, COUNTRY, CITY) VALUES (689573,00359,'E',5,30)
    INTO location (LOCATION_ID, POSTAL_CODE, CARDINAL_DIRECTION, COUNTRY, CITY) VALUES (900238,39007,'S',4,40)
    INTO location (LOCATION_ID, POSTAL_CODE, CARDINAL_DIRECTION, COUNTRY, CITY) VALUES (358905,08902,'E',6,20)
SELECT 1 from dual;

INSERT ALL
    INTO project (PROJECT_ID, BUDGET, DESCRIPTION, CLIENT_PESEL_NO, LOCATION_ID, BUILDING_ID) VALUES (12345,68000,'Loft apartment for entertainment use',999,288776,2)
    INTO project (PROJECT_ID, BUDGET, DESCRIPTION, CLIENT_PESEL_NO, LOCATION_ID, BUILDING_ID) VALUES (23456,100000,'Shopping mall for luxury brands',245,689573,3)
    INTO project (PROJECT_ID, BUDGET, DESCRIPTION, CLIENT_PESEL_NO, LOCATION_ID, BUILDING_ID) VALUES (34567,10000,'Spiritual Product Office',184,900238,4)
    INTO project (PROJECT_ID, BUDGET, DESCRIPTION, CLIENT_PESEL_NO, LOCATION_ID, BUILDING_ID) VALUES (45678,500000,'Canada themed hotel',430,113344,1)
    INTO project (PROJECT_ID, BUDGET, DESCRIPTION, CLIENT_PESEL_NO, LOCATION_ID, BUILDING_ID) VALUES (56789,40000,'Food themed theatre',688,689573,5)
    INTO project (PROJECT_ID, BUDGET, DESCRIPTION, CLIENT_PESEL_NO, LOCATION_ID, BUILDING_ID) VALUES (67890,250000,'Clean looking villa',123,358905,2)
SELECT 1 from dual;

INSERT ALL
    INTO engineer_project (PROJECT_ID, PESEL_NO) VALUES (12345,565)
    INTO engineer_project (PROJECT_ID, PESEL_NO) VALUES (23456,138)
    INTO engineer_project (PROJECT_ID, PESEL_NO) VALUES (34567,138)
    INTO engineer_project (PROJECT_ID, PESEL_NO) VALUES (45678,565)
    INTO engineer_project (PROJECT_ID, PESEL_NO) VALUES (56789,138)
    INTO engineer_project (PROJECT_ID, PESEL_NO) VALUES (67890,565)
SELECT 1 from dual;


INSERT ALL
    INTO date_of_inv (PROJECT, ARCHITECT, DATE_OF_START, DATE_OF_END) VALUES (12345,894,'27-08-2005','27-02-2006')
    INTO date_of_inv (PROJECT, ARCHITECT, DATE_OF_START, DATE_OF_END) VALUES (23456,269,'14-12-2002','15-04-2003')
    INTO date_of_inv (PROJECT, ARCHITECT, DATE_OF_START, DATE_OF_END) VALUES (34567,900,'28-06-2015','28-09-2015')
    INTO date_of_inv (PROJECT, ARCHITECT, DATE_OF_START, DATE_OF_END) VALUES (45678,894,'01-08-2006','15-06-2007')
    INTO date_of_inv (PROJECT, ARCHITECT, DATE_OF_START, DATE_OF_END) VALUES (56789,900,'01-12-2019','28-11-2020')
    INTO date_of_inv (PROJECT, ARCHITECT, DATE_OF_START, DATE_OF_END) VALUES (67890,269,'19-05-2015','18-01-2019')
SELECT 1 from dual;

INSERT ALL
    INTO construction (CONS_ID, DATE_OF_START, DATE_OF_COMPLETION, PROJECT_MANAGER, PROJECT) VALUES (12,'27-10-2005','27-02-2006',894,12345)
    INTO construction (CONS_ID, DATE_OF_START, DATE_OF_COMPLETION, PROJECT_MANAGER, PROJECT) VALUES (22,'01-01-2003','15-04-2003',269,23456)
    INTO construction (CONS_ID, DATE_OF_START, DATE_OF_COMPLETION, PROJECT_MANAGER, PROJECT) VALUES (32,'27-07-2005','28-09-2015',900,34567)
    INTO construction (CONS_ID, DATE_OF_START, DATE_OF_COMPLETION, PROJECT_MANAGER, PROJECT) VALUES (42,'20-01-2007','15-06-2007',894,45678)
    INTO construction (CONS_ID, DATE_OF_START, DATE_OF_COMPLETION, PROJECT_MANAGER, PROJECT) VALUES (52,'15-12-2009','28-11-2020',900,56789)
    INTO construction (CONS_ID, DATE_OF_START, DATE_OF_COMPLETION, PROJECT_MANAGER, PROJECT) VALUES (62,'05-05-2017','18-01-2019',269,67890)
SELECT 1 from dual;

INSERT ALL
    INTO worker_construction (PESEL_NO, CONSTRUCTION_ID) values (567,12)
    INTO worker_construction (PESEL_NO, CONSTRUCTION_ID) values (678,22)
    INTO worker_construction (PESEL_NO, CONSTRUCTION_ID) values (278,62)
SELECT 1 FROM dual;
