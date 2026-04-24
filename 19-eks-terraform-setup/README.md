# Project: Production EKS Cluster with Terraform

## Description
Deploying a production-ready Kubernetes cluster on AWS. This project uses the official Terraform EKS module to provision an Elastic Kubernetes Service (EKS) cluster with managed node groups.

## Objectives
- Use the `terraform-aws-modules/eks/aws` module.
- Configure VPC and IAM requirements for EKS.
- Provision a cluster with multiple worker nodes.
- Configure `kubectl` to connect to the new cluster.

## Prerequisites
- AWS Account with admin permissions
- Terraform and AWS CLI installed

## How to Run
1. Navigate to the `solution` folder.
2. Run `terraform init`.
3. Run `terraform apply` (Note: This may take 15-20 minutes).
4. Run `aws eks update-kubeconfig --name my-cluster` to connect.
