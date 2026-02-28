# Global Health Assistance Services

This repository contains various global health assistance services and applications, managed and deployed using modern containerization and orchestration tools.

## Components

### 1. Sexual Health Platform (`/sexual-health-platform`)
A static frontend application providing resources and information regarding sexual health.
- **Technology**: HTML, Nginx.
- **Deployment**: Deployed via Waypoint and Nomad.
- **URL**: `https://sexual-health.asipsante.fr` (default).

### 2. Squash TM Application (`/squashtm-app`)
The application server for Squash TM, a professional open-source tool for test management.
- **Technology**: Java (Docker image `squashtest/squash-tm`).
- **Configuration**: Uses various plugins (Jira Cloud, LDAP, API REST Admin) and connects to a PostgreSQL database.
- **Deployment**: Nomad service with Waypoint integration.

### 3. Squash TM Database (`/squashtm-db`)
The database backend for the Squash TM application.
- **Technology**: PostgreSQL 13.5.
- **Deployment**: Managed via Nomad with persistent storage (Portworx/pxd).

## Infrastructure and Deployment

The project uses the following tools for CI/CD and orchestration:
- **Docker**: For containerizing the applications.
- **Waypoint**: For managing the build and deploy lifecycle.
- **Nomad**: As the workload orchestrator for running the containers.
- **Vault**: For secret management (database credentials, licenses, etc.).

## Project Structure

- `sexual-health-platform/`: Contains the frontend code, Dockerfile, and deployment templates.
- `squashtm-app/`: Contains Waypoint and Nomad configurations for the Squash TM application.
- `squashtm-db/`: Contains Waypoint and Nomad configurations for the PostgreSQL database.
- `squash_backup.sh`: A script for backing up the Squash database.
