# Automated Code Quality Checks with SonarQube

## Overview

In this project, you will learn how to set up automated code quality checks using SonarQube. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with code quality analysis and continuous integration.

## Prerequisites

- Basic knowledge of SonarQube
- SonarQube installed on your machine or server
- Access to a sample project repository

## Project Structure

- `sonar-project.properties`: This file contains the SonarQube project configuration.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/19-Automated-Code-Quality-Checks-with-SonarQube
   ```

2. Create a `sonar-project.properties` file in the project directory and open it in your text editor.

## Example SonarQube Configuration

### 1. Basic SonarQube Configuration

This configuration sets up a basic SonarQube project.

```properties
# Required metadata
sonar.projectKey=my-project-key
sonar.projectName=My Project
sonar.projectVersion=1.0

# Comma-separated paths to directories with sources (required)
sonar.sources=src

# Language
sonar.language=java

# Encoding of the source files
sonar.sourceEncoding=UTF-8
```

### 2. Advanced SonarQube Configuration

This configuration sets up advanced code quality checks and integrations.

```properties
# Required metadata
sonar.projectKey=my-project-key
sonar.projectName=My Project
sonar.projectVersion=1.0

# Comma-separated paths to directories with sources (required)
sonar.sources=src

# Language
sonar.language=java

# Encoding of the source files
sonar.sourceEncoding=UTF-8

# Additional settings
sonar.tests=test
sonar.inclusions=src/**/*.java
sonar.exclusions=**/generated/**
sonar.test.inclusions=**/test/**/*.java
sonar.test.exclusions=**/test/generated/**
sonar.java.binaries=target/classes
sonar.java.test.binaries=target/test-classes
sonar.java.libraries=lib/**/*.jar
sonar.junit.reportPaths=target/surefire-reports
sonar.jacoco.reportPaths=target/jacoco.exec
```

## Running SonarQube Analysis

1. Run the SonarQube scanner to analyze the project:
   ```bash
   sonar-scanner
   ```

2. Verify the analysis results in the SonarQube dashboard.

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up automated code quality checks using SonarQube. Feel free to modify the example configurations and create your own SonarQube configurations to further enhance your skills.
