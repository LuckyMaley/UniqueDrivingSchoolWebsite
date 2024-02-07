# Unique Driving School Website

This is the Website based on the Front-End System used by Customers, Admins, and Managers to book and manage bookings of driving lessons. The system is built on the Asp .net C# programming language.

**Business processing**	

The business processing of the website is aligned with that of the front-end system, as all the information that it uses is from a central database that is also used by the front-end system. The website reflects the Front-end system in some sense.



**Usability**	

The interface was made in such a way that the most important tasks that the user (Customer, Instructor, Admin) may want to perform are easy to access, understand, and use.  A help sub-system was successfully integrated. The user interface was made to conform to most of user interface design standards set by other large companies therefore the system almost behave like any other system which makes it easy to predict.


**Security**	

When it comes to security we successfully implemented it. There are 3 ways to register as either a customer with an id, a customer without id or an instructor. Each user that logs in whether a customer, instructor, or admin are directed to their account settings. No one else can access a particular account except the user themselves.


**Business Intelligence Reports**
	
The website implemented some of the reports which include a mixture of power bi dashboards and crystal reports.

# Guidelines

![Static Badge](https://img.shields.io/badge/Visual%20Studio-2010%20or%20later-green) ![Static Badge](https://img.shields.io/badge/.Net%20Framework-4.5.2-blue)

# Project Structure

- This project is separated into 3 sub-systems:
  - Unique Driving School Management System ([click here to visit](/../../../UniqueDrivingSchoolManagementSystem))
  - Unique Driving School Reporting System ([click here to visit](/../../../UniqueDrivingSchoolReportingSystem))
  - Unique Driving School Website ([Current project](/))
- A User Story System was built for the aforementioned subsystems to keep track of the progress of the user stories and test cases during development  ([click here to visit](/../../../UserStoryApp)).

# Config

- Clone the project
- To open the project solution just double click on [UniqueDrivingSchoolWebsite.sln](/UniqueDrivingSchoolWebsite.sln) 

- (re)build application
> (re)building the application will install the required ASP.NET packages from NuGet
![Screenshot (4085)](https://github.com/LuckyMaley/UniqueDrivingSchoolReportingSystem/assets/58641501/302508b0-9f80-43d2-9d7e-454cc445c11f)


- Database Setup
> **NOTE:** If you want to change the connection string to a live or production-ready database just go to the [Web.config](/UniqueDrivingSchoolWebsite/Web.config) file and change the existing one to your database. Example of connection string below:

 ```<add name="UniqueDrivingSchoolManagementSystem.My.MySettings.ist3bbConnectionString" connectionString="Data Source= DatabaseServerName; Integrated Security=true;Initial Catalog=UniqueDrivingSchoolDB; uid=YourUserName; Password=yourpassword; " providerName="System.Data.SqlClient" />``` 
 
 > **NOTE:** You need to also right-click the project name on the solution explorer > click properties > then go to settings, and when a pop-up message appears, click "yes" to confirm the changed connection string.

- A SQL query with the relevant database tables has already been created, you need to initialize it (**NOTE:** If you have already executed these SQL queries for the Unique Driving School Management System then you don't need to run them again as this system uses the same database). There are two SQL queries
  - The first one creates a database. [Click here](/UniqueDrivingSchoolManagementSystem/SQLQueryCreateUniqueDrivingSchoolDB.sql) to go to the file called SQLQueryCreateUniqueDrivingSchoolDB.sql.
  - The second uses the database you created in the previous point to initialize the database tables. [Click here](/UniqueDrivingSchoolManagementSystem/SQLQueryUniqueDrivingSchoolDB.sql) to go to the file called SQLQueryUniqueDrivingSchoolDB.sql.

> **NOTE:** You need to ensure that the initial catalog in your connection string is the same as the database where these db tables are created or located.

- You can now run and test the system.

# Noticable improvements for future work

- The system can be updated to use an API for database interactivity so users created on this system can also be accessible on the website.
- The PowerBI reports can be implemented better using an API with javascript that does not rely on a plugin.
- The user interface could be improved to be more intuitive and user-friendly


# Screenshots

![sign-up](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/3c0d8f48-e648-46c9-8155-c6d5c70d521b)

![Login](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/05b36436-d63a-485b-8031-1d709ca504c3)

![AddToCart](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/002ceeb7-3c36-48d4-a8b4-dce1f9e70867)

![AccessToCart](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/613013aa-9352-4d85-af93-6d851f7a1000)

![CustomerSchule](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/e97e1c78-f428-4282-89e3-6862fba6162d)

![printTimetable](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/90ba8c91-2098-4549-ad3d-0c32b6677f59)

![EditCustomerAccount](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/a4809e4b-3626-48f4-9863-6784b4919be2)

![InstrDash](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/dc8782a8-63e1-4262-b889-1c07ace60c85)

![InstrTimetable](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/32064460-60d7-4b29-9a7f-2ec3ef86ef03)

![EditInstrDetails](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/40c58814-5b1b-4507-9a3c-83373f6fe38a)

![addPrice](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/4c7c782b-ce58-4017-8dc1-f668c3c5b9f2)

![DeletPackage](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/b0dfe111-0a37-4c08-91a7-161d9514f365)

![PriceUdate](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/8d91a0cf-426d-45c2-b584-495fd6bfec86)

![ManagerSchedules](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/22a3d070-f733-4eb0-92b0-9f4584712dfc)

![ManagerReports](https://github.com/LuckyMaley/UniqueDrivingSchoolWebsite/assets/58641501/a12a6156-7140-4f33-b18a-963c7eb08f33)

**([click here ](/../../../UniqueDrivingSchoolManagementSystem)) to visit a related project**




