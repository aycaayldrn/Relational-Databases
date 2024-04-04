
-- This procedure is designed to enhance employee compensation based on project complexity,
-- providing financial incentives for those on smaller teams. By considering the number of
-- architects and engineers, it ensures a fair working environment. This is a standard that
-- any company likely is to provide.

CREATE OR REPLACE PROCEDURE num_of_emp_project_raise (projectId NUMBER)
AS
    architect_count NUMBER;
    engineer_count NUMBER;
    total_emp NUMBER;
BEGIN
    SELECT COUNT(*) INTO engineer_count
    FROM ENGINEER_PROJECT
    WHERE PROJECT_ID = projectId;

    SELECT COUNT(*) INTO architect_count
    FROM DATE_OF_INV
    WHERE project = projectId;

    total_emp := architect_count + engineer_count;

    DBMS_OUTPUT.PUT_LINE('Project ID: ' || projectId);
    DBMS_OUTPUT.PUT_LINE('Number of Architects: ' || architect_count);
    DBMS_OUTPUT.PUT_LINE('Number of Engineers: ' || engineer_count);
    DBMS_OUTPUT.PUT_LINE('Total Employees: ' || total_emp);

    IF total_emp < 3 THEN
        UPDATE EMPLOYEE
        SET salary = salary * 1.1
        WHERE PESEL_NO IN (
            SELECT pesel_no
            FROM engineer_project
            WHERE project_id = projectId
            UNION
            SELECT architect
            FROM date_of_inv
            WHERE project = projectId
        );
        DBMS_OUTPUT.PUT_LINE('Total employees less than 3. Applying a raise of 10%.');
    end if;

end;

--INSTRUCTIONS
-- 1.Data Analysis/SELECT statements
-- The procedure involves two distinct SELECT statements (engineer_count and architect_count)
-- to gather valuable information about the number of engineers and architects associated with
-- a specific project.

-- 2.Calculation/ total_emp
-- The calculated variable total_emp demonstrates the procedure's capability to perform
-- computations based on the retrieved data.

--3.Conditional Logic/IF
-- The IF statement introduces conditional logic. This logic assesses whether the total number of
-- employees on a project is less than 3.

-- 4.Conditional Update Operation/UPDATE
-- The UPDATE statement inside the IF block demonstrates the ability of the procedure to
-- dynamically respond to project conditions. It applies a salary raise to employees
-- associated with the project when the total count is less than 3.

--to check the procedure
SELECT * FROM EMPLOYEE;
SELECT * FROM PROJECT;
CALL num_of_emp_project_raise(12345);


-- This procedure filters employees based on their date of employment ensures that only
-- individuals employed before the year 2013 are considered for salary adjustments.Also, it
-- allows us to make job type-specific raises , allows us to have detailed approach to
-- compensation.
CREATE OR REPLACE PROCEDURE salary_check_in_time
AS
    v_pesel_no    NUMBER;
    v_date_of_employment DATE;
    v_salary   NUMBER;
    v_raise_percent NUMBER;

    CURSOR employee_cursor IS
        SELECT pesel_no, date_of_employment, salary
        FROM employee
        WHERE date_of_dismissal IS NULL
          AND EXTRACT(YEAR FROM date_of_employment) < 2013;

BEGIN
    OPEN employee_cursor;

    LOOP
        FETCH employee_cursor INTO v_pesel_no, v_date_of_employment, v_salary;
        EXIT WHEN employee_cursor%NOTFOUND;

        DECLARE
            v_is_worker    NUMBER;
            v_is_architect NUMBER;
            v_is_engineer  NUMBER;
        BEGIN
            SELECT COUNT(*) INTO v_is_worker
            FROM worker
            WHERE pesel_no = v_pesel_no;

            SELECT COUNT(*) INTO v_is_architect
            FROM architect
            WHERE pesel_no = v_pesel_no;

            SELECT COUNT(*) INTO v_is_engineer
            FROM engineer
            WHERE pesel_no = v_pesel_no;

        IF v_is_worker > 0 THEN
            v_raise_percent := 0.05;
        ELSIF v_is_architect > 0 THEN
            v_raise_percent := 0.02;
        ELSIF v_is_engineer > 0 THEN
            v_raise_percent := 0.05;
        ELSE
            v_raise_percent := 0;
        END IF;
        END;

        IF v_raise_percent > 0 THEN
            UPDATE employee
            SET salary = salary * (1 + v_raise_percent)
            WHERE pesel_no = v_pesel_no;

            DBMS_OUTPUT.PUT_LINE('Updated salary for PESEL_NO ' || v_pesel_no || ' by ' || TO_CHAR(v_raise_percent * 100) || '%');
        END IF;
    END LOOP;

    CLOSE employee_cursor;
END;
/

--INSTRUCTIONS
-- 1.Cursor
-- employee_cursor is declared to select relevant employee information, including their
-- PESEL number, date of employment, and salary. The cursor filters employees with no dismissal
-- date (date_of_dismissal IS NULL) and those employed before the year 2013
-- (EXTRACT(YEAR FROM date_of_employment) < 2013).

