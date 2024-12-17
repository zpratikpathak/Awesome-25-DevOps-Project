# GitOps Workflow with ArgoCD

## Overview

In this project, you will learn how to implement a GitOps workflow using ArgoCD. This project is designed for advanced-level DevOps engineers who want to gain hands-on experience with declarative deployments and version-controlled infrastructure.

## Prerequisites

- Advanced knowledge of Kubernetes
- Familiarity with GitOps principles
- A Kubernetes cluster set up (e.g., Minikube, GKE, EKS)
- ArgoCD installed on your Kubernetes cluster
- A sample project repository

## Project Structure

- `argocd`: This directory contains the ArgoCD configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/29-GitOps-Workflow-with-ArgoCD
   ```

2. Create an `argocd` directory in the project directory and add the configuration files for ArgoCD.

## Example ArgoCD Configuration

### 1. ArgoCD Application

This configuration sets up an ArgoCD application to manage a Kubernetes deployment.

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: my-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: 'https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git'
    targetRevision: HEAD
    path: Advanced-Level-Projects/29-GitOps-Workflow-with-ArgoCD/argocd
  destination:
    server: 'https://kubernetes.default.svc'
    namespace: default
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

## Applying the Configuration

1. Apply the ArgoCD application configuration:
   ```bash
   kubectl apply -f argocd/application.yaml
   ```

2. Verify that the application has been created successfully:
   ```bash
   kubectl get applications -n argocd
   ```

## Conclusion

By completing this project, you will have gained a solid understanding of how to implement a GitOps workflow using ArgoCD. Feel free to modify the example configurations and create your own GitOps configurations to further enhance your skills.
