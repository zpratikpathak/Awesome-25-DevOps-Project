# Project: GitOps with ArgoCD

## Description
GitOps is a paradigm where the "Git repository" is the source of truth for infrastructure and applications. ArgoCD automates the deployment of Kubernetes resources by syncing them with a Git repo.

## Objectives
- Install ArgoCD on a Kubernetes cluster.
- Connect ArgoCD to a Git repository containing K8s manifests.
- Set up an ArgoCD "Application" to track the repo.
- Observe automatic synchronization and drift detection.

## Prerequisites
- Kubernetes cluster (EKS/Minikube)
- ArgoCD CLI (optional)

## How to Run
1. Install ArgoCD: `kubectl create namespace argocd && kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`.
2. Access the UI via port-forwarding.
3. Create a new app pointing to your project's `k8s-manifests` folder.
