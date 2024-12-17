# Serverless CI/CD Pipeline on AWS Lambda

## Overview

In this project, you will learn how to create a cost-efficient CI/CD pipeline using AWS Lambda. This project is designed for advanced-level DevOps engineers who want to leverage serverless architecture to build scalable and cost-effective CI/CD pipelines.

## Prerequisites

- Advanced knowledge of AWS services, especially AWS Lambda
- Familiarity with CI/CD concepts and tools
- AWS account with necessary permissions
- AWS CLI installed on your machine
- A sample project repository

## Project Structure

- `lambda`: This directory contains the AWS Lambda function code and configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/26-Serverless-CI-CD-Pipeline-on-AWS-Lambda
   ```

2. Create a `lambda` directory in the project directory and add the AWS Lambda function code and configuration files.

## Example AWS Lambda Configuration

### 1. Lambda Function Code

This code sets up a simple AWS Lambda function to handle CI/CD tasks.

```python
import json
import boto3

def lambda_handler(event, context):
    # Example CI/CD task: Print event details
    print("Received event: " + json.dumps(event, indent=2))
    
    # Add your CI/CD logic here
    
    return {
        'statusCode': 200,
        'body': json.dumps('CI/CD task completed successfully!')
    }
```

### 2. Lambda Function Deployment

This configuration sets up the deployment of the AWS Lambda function using AWS CLI.

```bash
# Create a deployment package
zip function.zip lambda_function.py

# Create an IAM role for the Lambda function
aws iam create-role --role-name lambda-cicd-role --assume-role-policy-document file://trust-policy.json

# Attach necessary policies to the role
aws iam attach-role-policy --role-name lambda-cicd-role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

# Create the Lambda function
aws lambda create-function --function-name cicd-function --zip-file fileb://function.zip --handler lambda_function.lambda_handler --runtime python3.8 --role arn:aws:iam::<account-id>:role/lambda-cicd-role
```

## Integrating Lambda with CI/CD Pipeline

1. Create a `Jenkinsfile` in the project directory and open it in your text editor.

## Example Jenkinsfile

### 1. Jenkins Pipeline with AWS Lambda

This Jenkinsfile sets up a CI/CD pipeline that triggers the AWS Lambda function.

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

        stage('Deploy') {
            steps {
                script {
                    def lambdaFunctionName = 'cicd-function'
                    def payload = '{"key": "value"}'
                    sh "aws lambda invoke --function-name ${lambdaFunctionName} --payload '${payload}' response.json"
                }
            }
        }
    }
}
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to create a cost-efficient CI/CD pipeline using AWS Lambda. Feel free to modify the example configurations and create your own serverless CI/CD pipelines to further enhance your skills.
