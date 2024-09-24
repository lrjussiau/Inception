
# Inception - Docker and System Administration Project

## Description

*Inception* is a project from 42 school that introduces Docker and system administration concepts. The goal is to set up a multi-service environment using Docker containers and Docker Compose, simulating a real-world web application infrastructure. This project focuses on understanding containerization, networking, service orchestration, and deploying applications using Docker.

## Project Objectives

- Learn how to use Docker to containerize applications.
- Understand and configure networking between containers.
- Use Docker Compose to orchestrate multiple services.
- Set up a complete web infrastructure including a web server, database, and more.
- Explore system administration and deployment concepts.

## Features

1. **Docker Containers**
   - Each service runs inside its own isolated Docker container.
   - Services include a web server (Nginx), a database (MariaDB), and a PHP application (WordPress).
   
2. **Docker Compose**
   - Manage and orchestrate multiple containers using Docker Compose.
   - Automatically configure networking between containers for communication.

3. **Volumes and Persistence**
   - Use Docker volumes to ensure data persistence for services like databases.

4. **Service Configuration**
   - Configure Nginx as a reverse proxy and web server.
   - Set up MariaDB as the database for the WordPress application.
   - Configure WordPress to run inside its own container and connect to the database.

5. **SSL Encryption**
   - Use Let's Encrypt to enable SSL for secure communication between the web server and users.

## Setup Overview

You will set up the following services:

1. **Nginx**: Acts as a reverse proxy and web server, handling HTTP/HTTPS requests.
2. **MariaDB**: A MySQL-compatible database to store data for the WordPress site.
3. **WordPress**: A popular PHP-based content management system (CMS).
4. **PHP-FPM**: A FastCGI process manager to handle PHP requests.

## System Calls and Tools

Key tools and commands used in the project include:

- `docker`: Manage individual containers.
- `docker-compose`: Manage multi-container Docker applications.
- `nginx`: Configure and manage the Nginx web server.
- `mariadb`: Set up the MariaDB database.
- `php-fpm`: Run PHP applications efficiently.

## Installation

To get started with the *Inception* project, you need to install Docker and Docker Compose. You can install Docker by following the official documentation:

```bash
sudo apt update
sudo apt install docker.io
sudo apt install docker-compose
```

Once Docker and Docker Compose are installed, clone the repository and run Docker Compose to set up the environment:

```bash
git clone https://github.com/your-repo/inception.git
cd inception
docker-compose up --build
```

## Usage

After running \`docker-compose up\`, the services will start. You can access the WordPress application through a web browser:

```bash
https://localhost
```

You will also be able to interact with the database and manage the application from the WordPress admin panel.

## Configuration

- **Nginx**: The \`nginx.conf\` file defines the web server configuration, including the reverse proxy settings and SSL.
- **MariaDB**: The \`docker-compose.yml\` file specifies the environment variables and volumes for the database.
- **WordPress**: WordPress is pre-configured to connect to the MariaDB container using environment variables in the \`docker-compose.yml\`.

## SSL and Security

- SSL is enabled using Let's Encrypt, providing encryption for your web traffic.
- Ensure the SSL certificate is set up properly to secure communication between the server and clients.

## Error Handling

The project should handle:

- Failure to start services (check Docker logs for troubleshooting).
- Misconfigured containers (verify configurations in \`docker-compose.yml\`).
- Ensure that the services are running and communicating correctly.

## Testing

To test the setup, verify that:

1. You can access the WordPress site through HTTPS.
2. The WordPress site connects to the MariaDB database successfully.
3. The Nginx server handles both HTTP and HTTPS requests properly.

You can stop and remove containers using:

```bash
docker-compose down
```

## Author

- **Louis** - 42 Lausanne Student
