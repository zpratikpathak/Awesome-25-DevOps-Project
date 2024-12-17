# Basic CI/CD Pipeline with GitHub Actions

## Overview

In this project, you will learn how to set up a basic CI/CD pipeline using GitHub Actions. This project is designed for beginners who want to get started with continuous integration and continuous deployment.

## Prerequisites

- Basic knowledge of Git and GitHub
- A GitHub account
- A sample project repository

## Project Structure

- `.github/workflows/`: This folder contains the GitHub Actions workflow files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/02-Basic-CI-CD-Pipeline-with-GitHub-Actions
   ```

2. Navigate to the `.github/workflows/` folder:
   ```bash
   cd .github/workflows
   ```

3. Create a new workflow file (e.g., `ci-cd-pipeline.yml`) and open it in your text editor.

## Example Workflow

### 1. Basic CI Workflow

This workflow runs tests on every push to the `main` branch.

```yaml
name: CI

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Node.js
        uses: actions/setup-node@v2
        with:
          node-version: '14'

      - name: Install dependencies
        run: npm install

      - name: Run tests
        run: npm test
```

### 2. Basic CD Workflow

This workflow deploys the application to GitHub Pages on every push to the `main` branch.

```yaml
name: CD

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Build project
        run: npm run build

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up a basic CI/CD pipeline using GitHub Actions. Feel free to modify the example workflows and create your own workflows to further enhance your skills.
