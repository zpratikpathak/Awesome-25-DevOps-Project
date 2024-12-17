# Containerized CI/CD Pipeline with Jenkins

## Overview

In this project, you will learn how to set up a containerized CI/CD pipeline using Jenkins. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with Jenkins and Docker.

## Prerequisites

- Basic knowledge of Jenkins and Docker
- Docker installed on your machine
- Jenkins installed on your machine or running in a Docker container
- A sample project repository

## Project Structure

- `Jenkinsfile`: This file contains the Jenkins pipeline configuration.
- `Dockerfile`: This file contains the instructions to build the Docker image for the sample project.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/11-Containerized-CI-CD-Pipeline-with-Jenkins
   ```

2. Create a `Jenkinsfile` in the project directory and open it in your text editor.

## Example Jenkinsfile

### 1. Basic Jenkins Pipeline

This Jenkinsfile sets up a simple CI/CD pipeline that builds and tests the project, then builds a Docker image and pushes it to a Docker registry.

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

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up a containerized CI/CD pipeline using Jenkins. Feel free to modify the example Jenkinsfile and Dockerfile to further enhance your skills.
