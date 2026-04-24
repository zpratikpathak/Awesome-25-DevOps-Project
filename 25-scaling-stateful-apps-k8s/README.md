# Project: Scaling Stateful Applications on Kubernetes

## Description
Stateless apps are easy to scale; stateful apps are hard. This project focuses on scaling a MongoDB or MySQL cluster on Kubernetes using `StatefulSets` and `PersistentVolumeClaims` (PVCs).

## Objectives
- Understand the difference between `Deployment` and `StatefulSet`.
- Deploy a 3-node MongoDB replica set.
- Scale the replica set and observe how identities and storage are preserved.
- Simulate a pod failure and observe the self-healing of the stateful pod.

## Prerequisites
- Kubernetes cluster with Dynamic Volume Provisioning enabled

## How to Run
1. Apply the `StatefulSet` manifest in the `solution` folder.
2. Run `kubectl get pods -w` to watch the sequential startup.
3. Scale the set: `kubectl scale statefulset mongo --replicas=5`.
