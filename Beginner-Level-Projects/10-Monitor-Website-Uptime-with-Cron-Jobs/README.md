# Monitor Website Uptime with Cron Jobs

## Overview

In this project, you will learn how to monitor the uptime of a website using cron jobs. This project is designed for beginners who want to get started with website monitoring and automation.

## Prerequisites

- Basic knowledge of the command line
- A Unix-based operating system (Linux or macOS)
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `scripts/`: This folder contains example monitoring scripts.
- `cron/`: This folder contains example cron job configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/10-Monitor-Website-Uptime-with-Cron-Jobs
   ```

2. Navigate to the `scripts/` folder:
   ```bash
   cd scripts
   ```

3. Open the example scripts in your text editor and follow the instructions in the comments to understand how they work.

## Example Scripts

### 1. Website Uptime Monitoring Script

This script checks the uptime of a specified website and sends an alert if the website is down.

```bash
#!/bin/bash

# Website URL to monitor
URL="http://example.com"

# Email address to send alerts
EMAIL="your-email@example.com"

# Check website status
STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")

# Send alert if the website is down
if [ "$STATUS" -ne 200 ]; then
  echo "Website $URL is down. Status code: $STATUS" | mail -s "Website Down Alert" "$EMAIL"
fi
```

## Example Cron Job Configuration

### 1. Cron Job to Run the Monitoring Script

This cron job runs the website uptime monitoring script every 5 minutes.

```cron
*/5 * * * * /path/to/scripts/monitor_website.sh
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to monitor the uptime of a website using cron jobs. Feel free to modify the example scripts and cron job configurations to further enhance your skills.
