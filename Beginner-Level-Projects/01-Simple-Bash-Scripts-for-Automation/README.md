# Simple Bash Scripts for Automation

## Overview

In this project, you will learn the basics of shell scripting and how to automate administrative tasks using Bash scripts. This project is designed for beginners who want to get started with scripting and automation.

## Prerequisites

- Basic knowledge of the command line
- A Unix-based operating system (Linux or macOS)
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `scripts/`: This folder contains example Bash scripts for various automation tasks.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/01-Simple-Bash-Scripts-for-Automation
   ```

2. Navigate to the `scripts/` folder:
   ```bash
   cd scripts
   ```

3. Open the example scripts in your text editor and follow the instructions in the comments to understand how they work.

## Example Scripts

### 1. Hello World Script

This script prints "Hello, World!" to the terminal.

```bash
#!/bin/bash
echo "Hello, World!"
```

### 2. Backup Script

This script creates a backup of a specified directory.

```bash
#!/bin/bash

# Directory to back up
SOURCE_DIR="/path/to/source"

# Backup destination
DEST_DIR="/path/to/backup"

# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Create a backup
tar -czvf "$DEST_DIR/backup_$TIMESTAMP.tar.gz" "$SOURCE_DIR"

echo "Backup completed successfully."
```

### 3. System Update Script

This script updates the system packages.

```bash
#!/bin/bash

# Update package list
sudo apt-get update

# Upgrade packages
sudo apt-get upgrade -y

echo "System update completed successfully."
```

### 4. Disk Usage Script

This script checks the disk usage and sends an alert if the usage exceeds a specified threshold.

```bash
#!/bin/bash

# Threshold percentage
THRESHOLD=80

# Get the current disk usage percentage
USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Check if the usage exceeds the threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "Disk usage is above $THRESHOLD%. Current usage: $USAGE%."
else
  echo "Disk usage is below $THRESHOLD%. Current usage: $USAGE%."
fi
```

## Conclusion

By completing this project, you will have gained a solid understanding of Bash scripting and how to automate various administrative tasks. Feel free to modify the example scripts and create your own automation scripts to further enhance your skills.
