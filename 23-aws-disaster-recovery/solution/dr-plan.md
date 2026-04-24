# Disaster Recovery (DR) Checklist

This document details our "Pilot Light" / "Warm Standby" Disaster Recovery strategy.

## Primary Region (e.g., us-east-1)
- [ ] Application instances running via Auto Scaling Group.
- [ ] Primary RDS database instance active.
- [ ] Primary S3 bucket for assets active.
- [ ] Route 53 health checks configured for primary ALB.
- [ ] Continuous backup and binlog replication enabled on RDS.

## Standby Region (e.g., us-west-2)
- [ ] Cross-Region Read Replica of the primary RDS instance is healthy.
- [ ] S3 Cross-Region Replication is active and syncing assets.
- [ ] Core infrastructure (VPC, Subnets, Security Groups) pre-provisioned via Terraform.
- [ ] Auto Scaling Group configured but set to 0 (Pilot Light) or a minimal capacity (Warm Standby).

## Failover Procedure
In the event of a primary region failure:
1. **Promote the Database**: Promote the cross-region read replica in the standby region to be a standalone primary instance.
2. **Scale Application**: Update the Auto Scaling Group in the standby region to the desired capacity.
3. **Update DNS**: Ensure Route 53 Failover Routing detects the primary failure and routes traffic to the standby ALB (or update DNS manually if needed).
4. **Verify Application**: Test application functionality in the standby region.

## Failback Procedure
1. Establish a new read replica in the original primary region.
2. Synchronize data back to the primary region.
3. Schedule a maintenance window to flip the primary/standby roles back to their original state.
