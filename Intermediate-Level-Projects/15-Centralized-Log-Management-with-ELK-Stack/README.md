# Centralized Log Management with ELK Stack

## Overview

In this project, you will learn how to set up a centralized log management system using the ELK Stack (Elasticsearch, Logstash, and Kibana). This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with log management and analysis.

## Prerequisites

- Basic knowledge of Elasticsearch, Logstash, and Kibana
- Docker installed on your machine
- Docker Compose installed on your machine
- Sample log data

## Project Structure

- `docker-compose.yml`: This file contains the Docker Compose configuration for the ELK Stack.
- `logstash.conf`: This file contains the Logstash configuration.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/15-Centralized-Log-Management-with-ELK-Stack
   ```

2. Create a `docker-compose.yml` file in the project directory and open it in your text editor.

## Example Docker Compose Configuration

### 1. Basic ELK Stack Configuration

This Docker Compose configuration sets up the ELK Stack with Elasticsearch, Logstash, and Kibana.

```yaml
version: '3.7'

services:
  elasticsearch:
    image: docker.elastic.co/elasticsearch/elasticsearch:7.10.1
    container_name: elasticsearch
    environment:
      - discovery.type=single-node
    ports:
      - "9200:9200"
    networks:
      - elk

  logstash:
    image: docker.elastic.co/logstash/logstash:7.10.1
    container_name: logstash
    volumes:
      - ./logstash.conf:/usr/share/logstash/pipeline/logstash.conf
    ports:
      - "5044:5044"
    networks:
      - elk
    depends_on:
      - elasticsearch

  kibana:
    image: docker.elastic.co/kibana/kibana:7.10.1
    container_name: kibana
    ports:
      - "5601:5601"
    networks:
      - elk
    depends_on:
      - elasticsearch

networks:
  elk:
    driver: bridge
```

3. Create a `logstash.conf` file in the project directory and open it in your text editor.

## Example Logstash Configuration

### 1. Basic Logstash Configuration

This Logstash configuration reads log data from a file and sends it to Elasticsearch.

```plaintext
input {
  file {
    path => "/path/to/your/logfile.log"
    start_position => "beginning"
  }
}

filter {
  grok {
    match => { "message" => "%{COMBINEDAPACHELOG}" }
  }
}

output {
  elasticsearch {
    hosts => ["elasticsearch:9200"]
  }
  stdout { codec => rubydebug }
}
```

## Running the ELK Stack

1. Start the ELK Stack using Docker Compose:
   ```bash
   docker-compose up -d
   ```

2. Verify that the ELK Stack is running successfully:
   ```bash
   docker-compose ps
   ```

3. Access Kibana in your web browser at `http://localhost:5601`.

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up a centralized log management system using the ELK Stack. Feel free to modify the example configurations and create your own ELK Stack configurations to further enhance your skills.
