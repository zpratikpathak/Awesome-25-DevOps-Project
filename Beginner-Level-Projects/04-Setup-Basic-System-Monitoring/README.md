# Setup Basic System Monitoring

## Overview

In this project, you will learn how to set up basic system monitoring using popular monitoring tools. This project is designed for beginners who want to get started with monitoring and alerting.

## Prerequisites

- Basic knowledge of the command line
- A Unix-based operating system (Linux or macOS)
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `config/`: This folder contains example configuration files for various monitoring tools.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/04-Setup-Basic-System-Monitoring
   ```

2. Navigate to the `config/` folder:
   ```bash
   cd config
   ```

3. Open the example configuration files in your text editor and follow the instructions in the comments to understand how they work.

## Example Configuration Files

### 1. Prometheus Configuration

This configuration file sets up Prometheus to scrape metrics from a local node exporter.

```yaml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['localhost:9100']
```

### 2. Grafana Dashboard Configuration

This configuration file sets up a basic Grafana dashboard to visualize the metrics collected by Prometheus.

```json
{
  "dashboard": {
    "id": null,
    "title": "System Monitoring",
    "panels": [
      {
        "type": "graph",
        "title": "CPU Usage",
        "targets": [
          {
            "expr": "node_cpu_seconds_total",
            "legendFormat": "{{cpu}}"
          }
        ]
      },
      {
        "type": "graph",
        "title": "Memory Usage",
        "targets": [
          {
            "expr": "node_memory_MemAvailable_bytes",
            "legendFormat": "Available Memory"
          }
        ]
      }
    ]
  }
}
```

### 3. Alertmanager Configuration

This configuration file sets up Alertmanager to send alerts when certain conditions are met.

```yaml
global:
  resolve_timeout: 5m

route:
  group_by: ['alertname']
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 3h
  receiver: 'email'

receivers:
  - name: 'email'
    email_configs:
      - to: 'your-email@example.com'
        from: 'alertmanager@example.com'
        smarthost: 'smtp.example.com:587'
        auth_username: 'your-username'
        auth_password: 'your-password'
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up basic system monitoring using popular monitoring tools. Feel free to modify the example configuration files and create your own monitoring setups to further enhance your skills.
