# Kenya Geographical API (sehemu za nchi)

## Overview

This project provides a RESTful API for accessing geographical data about Kenya, including regions, counties, and sub-counties. The API is built with Flask and uses a MySQL database to store the geographical information. It's designed to be easily deployable using Docker and Docker Compose.

## Features

* **Regions API:** Retrieve a list of all regions in Kenya.
* **Counties API:** Retrieve a list of all counties, with an option to filter by region.
* **Sub-counties API:** Retrieve a list of all sub-counties, with options to filter by county or region.
* **Dockerized Deployment:** Easy setup and deployment using Docker and Docker Compose.
* **Pre-populated Database:** The MySQL database is automatically initialized with geographical data from provided SQL dumps on first run.

## Technologies Used

* **Backend:** Python 3.9 (Flask)
* **Database:** MySQL 8.0
* **Containerization:** Docker, Docker Compose
* **Database Driver:** PyMySQL
* **ORM:** Flask-SQLAlchemy

## Getting Started

Follow these steps to get your local development environment up and running.

### Prerequisites

* **Docker Desktop:** Ensure Docker Desktop is installed and running on your system.
    * [Download Docker Desktop](https://www.docker.com/products/docker-desktop/)
* **Git:** Make sure Git is installed.
    * [Download Git](https://git-scm.com/downloads)

### 1. Clone the Repository

First, clone this repository to your local machine:

```bash
git clone [https://github.com/davismaghanga/sehemu-za-nchi.git](https://github.com/davismaghanga/sehemu-za-nchi.git)
cd sehemu-za-nchi

```
### 2. Configure Environment Variables
Create a .env file in the root of your project directory. This file will hold your database credentials.

# .env file content
MYSQL_ROOT_PASSWORD=your_mysql_root_password
DB_USER=your_db_user
DB_PASSWORD=your_db_password
DB_NAME=kenya_geography
DB_HOST=db # 'db' is the service name defined in docker-compose.yml


### 3. Navigate to the project's root directory in your terminal and run Docker Compose:
``` bash
docker compose up --build -d
```

API Endpoints
Once the containers are up and running, the Flask API will be accessible on http://localhost:5000.

Root Endpoint:

GET /

Description: Returns a welcome message.

Example Response: {"message": "Welcome to the Kenya Geographical API!"}

Regions:

GET /api/regions

Description: Retrieves a list of all regions.

Counties:

GET /api/counties

Description: Retrieves a list of all counties.

GET /api/counties?region_id=<ID>

Description: Retrieves counties filtered by a specific region_id.

Sub-Counties:

GET /api/sub_counties

Description: Retrieves a list of all sub-counties.

GET /api/sub_counties?county_id=<ID>

Description: Retrieves sub-counties filtered by a specific county_id.

GET /api/sub_counties?region_id=<ID>

Description: Retrieves sub-counties filtered by a specific region_id.