-- 2.Fetching and Processing Employees/ LOOP, FETCH
-- A loop is initiated to fetch each employee's details from the cursor.Inside the loop, the
-- PESEL number, date of employment, and salary are retrieved into corresponding variables
-- (v_pesel_no, v_date_of_employment, v_salary).

-- 3.Nested Block /IF-ELSE
-- A nested block is declared to check the job type of the employee (worker, architect, or
-- engineer) based on the counts in the respective tables.

-- 4.Salary Update / UPDATE,SET
-- If the raise percentage is greater than 0, the employee's salary is updated using the
-- formula salary * (1 + v_raise_percent)

-- to check the procedure
SELECT * FROM EMPLOYEE;
CALL SALARY_CHECK_IN_TIME();



-- The trigger is designed to automatically update the budget of a project when an engineer
-- is assigned to it. It checks whether the engineer is already assigned to the project before
-- proceeding with the update to avoid duplicate assignments, ensuring data integrity. Updating
-- budget is vital for those kind of construction projects.
CREATE OR REPLACE TRIGGER budget_update
AFTER INSERT ON ENGINEER_PROJECT
FOR EACH ROW
DECLARE
    v_engineer_salary NUMBER;
    is_already_assigned NUMBER;
BEGIN

    SELECT COUNT(*) INTO is_already_assigned
    FROM ENGINEER_PROJECT
    WHERE PESEL_NO = :NEW.pesel_no AND PROJECT_ID = :NEW.project_id;

    IF is_already_assigned = 0 THEN
    SELECT salary INTO v_engineer_salary
    FROM employee
    WHERE pesel_no = :NEW.pesel_no;

    UPDATE project
    SET budget = budget + v_engineer_salary
    WHERE project_id = :NEW.project_id;

    ELSE
        DBMS_OUTPUT.PUT_LINE('Engineer with PESEL_NO ' || :NEW.pesel_no || ' is already assigned to Project ID ' || :NEW.project_id);
    END IF;
END;
/

-- INSTRUCTION
-- 1.Check existing assignment / SELECT COUNT(*)
-- Utilize a SELECT COUNT(*) statement to determine if the engineer (:NEW.pesel_no) is already
-- assigned to the project (:NEW.project_id).

-- 2.Conditional Update / IF
-- IF statement is to check if is_already_assigned is equal to 0, indicating that the engineer is
-- not already assigned to the project. If the condition is met, proceed with the following steps.
-- Fetch the salary of the engineer from the employee table using SELECT salary INTO v_engineer_salary.

-- 3.Update Project Budget / UPDATE
-- UPDATE statement is to increase the project's budget by the engineer's salary.The update is
-- specified to the project identified by :NEW.project_id

-- 4.Handling Duplicate Assignment / DBMS_OUTPUT.PUT_LINE
-- Prints message using DBMS_OUTPUT.PUT_LINE indicating that the engineer is already assigned
-- to the project.

-- to check the trigger
SELECT BUDGET FROM PROJECT WHERE PROJECT_ID=12345;
INSERT INTO ENGINEER_PROJECT(project_id, pesel_no)
VALUES (12345,368);



-- This trigger is implemented to automatically assign a newly started worker to a construction
-- project randomly.This random assignment is intended to achieve a dynamic workflow and fast workload
-- distribution
CREATE OR REPLACE TRIGGER random_assignment_trigger
AFTER INSERT ON worker
FOR EACH ROW
DECLARE
    random_construction_id NUMBER;
    total_workers_in_project NUMBER;
BEGIN
    SELECT cons_id INTO random_construction_id
    FROM construction
    ORDER BY DBMS_RANDOM.VALUE
    FETCH FIRST 1 ROWS ONLY;

    INSERT INTO WORKER_CONSTRUCTION (pesel_no, construction_id)
    VALUES (:NEW.pesel_no, random_construction_id);

    SELECT COUNT(*) INTO total_workers_in_project
    FROM WORKER_CONSTRUCTION
    WHERE construction_id = random_construction_id;

    DBMS_OUTPUT.PUT_LINE('The number of workers in ' || random_construction_id || ' numbered constraction:  ' || total_workers_in_project);

END;
/

--INSTRUCTIONS
-- 1.Select a construction project randomly
-- SELECT statement retrieves a random construction ID (random_construction_id) from the
-- construction table.The DBMS_RANDOM.VALUE function ensures a random order of construction IDs,
-- and FETCH FIRST 1 ROWS ONLY retrieves only the top row.

-- 2.Insert into worker_construction table
-- Insert the newly added worker (:NEW.pesel_no) into the WORKER_CONSTRUCTION table, associating
-- them with the randomly chosen construction project.

-- 3.Count total workers in choosen construction
-- Count the total number of workers assigned to the selected construction project.

-- 4. Output the result
-- DBMS_OUTPUT.PUT_LINE is to display the number of workers in the selected construction project.


--to check the trigger
SELECT * FROM WORKER;

INSERT INTO HUMAN (PESEL_NO, NAME, SURNAME) VALUES (555,'Ryan','Gosling');
INSERT INTO EMPLOYEE(pesel_no, date_of_birth, date_of_employment, date_of_dismissal, salary)
VALUES (555,'12-11-1980','12-05-2001',null,8000);
INSERT INTO WORKER (PESEL_NO) VALUES (555);
COMMIT;

