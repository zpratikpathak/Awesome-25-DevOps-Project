# DR Infrastructure Deployment Guide

Follow these steps to deploy the disaster recovery infrastructure.

## 1. Prerequisites
- Terraform CLI installed.
- AWS credentials configured with access to both primary and standby regions.
- Primary infrastructure must be deployed first (for cross-region replication sources).

## 2. Review Configuration
Ensure the Terraform scripts in this `solution` folder are configured with the correct AWS regions (e.g., `us-east-1` for primary, `us-west-2` for secondary) and that replication ARNs match your primary resources.

## 3. Initialize Terraform
```bash
terraform init
```

## 4. Plan the DR Deployment
Generate a plan to verify the cross-region resources that will be provisioned:
```bash
terraform plan -out=dr-plan
```
Review the plan to ensure it includes the RDS Read Replica, standby VPC components, and S3 replication configurations.

## 5. Apply Configuration
Provision the standby resources:
```bash
terraform apply dr-plan
```
*Note: Initializing cross-region read replicas can take some time.*

## 6. Testing the Failover
To simulate a regional failure and test the DR plan:
1. Block access to the primary region's ALB (e.g., modify its security group).
2. Wait for Route 53 Health Checks to fail.
3. Observe DNS failing over to the standby region.
4. Manually trigger the RDS Read Replica promotion script (if not fully automated).
