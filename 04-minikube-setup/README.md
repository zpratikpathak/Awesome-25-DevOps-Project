# Project: Setting up a Local Kubernetes Cluster

## Description
Kubernetes is the industry standard for orchestration. In this project, you'll set up a local cluster using Minikube and deploy a simple Nginx application to understand Pods and Services.

## Objectives
- Install and start Minikube.
- Use `kubectl` to interact with the cluster.
- Deploy an Nginx server.
- Expose the deployment as a Service.

## Prerequisites
- Docker or a Virtual Machine manager (e.g., VirtualBox)
- Minikube and kubectl installed

## How to Run
1. Start Minikube: `minikube start`
2. Apply the deployment: `kubectl apply -f nginx-deployment.yaml`
3. Apply the service: `kubectl apply -f nginx-service.yaml`
4. Access the app: `minikube service nginx-service`
