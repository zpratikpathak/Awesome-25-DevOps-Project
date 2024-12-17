# Deploy a Static Website with Docker

## Overview

In this project, you will learn how to deploy a static website using Docker. This project is designed for beginners who want to get started with containerization and Docker.

## Prerequisites

- Basic knowledge of the command line
- Docker installed on your machine
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `Dockerfile`: This file contains the instructions to build the Docker image.
- `index.html`: This file contains the HTML code for the static website.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/03-Deploy-a-Static-Website-with-Docker
   ```

2. Create a `Dockerfile` in the project directory and open it in your text editor.

## Example Dockerfile

### 1. Basic Dockerfile

This Dockerfile sets up a simple Nginx server to serve the static website.

```Dockerfile
# Use the official Nginx image as the base image
FROM nginx:alpine

# Copy the static website files to the Nginx HTML directory
COPY index.html /usr/share/nginx/html

# Expose port 80 to allow access to the website
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
```

## Building and Running the Docker Container

1. Build the Docker image:
   ```bash
   docker build -t static-website .
   ```

2. Run the Docker container:
   ```bash
   docker run -d -p 80:80 static-website
   ```

3. Open your web browser and navigate to `http://localhost` to see the static website.

## Conclusion

By completing this project, you will have gained a solid understanding of how to deploy a static website using Docker. Feel free to modify the example Dockerfile and create your own Docker images to further enhance your skills.
