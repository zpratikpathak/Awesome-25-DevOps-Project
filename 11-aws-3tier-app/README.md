# Project: Deploying a 3-Tier Web App on AWS

## Description
This project covers the architecture and deployment of a classic 3-tier application (Presentation, Application, and Data tiers) on AWS using EC2, an Application Load Balancer (ALB), and RDS.

## Objectives
- Set up a public-facing ALB (Tier 1).
- Deploy Web/App servers in private subnets (Tier 2).
- Provision an RDS PostgreSQL database (Tier 3).
- Configure Security Groups for strict traffic flow.

## Prerequisites
- AWS Account
- Knowledge of VPC networking

## How to Run
1. Review the architecture diagram in `architecture.md`.
2. Follow the Terraform scripts in the `solution` folder to provision the infrastructure.
3. Access the application via the ALB DNS name.
