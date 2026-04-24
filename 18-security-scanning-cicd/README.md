# Project: Security Scanning in CI/CD (DevSecOps)

## Description
Security should not be an afterthought. This project integrates security scanning into a CI/CD pipeline using Trivy (for container image scanning) and SonarQube (for static code analysis).

## Objectives
- Scan Docker images for vulnerabilities using Trivy.
- Perform Static Application Security Testing (SAST) with SonarQube.
- Fail the pipeline if "High" or "Critical" vulnerabilities are found.

## Prerequisites
- Docker
- A CI tool (GitHub Actions or Jenkins)

## How to Run
1. Run a local Trivy scan: `trivy image my-app:latest`.
2. Review the `pipeline-example.yml` in the `solution` folder to see how to integrate these tools into GitHub Actions.
