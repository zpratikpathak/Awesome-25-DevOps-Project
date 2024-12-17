# Distributed Tracing with Jaeger and Prometheus

## Overview

In this project, you will learn how to implement distributed tracing using Jaeger and Prometheus. This project is designed for advanced-level DevOps engineers who want to gain hands-on experience with monitoring and analyzing microservices communication and inter-service latency.

## Prerequisites

- Advanced knowledge of microservices architecture
- Familiarity with Jaeger and Prometheus
- A Kubernetes cluster set up (e.g., Minikube, GKE, EKS)
- A sample microservices project

## Project Structure

- `jaeger`: This directory contains the Jaeger configuration files.
- `prometheus`: This directory contains the Prometheus configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/24-Distributed-Tracing-with-Jaeger-and-Prometheus
   ```

2. Create `jaeger` and `prometheus` directories in the project directory and add the configuration files for Jaeger and Prometheus.

## Example Jaeger Configuration

### 1. Jaeger Deployment

This configuration sets up a Jaeger deployment in Kubernetes.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: jaeger
spec:
  replicas: 1
  selector:
    matchLabels:
      app: jaeger
  template:
    metadata:
      labels:
        app: jaeger
    spec:
      containers:
      - name: jaeger
        image: jaegertracing/all-in-one:1.22
        ports:
        - containerPort: 16686
        - containerPort: 14268
        - containerPort: 14250
        - containerPort: 6831
        - containerPort: 6832
```

### 2. Jaeger Service

This service configuration exposes the Jaeger UI and collector.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: jaeger
spec:
  selector:
    app: jaeger
  ports:
    - protocol: TCP
      port: 16686
      targetPort: 16686
    - protocol: TCP
      port: 14268
      targetPort: 14268
    - protocol: TCP
      port: 14250
      targetPort: 14250
    - protocol: UDP
      port: 6831
      targetPort: 6831
    - protocol: UDP
      port: 6832
      targetPort: 6832
  type: LoadBalancer
```

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
      - job_name: 'jaeger'
        static_configs:
          - targets: ['jaeger:14268']
```

## Applying the Configuration

1. Apply the Jaeger deployment and service configuration:
   ```bash
   kubectl apply -f jaeger/deployment.yaml
   kubectl apply -f jaeger/service.yaml
   ```

2. Apply the Prometheus deployment, service, and ConfigMap configuration:
   ```bash
   kubectl apply -f prometheus/deployment.yaml
   kubectl apply -f prometheus/service.yaml
   kubectl apply -f prometheus/configmap.yaml
   ```

3. Verify that the deployments and services have been created successfully:
   ```bash
   kubectl get deployments
   kubectl get services
   ```

## Conclusion

By completing this project, you will have gained a solid understanding of how to implement distributed tracing using Jaeger and Prometheus. Feel free to modify the example configurations and create your own tracing configurations to further enhance your skills.
