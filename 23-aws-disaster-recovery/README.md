# Project: Disaster Recovery Strategy for AWS

## Description
High availability is not enough; you need a plan for regional failure. This project implements a "Pilot Light" or "Warm Standby" disaster recovery strategy using AWS Route 53 and cross-region replication.

## Objectives
- Configure RDS Cross-Region Read Replicas.
- Set up S3 Cross-Region Replication.
- Use Route 53 Health Checks and Failover Routing policies.
- Test a "region failover" scenario.

## Prerequisites
- AWS Account
- Resources deployed in a "Primary" region (e.g., us-east-1)

## How to Run
1. Review the DR checklist in `dr-plan.md`.
2. Follow the Terraform scripts in the `solution` folder to provision the standby region.
3. Manually trigger a failover by updating Route 53 or stopping primary region resources.
