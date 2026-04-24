# Project: Kubernetes Ingress & Traffic Management

## Description
Exposing services via LoadBalancers can be expensive. Kubernetes Ingress allows you to route external HTTP/S traffic to multiple services using a single entry point (Ingress Controller).

## Objectives
- Deploy the Nginx Ingress Controller.
- Create multiple deployments (e.g., `app-v1`, `app-v2`).
- Configure Ingress rules for path-based routing (`/v1`, `/v2`).
- Understand Host-based routing.

## Prerequisites
- Kubernetes cluster (Minikube/EKS/GKE)
- kubectl installed

## How to Run
1. Navigate to the `solution` folder.
2. Enable ingress on Minikube: `minikube addons enable ingress`.
3. Apply the manifests: `kubectl apply -f .`
4. Update your `/etc/hosts` to map `devops.local` to the cluster IP.
5. Visit `http://devops.local/app1` in your browser.
