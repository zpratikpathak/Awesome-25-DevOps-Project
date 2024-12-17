# CI/CD Pipeline for Microservices

## Overview

In this project, you will learn how to set up a CI/CD pipeline for microservices using Docker and Kubernetes. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with microservices deployment and orchestration.

## Prerequisites

- Basic knowledge of Docker and Kubernetes
- Docker installed on your machine
- Kubernetes cluster set up (e.g., Minikube, GKE, EKS)
- A sample microservices project

## Project Structure

- `Dockerfile`: This file contains the instructions to build the Docker image for each microservice.
- `k8s`: This directory contains the Kubernetes deployment and service configuration files.
- `Jenkinsfile`: This file contains the Jenkins pipeline configuration.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/16-CI-CD-Pipeline-for-Microservices
   ```

2. Create a `Dockerfile` for each microservice in the project directory and open it in your text editor.

## Example Dockerfile

### 1. Basic Dockerfile for a Node.js Microservice

This Dockerfile sets up a simple Node.js microservice.

```Dockerfile
# Use the official Node.js image as the base image
FROM node:14

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
```

3. Create a `k8s` directory in the project directory and add the Kubernetes deployment and service configuration files.

## Example Kubernetes Deployment Configuration

### 1. Basic Deployment for a Node.js Microservice

This deployment configuration sets up a simple Node.js microservice.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nodejs-microservice
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nodejs-microservice
  template:
    metadata:
      labels:
        app: nodejs-microservice
    spec:
      containers:
      - name: nodejs-microservice
        image: nodejs-microservice:latest
        ports:
        - containerPort: 3000
```

### 2. Basic Service for a Node.js Microservice

This service configuration exposes the Node.js microservice.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nodejs-microservice
spec:
  selector:
    app: nodejs-microservice
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
  type: LoadBalancer
```

4. Create a `Jenkinsfile` in the project directory and open it in your text editor.

## Example Jenkinsfile

### 1. Basic Jenkins Pipeline for Microservices

This Jenkinsfile sets up a CI/CD pipeline that builds and tests each microservice, then builds Docker images and deploys them to a Kubernetes cluster.

```groovy
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t nodejs-microservice .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run nodejs-microservice npm test'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'docker tag nodejs-microservice $DOCKERHUB_USERNAME/nodejs-microservice:latest'
                    sh 'docker push $DOCKERHUB_USERNAME/nodejs-microservice:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                kubernetesDeploy(
                    configs: 'k8s/deployment.yaml',
                    kubeconfigId: 'kubeconfig'
                )
            }
        }
    }
}
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up a CI/CD pipeline for microservices using Docker and Kubernetes. Feel free to modify the example Dockerfile, Kubernetes configurations, and Jenkinsfile to further enhance your skills.
