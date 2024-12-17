# Blue-Green Deployment Strategy

## Overview

In this project, you will learn how to implement a Blue-Green deployment strategy using Kubernetes. This project is designed for advanced-level DevOps engineers who want to gain hands-on experience with zero-downtime deployments and traffic management.

## Prerequisites

- Advanced knowledge of Kubernetes
- A Kubernetes cluster set up (e.g., Minikube, GKE, EKS)
- kubectl installed on your machine
- A sample application to deploy

## Project Structure

- `k8s`: This directory contains the Kubernetes deployment and service configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/28-Blue-Green-Deployment-Strategy
   ```

2. Create a `k8s` directory in the project directory and add the Kubernetes deployment and service configuration files.

## Example Kubernetes Deployment Configuration

### 1. Blue Deployment

This deployment configuration sets up the Blue version of the application.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: blue-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: blue-app
  template:
    metadata:
      labels:
        app: blue-app
    spec:
      containers:
      - name: blue-app
        image: my-sample-app:blue
        ports:
        - containerPort: 80
```

### 2. Green Deployment

This deployment configuration sets up the Green version of the application.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: green-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: green-app
  template:
    metadata:
      labels:
        app: green-app
    spec:
      containers:
      - name: green-app
        image: my-sample-app:green
        ports:
        - containerPort: 80
```

### 3. Service Configuration

This service configuration manages traffic between the Blue and Green versions of the application.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: app-service
spec:
  selector:
    app: blue-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
```

## Applying the Configuration

1. Apply the Blue deployment configuration:
   ```bash
   kubectl apply -f k8s/blue-deployment.yaml
   ```

2. Apply the Green deployment configuration:
   ```bash
   kubectl apply -f k8s/green-deployment.yaml
   ```

3. Apply the service configuration:
   ```bash
   kubectl apply -f k8s/service.yaml
   ```

4. Verify that the deployments and service have been created successfully:
   ```bash
   kubectl get deployments
   kubectl get services
   ```

## Switching Traffic

1. To switch traffic from the Blue version to the Green version, update the service selector:
   ```bash
   kubectl patch service app-service -p '{"spec":{"selector":{"app":"green-app"}}}'
   ```

2. Verify that the service is now routing traffic to the Green version:
   ```bash
   kubectl get service app-service -o yaml
   ```

## Conclusion

By completing this project, you will have gained a solid understanding of how to implement a Blue-Green deployment strategy using Kubernetes. Feel free to modify the example configurations and create your own Blue-Green deployment setups to further enhance your skills.
