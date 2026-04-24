# Project: Multi-Stage Docker Builds

## Description
Production images should be as small as possible to reduce attack surface and deployment time. This project demonstrates Multi-Stage builds to create an optimized Go application image.

## Objectives
- Understand the difference between build-time and run-time dependencies.
- Write a Dockerfile with multiple `FROM` instructions.
- Compare image sizes between single-stage and multi-stage builds.

## Prerequisites
- Docker installed

## How to Run
1. Navigate to the `solution` folder.
2. Build the optimized image: `docker build -t go-app-optimized .`
3. Check image size: `docker images | grep go-app-optimized`
