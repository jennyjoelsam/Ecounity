# EcoUnity

A web platform for community-driven environmental initiatives. This project is a Spring Boot application built with Java 17 and Maven. It serves as a platform for organizing and managing community-based environmental projects.

## Table of Contents

* [Technology Stack](#technology-stack)
* [Prerequisites](#prerequisites)
* [Getting Started](#getting-started)
* [Database Configuration](#database-configuration)
* [Running the Application](#running-the-application)
* [Running Tests](#running-tests)
* [Building the Project](#building-the-project)
* [License](#license)

## Technology Stack

This project is built using the following technologies:

* **Core:** Java 17
* **Framework:** Spring Boot 3.4.2
* **Web:** Spring Web


2. Database Configuration
You must configure the application to connect to your local PostgreSQL database.

Create a database in PostgreSQL (e.g., ecounity_db).

Open the src/main/resources/application.properties file.

Add your database connection details:

3. Running the Application
This project includes the Maven Wrapper, so you do not need to have Maven installed on your system.

On Windows:

The application will start, and you can access it at http://localhost:8080.

Running Tests
The project is configured to use Testcontainers for integration tests. This will automatically start a PostgreSQL Docker container for testing purposes.

Note: Ensure Docker is running before executing tests.

On Windows:

Building the Project
To build the project and create an executable .jar file, run:

The final .jar file will be located in the /target directory.

License
This project is licensed under the MIT License - see the file for details.

