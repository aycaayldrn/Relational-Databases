# Relational-Databases
This repository contains my final project for the relational databases course, written in Oracle and Microsoft SQL Server databases.

Here are the requirements of my database.

An architecture company consists of three subject areas:
•	Clients & Employees
•	Project
•	Construction

We need to store information about workers in the office such as architects, civil engineers, building workers, clients, and projects that they are working on. For workers, we need to store basic information such as their PESEL number, name, surname, age, date of employment, date of dismissal (if the worker is no longer employed), and salary. For clients, PESEL number, name, and surname.

An architecture office can contain multiple architects. Every architect can be assigned one and only one project. 
Many civil engineers can be assigned to a project. However, a civil engineer can be assigned to only one project. Many building workers can work on one construction. One building worker can be assigned only one construction.
About the project, we need to know the project ID number, location, building type, budget, date of start, date of end, and description. We should handle the information of location and building type separately. The location should contain information like country, city, postal code, and cardinal direction that the building will have. Building type should state the purpose of the building (working, shopping, living, teaching), number of bedrooms, number of bathrooms, floor space, number of parking spaces, and balconies.

To get to the construction process, we need to store information about construction, construction machinery, and building materials. For construction, we need to store information of the construction ID, date of start, date of completion. About construction machinery, type, machine model, serial no, fuel consumption. For building materials, name, serial no, and amount of used material. Many construction machinery can be used in many constructions. Many building materials can be used in many constructions. One architect can lead one construction.

Functionalities:
1-Which projects is a specific architect or civil engineer currently assigned to?
2-Which constructions have used a specific building material?
3-What is the total budget and cost breakdown for all ongoing projects?
4-Can we generate a report on the projects associated with each client?
5-Can we assess the performance of each worker based on their involvement in completed projects?

I have additionally implemented T-SQL and PL/SQL to generate actions that an architecture office may need. 
