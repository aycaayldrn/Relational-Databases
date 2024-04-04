-- This procedure is designed to generate a project report based on a given Project ID.
-- The report includes essential information such as the project name, architect name,
-- and lead engineer. The procedure utilizes various joins to gather information from
-- multiple tables, providing a comprehensive view of the project details.
CREATE PROCEDURE GenerateProjectReport
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ProjectName VARCHAR(100), @ArchitectName VARCHAR(60), @EngineerName VARCHAR(60);

    SELECT
        @ProjectName = p.description,
        @ArchitectName = ISNULL(h.name + ' ' + h.surname, 'N/A')
    FROM
        project p
    INNER JOIN
        engineer_project ep ON p.project_ID = ep.project_ID
    LEFT JOIN
        date_of_inv doi ON p.project_ID = doi.project
    LEFT JOIN
        architect a ON doi.architect = a.Pesel_no
    LEFT JOIN
        employee e ON a.Pesel_no = e.Pesel_no
    LEFT JOIN
        Human h ON e.Pesel_no = h.Pesel_no
    WHERE
        p.project_ID = @ProjectID;

    PRINT 'Project Report for Project ID: ' + CAST(@ProjectID AS VARCHAR(10));
    PRINT 'Project Name: ' + @ProjectName;
    PRINT 'Architect: ' + @ArchitectName;

    IF @ProjectID IS NOT NULL
    BEGIN
        SELECT TOP 1 @EngineerName = h.name + ' ' + h.surname
        FROM
            engineer_project ep
        INNER JOIN
            engineer e ON ep.Pesel_no = e.Pesel_no
        INNER JOIN
            Human h ON e.Pesel_no = h.Pesel_no
        WHERE
            ep.project_ID = @ProjectID
        ORDER BY
            NEWID();

        IF @EngineerName IS NOT NULL
        BEGIN
            PRINT 'Lead Engineer: ' + @EngineerName;
        END
        ELSE
        BEGIN
            PRINT 'No lead engineer assigned to the project.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Invalid Project ID.';
    END
END;

--INSTRUCTION
-- 1.Report retrieval/SELECT, INNER JOIN, LEFT JOIN, WHERE
-- Usage of a SELECT statement to retrieve project details including the project name and
-- architect name from the project table and associated joins.

-- 2.Print project information / PRINT
-- prints the basic project information using the retrieved data, including the
-- project ID, name, and architect name.

-- 3.Retrieve and print lead engineer / SELECT, INNER JOIN, ORDER BY, WHERE
-- Usage of a nested SELECT statement to retrieve a lead engineer's name randomly from the
-- engineer_project table and associated joins, and print the lead engineer's name if
-- available.

--to check the procedure
EXEC GenerateProjectReport @ProjectID = 23456;

-- This trigger provides a convenient and automated way to handle the assignment of Ted
-- Mosby as the architect for new projects, reducing the need for manual intervention.
-- Automation helps maintain organizational standards by ensuring that each project is
-- assigned an architect in a standardized manner. This consistency contributes to the
-- overall quality and coherence of the projects.
CREATE TRIGGER AssignTedMosbyArchitect
ON project
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ProjectID INT;
    DECLARE @ArchitectID INT;

    SELECT TOP 1 @ProjectID = project_ID
    FROM inserted;

    SELECT TOP 1 @ArchitectID = a.Pesel_no
    FROM architect a
    INNER JOIN employee e ON a.Pesel_no = e.Pesel_no
    WHERE a.Pesel_no = 894;

    INSERT INTO date_of_inv (project, architect, date_of_start)
    VALUES (@ProjectID, @ArchitectID, GETDATE());
END;

--INSTRUCTION
-- 1. Project assignment / SELECT, INSERTED
-- SELECT statement to retrieve the newly inserted project ID from the inserted pseudo
-- table.This ensures that the trigger captures the project ID of the newly inserted project.

-- 2.Retrieve pesel no and Select the architect / SELECT, INNER JOIN, WHERE
-- Another SELECT statement to retrieve the Pesel_no of the architect named Ted Mosby.This
-- identifies Ted Mosby's Pesel_no to assign him as the architect for the new project.

-- 3.Insert record / INSERT INTO
-- Insert a record into the date_of_inv table, associating the newly inserted project with
-- Ted Mosby as the architect and setting the date of start to the current date.This creates
-- a relationship between the new project and Ted Mosby as the architect in the date_of_inv table, marking the start date as the current date.

INSERT INTO project (project_ID, budget, description, client_Pesel_no, location_id, building_id)
VALUES (111111,50600,'tiny house',688,288776,2);

select * from date_of_inv;






