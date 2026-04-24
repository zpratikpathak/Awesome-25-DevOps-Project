# Project: AWS Lambda for Serverless Task Automation

## Description
Serverless computing allows you to run code without managing servers. This project uses AWS Lambda and Python to automate a common DevOps task: stopping non-essential EC2 instances at night to save costs.

## Objectives
- Create a Python Lambda function using Boto3.
- Set up an IAM Role with permissions to manage EC2.
- Use EventBridge (CloudWatch Events) to trigger the function on a schedule.

## Prerequisites
- AWS Account
- Basic knowledge of Python

## How to Run
1. Navigate to the `solution` folder.
2. Deploy the Lambda function using the AWS Console or Terraform.
3. Configure the EventBridge cron expression (e.g., `0 22 * * ? *` for 10 PM).
4. Verify that instances with the tag `ScheduledStop: true` are stopped.
