# Automate Package Installation

## Overview

In this project, you will learn how to automate package installation using shell scripts. This project is designed for beginners who want to get started with package management and automation.

## Prerequisites

- Basic knowledge of the command line
- A Unix-based operating system (Linux or macOS)
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `scripts/`: This folder contains example scripts for package management.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/05-Automate-Package-Installation
   ```

2. Navigate to the `scripts/` folder:
   ```bash
   cd scripts
   ```

3. Open the example scripts in your text editor and follow the instructions in the comments to understand how they work.

## Example Scripts

### 1. Install Packages Script

This script installs a list of packages using the package manager.

```bash
#!/bin/bash

# List of packages to install
PACKAGES=(
  "curl"
  "git"
  "vim"
  "htop"
)

# Update package list
sudo apt-get update

# Install packages
for PACKAGE in "${PACKAGES[@]}"; do
  sudo apt-get install -y "$PACKAGE"
done

echo "Package installation completed successfully."
```

### 2. Remove Packages Script

This script removes a list of packages using the package manager.

```bash
#!/bin/bash

# List of packages to remove
PACKAGES=(
  "curl"
  "git"
  "vim"
  "htop"
)

# Remove packages
for PACKAGE in "${PACKAGES[@]}"; do
  sudo apt-get remove -y "$PACKAGE"
done

echo "Package removal completed successfully."
```

### 3. Check Package Installation Script

This script checks if a list of packages is installed and installs them if they are not.

```bash
#!/bin/bash

# List of packages to check
PACKAGES=(
  "curl"
  "git"
  "vim"
  "htop"
)

# Update package list
sudo apt-get update

# Check and install packages
for PACKAGE in "${PACKAGES[@]}"; do
  if ! dpkg -l | grep -q "$PACKAGE"; then
    sudo apt-get install -y "$PACKAGE"
    echo "$PACKAGE installed successfully."
  else
    echo "$PACKAGE is already installed."
  fi
done

echo "Package check and installation completed successfully."
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to automate package installation using shell scripts. Feel free to modify the example scripts and create your own automation scripts to further enhance your skills.
