# Project: Monitoring with Prometheus and Grafana

## Description
Monitoring provides visibility into application health. This project uses Docker Compose to spin up Prometheus (for metrics collection) and Grafana (for visualization).

## Objectives
- Configure Prometheus to scrape metrics from itself.
- Launch Prometheus and Grafana using Docker Compose.
- Connect Grafana to Prometheus as a data source.
- Create a simple dashboard.

## Prerequisites
- Docker and Docker Compose installed

## How to Run
1. Navigate to the `solution` folder.
2. Run `docker-compose up -d`.
3. Access Prometheus at `http://localhost:9090`.
4. Access Grafana at `http://localhost:3000` (Default login: admin/admin).
