# Project: Infrastructure as Code: AWS VPC with Terraform

## Description
Infrastructure as Code (IaC) is essential for modern DevOps. This project uses Terraform to provision a secure, multi-tier AWS Virtual Private Cloud (VPC) with public and private subnets.

## Objectives
- Initialize Terraform and configure the AWS provider.
- Define VPC, subnets, and internet gateway.
- Create route tables and security groups.
- Use `terraform plan` and `terraform apply`.

## Prerequisites
- AWS Account
- Terraform CLI installed
- AWS credentials configured locally

## How to Run
1. Navigate to the `solution` folder.
2. Update `provider.tf` with your region.
3. Run `terraform init`.
4. Run `terraform plan` to see the resources.
5. Run `terraform apply` to provision the VPC.
