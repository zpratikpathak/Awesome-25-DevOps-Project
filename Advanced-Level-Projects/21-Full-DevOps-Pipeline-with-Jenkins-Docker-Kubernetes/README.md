# Full DevOps Pipeline with Jenkins, Docker, Kubernetes

## Overview

In this project, you will learn how to set up a full DevOps pipeline using Jenkins, Docker, and Kubernetes. This project is designed for advanced-level DevOps engineers who want to gain hands-on experience with building and managing complex CI/CD pipelines.

## Prerequisites

- Advanced knowledge of Jenkins, Docker, and Kubernetes
- Docker installed on your machine
- Kubernetes cluster set up (e.g., Minikube, GKE, EKS)
- Jenkins installed on your machine or running in a Docker container
- A sample project repository

## Project Structure

- `Jenkinsfile`: This file contains the Jenkins pipeline configuration.
- `Dockerfile`: This file contains the instructions to build the Docker image for the sample project.
- `k8s`: This directory contains the Kubernetes deployment and service configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/21-Full-DevOps-Pipeline-with-Jenkins-Docker-Kubernetes
   ```

2. Create a `Jenkinsfile` in the project directory and open it in your text editor.

## Example Jenkinsfile

### 1. Full Jenkins Pipeline

This Jenkinsfile sets up a full CI/CD pipeline that builds and tests the project, then builds a Docker image, pushes it to a Docker registry, and deploys it to a Kubernetes cluster.

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
                sh 'docker build -t my-sample-app .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run my-sample-app npm test'
            }
        }

        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'docker tag my-sample-app $DOCKERHUB_USERNAME/my-sample-app:latest'
                    sh 'docker push $DOCKERHUB_USERNAME/my-sample-app:latest'
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

## Example Dockerfile

### 1. Basic Dockerfile

This Dockerfile sets up a simple Node.js application.

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

### 1. Basic Deployment

This deployment configuration sets up a simple Node.js application.

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nodejs-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nodejs-app
  template:
    metadata:
      labels:
        app: nodejs-app
    spec:
      containers:
      - name: nodejs-app
        image: nodejs-app:latest
        ports:
        - containerPort: 3000
```

### 2. Basic Service

This service configuration exposes the Node.js application.

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nodejs-app
spec:
  selector:
    app: nodejs-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
  type: LoadBalancer
```

## Applying the Configuration

1. Apply the deployment configuration:
   ```bash
   kubectl apply -f k8s/deployment.yaml
   ```

2. Apply the service configuration:
   ```bash
   kubectl apply -f k8s/service.yaml
   ```

3. Verify that the deployment and service have been created successfully:
   ```bash
   kubectl get deployments
   kubectl get services
   ```

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up a full DevOps pipeline using Jenkins, Docker, and Kubernetes. Feel free to modify the example Jenkinsfile, Dockerfile, and Kubernetes configurations to further enhance your skills.
