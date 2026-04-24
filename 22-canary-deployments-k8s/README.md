# Project: Zero-Downtime Deployments (Canary/Blue-Green)

## Description
Deploying new features should not risk uptime. This project covers Canary and Blue-Green deployment strategies on Kubernetes using Argo Rollouts or Istio.

## Objectives
- Deploy two versions of an app (`stable` and `canary`).
- Use a Traffic Splitter to send 10% of traffic to the `canary` version.
- Implement a Blue-Green switch by updating service selectors.
- Automate rollbacks if errors are detected.

## Prerequisites
- Kubernetes cluster
- Argo Rollouts installed (optional)

## How to Run
1. Navigate to the `solution` folder.
2. Apply the `Rollout` or `Service` manifests.
3. Observe the traffic shift using a load testing tool or browser.
