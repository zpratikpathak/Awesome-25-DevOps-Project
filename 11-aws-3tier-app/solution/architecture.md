# Architecture Diagram and Description

## 3-Tier Web App on AWS

This document outlines the architecture for our classic 3-tier application deployment on AWS.

### Overview
1. **Tier 1: Presentation Layer (ALB)**
   - **Component**: Application Load Balancer (ALB)
   - **Location**: Public Subnets across two Availability Zones.
   - **Purpose**: Receives incoming HTTP/HTTPS traffic from the internet and distributes it across the application servers in the private subnets.

2. **Tier 2: Application Layer (EC2)**
   - **Component**: Auto Scaling Group of EC2 Instances
   - **Location**: Private Subnets across two Availability Zones.
   - **Purpose**: Hosts the backend application logic. These instances do not have public IP addresses and communicate with the internet via a NAT Gateway if necessary. They receive traffic exclusively from the ALB.

3. **Tier 3: Data Layer (RDS)**
   - **Component**: Amazon RDS (PostgreSQL/MySQL)
   - **Location**: Private Database Subnets.
   - **Purpose**: Stores application data. Configured in a Multi-AZ deployment for high availability. Accessible only by the EC2 instances in the Application Layer.

### Security Groups
- **ALB SG**: Allows inbound traffic on port 80/443 from `0.0.0.0/0`.
- **App SG**: Allows inbound traffic on the application port (e.g., 8080) *only* from the ALB SG.
- **DB SG**: Allows inbound traffic on the database port (e.g., 5432) *only* from the App SG.

### Diagram
```text
      Internet
         |
    [ ALB (Public) ]
      /        \
[App EC2]    [App EC2]  (Private)
      \        /
    [ RDS DB (Private) ]
```
