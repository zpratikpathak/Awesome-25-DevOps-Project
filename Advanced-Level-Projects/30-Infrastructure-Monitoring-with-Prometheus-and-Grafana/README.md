# Infrastructure Monitoring with Prometheus and Grafana

## Overview

In this project, you will learn how to set up comprehensive infrastructure monitoring using Prometheus and Grafana. This project is designed for advanced-level DevOps engineers who want to gain hands-on experience with monitoring, alerting, and visualizing infrastructure metrics.

## Prerequisites

- Advanced knowledge of Prometheus and Grafana
- A Kubernetes cluster set up (e.g., Minikube, GKE, EKS)
- A sample application deployed on the Kubernetes cluster

## Project Structure

- `prometheus`: This directory contains the Prometheus configuration files.
- `grafana`: This directory contains the Grafana configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/30-Infrastructure-Monitoring-with-Prometheus-and-Grafana
   ```

2. Create `prometheus` and `grafana` directories in the project directory and add the configuration files for Prometheus and Grafana.

## Example Prometheus Configuration

### 1. Prometheus Deployment

This configuration sets up a Prometheus deployment in Kubernetes.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: prometheus
spec:
  replicas: 1
  selector:
    matchLabels:
      app: prometheus
  template:
    metadata:
      labels:
        app: prometheus
    spec:
      containers:
      - name: prometheus
        image: prom/prometheus:v2.26.0
        ports:
        - containerPort: 9090
        volumeMounts:
        - name: prometheus-config
          mountPath: /etc/prometheus
          subPath: prometheus.yml
  volumes:
  - name: prometheus-config
    configMap:
      name: prometheus-config
```

### 2. Prometheus Service

This service configuration exposes the Prometheus UI.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: prometheus
spec:
  selector:
    app: prometheus
  ports:
    - protocol: TCP
      port: 9090
      targetPort: 9090
  type: LoadBalancer
```

### 3. Prometheus ConfigMap

This ConfigMap contains the Prometheus configuration.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s
    scrape_configs:
      - job_name: 'prometheus'
        static_configs:
          - targets: ['localhost:9090']
```

## Example Grafana Configuration

### 1. Grafana Deployment

This configuration sets up a Grafana deployment in Kubernetes.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
      - name: grafana
        image: grafana/grafana:7.5.5
        ports:
        - containerPort: 3000
```

### 2. Grafana Service

This service configuration exposes the Grafana UI.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: grafana
spec:
  selector:
    app: grafana
  ports:
    - protocol: TCP
      port: 3000
      targetPort: 3000
  type: LoadBalancer
```

## Applying the Configuration

1. Apply the Prometheus deployment, service, and ConfigMap configuration:
   ```bash
   kubectl apply -f prometheus/deployment.yaml
   kubectl apply -f prometheus/service.yaml
   kubectl apply -f prometheus/configmap.yaml
   ```

2. Apply the Grafana deployment and service configuration:
   ```bash
   kubectl apply -f grafana/deployment.yaml
   kubectl apply -f grafana/service.yaml
   ```

3. Verify that the deployments and services have been created successfully:
   ```bash
   kubectl get deployments
   kubectl get services
   ```

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up comprehensive infrastructure monitoring using Prometheus and Grafana. Feel free to modify the example configurations and create your own monitoring configurations to further enhance your skills.
