--find clients whose names length is 6 and display their project description and budget
SELECT h.name ||' '|| h.SURNAME AS Person,p.description , p.budget
FROM human h JOIN client c ON h.Pesel_no = c.Pesel_no
JOIN project p ON p.client_pesel_no = c.pesel_no
WHERE h.name LIKE '______';


--display the architects whose salary is more than 8000
SELECT h.name ||' '|| h.SURNAME AS Person,e.salary
FROM human h JOIN employee e ON h.pesel_no=e.pesel_no
JOIN architect a ON e.pesel_no=a.pesel_no
WHERE salary > 8000;


--calculate the average project duration for each project manager
SELECT e.Pesel_no, h.name || ' ' || h.surname AS Person, ROUND(AVG(MONTHS_BETWEEN( d.date_of_end,d.date_of_start))) AS average_duration
FROM employee e
    JOIN Human h ON e.Pesel_no = h.Pesel_no
    JOIN construction c ON e.Pesel_no = c.project_manager
    JOIN project p ON c.project = p.project_ID
    JOIN date_of_inv d ON p.project_ID = d.project
GROUP BY e.Pesel_no, h.name, h.surname;


--find how many project an architect assigned and how much floor space they designed in total
SELECT h.name || ' ' || h.surname AS Person ,COUNT(DISTINCT p.project_ID) AS total_projects, SUM(bt.floor_space) AS total_floor_space
FROM Human h
    JOIN architect a ON h.Pesel_no = a.Pesel_no
    JOIN construction c ON a.Pesel_no = c.project_manager
    JOIN project p ON c.project = p.project_ID
    JOIN building_type bt ON p.building_id = bt.type_id
GROUP BY h.name,h.surname
ORDER BY total_projects DESC, total_floor_space DESC;


-- display employee information for project managers associated with high-budget projects and engineers associated with projects located in the city of 'Manhattan'
SELECT e.Pesel_no,h.name || ' ' || h.surname AS Person, e.date_of_birth, e.date_of_employment, e.date_of_dismissal, e.salary
FROM employee e JOIN Human h ON e.Pesel_no = h.Pesel_no
WHERE e.Pesel_no IN (
    SELECT DISTINCT project_manager
    FROM construction
    WHERE project IN (
      SELECT project_ID
      FROM project
      WHERE budget > 60000
    )
)
UNION
SELECT e.Pesel_no,h.name || ' ' || h.surname AS Person, e.date_of_birth, e.date_of_employment,e.date_of_dismissal,e.salary
FROM employee e JOIN Human h ON e.Pesel_no = h.Pesel_no
WHERE e.Pesel_no IN (
         SELECT DISTINCT Pesel_no
         FROM engineer_project
         WHERE project_ID IN (
                SELECT project_ID
                FROM project
                WHERE location_id IN (
                    SELECT location_id
                    FROM location
                    WHERE city IN (
                        SELECT city_id
                        FROM city
                        WHERE name = 'Manhattan'
                        )
                 )
         )
) AND e.date_of_dismissal IS NULL
ORDER BY Person ASC, Pesel_no DESC;


--display the project information in detail
SELECT p.project_ID, h.name || ' ' || h.surname AS Person,p.description,p.budget,(SELECT COUNT(*) FROM date_of_inv d WHERE d.project = p.project_ID) AS num_of_architects,
    (SELECT COUNT(*)
     FROM construction c
     WHERE c.project = p.project_ID AND c.date_of_completion IS NOT NULL) AS num_of_completed_constructions,
    (SELECT COUNT(*)
     FROM construction c
     WHERE c.project = p.project_ID AND c.date_of_completion IS NULL) AS num_of_incomplete_constructions
FROM project p JOIN client c ON p.client_pesel_no = c.pesel_no
JOIN human h ON c.pesel_no=h.pesel_no
ORDER BY p.project_ID;








