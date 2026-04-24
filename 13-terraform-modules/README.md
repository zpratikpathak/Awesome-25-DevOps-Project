# Project: Terraform Modules for Reuse

## Description
Writing repetitive IaC code is error-prone. This project demonstrates how to use Terraform Modules to create reusable infrastructure components, specifically for an EC2 Instance with a predefined security group.

## Objectives
- Create a local Terraform module.
- Define input variables and output values for the module.
- Call the module from a root configuration.
- Manage multiple environments (Dev/Prod) using the same module.

## Prerequisites
- Terraform installed
- AWS credentials

## How to Run
1. Navigate to the `solution` folder.
2. Explore the `modules/ec2-instance` directory.
3. Run `terraform init` and `terraform apply` from the root directory.
