# Step-by-Step Deployment Guide

Follow these instructions to deploy the 3-tier architecture.

## 1. Prerequisites Check
Ensure you have the following installed and configured:
- Terraform CLI
- AWS CLI configured with appropriate credentials
- SSH key pair created in AWS (if you need instance access)

## 2. Initialization
Navigate to this `solution` folder in your terminal and initialize Terraform to download the AWS provider:
```bash
terraform init
```

## 3. Plan the Deployment
Run a plan to review the resources that will be created:
```bash
terraform plan -out=tfplan
```
Review the output to ensure the VPC, subnets, EC2 instances, and RDS database match the expected architecture.

## 4. Apply the Configuration
Apply the plan to provision the infrastructure on AWS:
```bash
terraform apply tfplan
```
*Note: This process may take 10-15 minutes, primarily due to the RDS instance creation.*

## 5. Verification
Once the apply is complete, Terraform will output the DNS name of the Application Load Balancer.
- Open your browser and navigate to the ALB DNS name.
- Verify that your application is accessible.

## 6. Teardown
To avoid incurring unnecessary AWS charges, destroy the resources when you are finished:
```bash
terraform destroy
```
Type `yes` when prompted to confirm the deletion.
