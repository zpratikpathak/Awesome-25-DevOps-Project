# Project: Jenkins Pipeline for Java/Maven Project

## Description
Jenkins is a staple in the CI/CD world. This project sets up a "Pipeline as Code" using a `Jenkinsfile` to build, test, and package a Java application using Maven.

## Objectives
- Configure a Jenkins pipeline job.
- Write a multi-stage `Jenkinsfile` (Build, Test, Package).
- Use Jenkins environment variables.
- Archive the build artifact (JAR file).

## Prerequisites
- Jenkins server running
- Maven installed on the Jenkins agent
- Git configured in Jenkins

## How to Run
1. Create a "Pipeline" job in Jenkins.
2. Link it to your repository.
3. Jenkins will automatically detect the `Jenkinsfile` in the root (or project folder).
4. Run the build and view the Pipeline visualization.
