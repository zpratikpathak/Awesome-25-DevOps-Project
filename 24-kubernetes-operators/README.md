# Project: Kubernetes Operators

## Description
Operators extend the Kubernetes API to manage complex, stateful applications (like databases) using custom resources. This project explores how to use an existing operator (e.g., Postgres Operator) to manage a database cluster.

## Objectives
- Understand Custom Resource Definitions (CRDs).
- Deploy the Zalando Postgres Operator or CloudNativePG.
- Create a `Postgres` custom resource.
- Observe the operator automatically provisioning pods, volumes, and backups.

## Prerequisites
- Kubernetes cluster

## How to Run
1. Install the operator using Helm.
2. Apply the custom resource YAML in the `solution` folder.
3. Check the logs of the operator pod to see how it reacts to the new resource.
