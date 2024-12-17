# Basic Kubernetes Cluster Setup with Minikube

## Overview

In this project, you will learn how to set up a basic Kubernetes cluster using Minikube. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with Kubernetes and container orchestration.

## Prerequisites

- Basic knowledge of Kubernetes and Docker
- Minikube installed on your machine
- kubectl installed on your machine
- A sample application to deploy

## Project Structure

- `deployment.yaml`: This file contains the Kubernetes deployment configuration.
- `service.yaml`: This file contains the Kubernetes service configuration.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/14-Basic-Kubernetes-Cluster-Setup-with-Minikube
   ```

2. Start Minikube:
   ```bash
   minikube start
   ```

3. Create a `deployment.yaml` file in the project directory and open it in your text editor.

## Example Kubernetes Deployment Configuration

### 1. Basic Deployment

This deployment configuration sets up a simple Nginx application.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```

4. Create a `service.yaml` file in the project directory and open it in your text editor.

## Example Kubernetes Service Configuration

### 1. Basic Service

This service configuration exposes the Nginx application.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
  type: LoadBalancer
```

## Applying the Configuration

1. Apply the deployment configuration:
   ```bash
   kubectl apply -f deployment.yaml
   ```

2. Apply the service configuration:
   ```bash
   kubectl apply -f service.yaml
   ```

3. Verify that the deployment and service have been created successfully:
   ```bash
   kubectl get deployments
   kubectl get services
   ```

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up a basic Kubernetes cluster using Minikube. Feel free to modify the example configurations and create your own Kubernetes configurations to further enhance your skills.
