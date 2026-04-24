# Project: Service Mesh with Istio

## Description
As microservices grow, managing communication, security, and observability becomes complex. Istio provides a service mesh to handle these challenges without changing application code.

## Objectives
- Install Istio on Kubernetes using `istioctl`.
- Deploy the "Bookinfo" sample application.
- Configure an Ingress Gateway and VirtualService.
- Use Kiali to visualize the service graph.

## Prerequisites
- Kubernetes cluster with at least 4 nodes (recommended)
- Istio CLI (`istioctl`) installed

## How to Run
1. Install Istio: `istioctl install --set profile=demo -y`.
2. Label your namespace for injection: `kubectl label namespace default istio-injection=enabled`.
3. Apply manifests in the `solution` folder.
4. Access the Kiali dashboard to see traffic flow.
