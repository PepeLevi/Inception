# Inception

Welcome to **Inception**, a project from 42 School that involves setting up a multi-service environment using Docker Compose. The goal is to orchestrate several services, including WordPress and MariaDB, using Docker containers, and manage them with `docker-compose`.

## Project Overview

Inception aims to provide a solid understanding of virtualization and containerization. By the end of the project, you'll have:

- Deployed a multi-service architecture using Docker.
- Managed Docker containers with `docker-compose`.
- Configured persistent storage for your containers.

### Services Included

- **WordPress**
- **MariaDB**
- **NGINX**

### Directory Structure

This project uses the following directory structure:

- **srcs/**: Contains the `docker-compose.yml` file and configurations for your Docker containers.
- **home/debian/data/**: This is where the persistent data for WordPress and MariaDB will be stored.

### Makefile Commands

The `Makefile` provided in this project simplifies the management of Docker containers. Below are the commands you can use:

#### Start the Services

To create and start the Docker containers for WordPress and MariaDB:

```bash
make up
```

This command will:

- Create the necessary directories for persistent storage (`home/debian/data/wordpress` and `home/debian/data/mariadb`).
- Start the containers in detached mode using `docker-compose`.

#### Stop the Services

To stop the running containers without removing them:

```bash
make stop
```

#### Start the Services Again

If the containers have been stopped but not removed, you can start them again with:

```bash
make start
```

#### View Running Containers

To see the status of your containers:

```bash
make ps
```

This command will run `docker ps`, showing you all active containers.

#### Take Down the Services

To stop and remove the containers:

```bash
make down
```

This will shut down and remove the containers but leave the persistent data intact.

#### Clean Up

To completely remove all containers, volumes, and the persistent data:

```bash
make clean
```

This command will:

- Stop and remove the containers.
- Prune all unused Docker data.
- Remove the persistent storage directories (`home/debian/data`).

### Changing Data Storage Path

The data storage paths for WordPress and MariaDB are set in the `Makefile` under the `DATA_PATH` variable. You can change this path by modifying the `Makefile`:

```bash
DATA_PATH = /your/custom/path
```
