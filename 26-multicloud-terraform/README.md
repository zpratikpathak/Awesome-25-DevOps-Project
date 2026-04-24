# Project: Multi-Cloud Infrastructure with Terraform

## Description
To avoid vendor lock-in, many companies use multiple cloud providers. This project uses Terraform to provision resources in both AWS (S3 Bucket) and Azure (Resource Group & Storage Account).

## Objectives
- Configure multiple Terraform providers.
- Manage state for resources across different clouds.
- Use data sources to reference resources from one cloud in another.

## Prerequisites
- AWS Account and Azure Subscription
- Terraform installed

## How to Run
1. Authenticate with both `aws` and `az` CLIs.
2. Navigate to the `solution` folder.
3. Run `terraform init` and `terraform apply`.
4. Verify resources in both the AWS and Azure consoles.
