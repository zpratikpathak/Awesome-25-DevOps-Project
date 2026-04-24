# Project: Centralized Logging with ELK Stack

## Description
Managing logs across many services is difficult. The ELK Stack (Elasticsearch, Logstash, Kibana) provides a centralized way to search, analyze, and visualize log data.

## Objectives
- Deploy Elasticsearch as a search engine.
- Use Logstash to process and forward logs.
- Use Kibana to visualize logs in real-time.

## Prerequisites
- Docker and Docker Compose installed
- At least 4GB of RAM allocated to Docker

## How to Run
1. Navigate to the `solution` folder.
2. Run `docker-compose up -d`.
3. Wait for services to start (Elasticsearch takes a moment).
4. Access Kibana at `http://localhost:5601`.
