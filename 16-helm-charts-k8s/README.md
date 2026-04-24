# Project: Helm Charts for Kubernetes Package Management

## Description
Managing many Kubernetes YAML files is cumbersome. Helm is the package manager for Kubernetes that uses "Charts" to template and package applications for easy deployment and scaling.

## Objectives
- Create a basic Helm chart structure.
- Use `values.yaml` to parameterize deployments.
- Deploy an application using `helm install`.
- Perform a rolling update with `helm upgrade`.

## Prerequisites
- Kubernetes cluster
- Helm CLI installed

## How to Run
1. Navigate to the `solution` folder.
2. Inspect the chart: `helm lint ./my-app`.
3. Install the chart: `helm install my-release ./my-app`.
4. Update a value in `values.yaml` and run `helm upgrade my-release ./my-app`.
