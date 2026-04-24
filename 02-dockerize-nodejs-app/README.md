# Project: Dockerizing a Simple Node.js App

## Description
Learn the basics of containerization by Dockerizing a simple Node.js web server. This project covers writing a Dockerfile, building images, and running containers.

## Objectives
- Create a basic Node.js Express server.
- Write a `Dockerfile` with best practices.
- Build and run the Docker image.
- Map host ports to container ports.

## Prerequisites
- Docker installed locally
- Node.js (optional, as we use Docker for building)

## How to Run
1. Navigate to the `solution` folder.
2. Build the image: `docker build -t node-app .`
3. Run the container: `docker run -p 3000:3000 node-app`
4. Access the app at `http://localhost:3000`
