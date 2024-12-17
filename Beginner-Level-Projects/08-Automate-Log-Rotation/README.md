# Automate Log Rotation

## Overview

In this project, you will learn how to automate log rotation to manage log files efficiently. This project is designed for beginners who want to get started with log management and automation.

## Prerequisites

- Basic knowledge of the command line
- A Unix-based operating system (Linux or macOS)
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `logrotate.conf`: This file contains the logrotate configuration.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/08-Automate-Log-Rotation
   ```

2. Create a `logrotate.conf` file in the project directory and open it in your text editor.

## Example Logrotate Configuration

### 1. Basic Logrotate Configuration

This configuration rotates the log files daily and keeps the last 7 days of logs.

```conf
/var/log/myapp/*.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
    create 0640 root root
    sharedscripts
    postrotate
        systemctl reload myapp > /dev/null 2>&1 || true
    endscript
}
```

### 2. Custom Logrotate Script

This script rotates the log files and sends an email notification after rotation.

```bash
#!/bin/bash

# Log file to rotate
LOG_FILE="/var/log/myapp/myapp.log"

# Rotate the log file
mv "$LOG_FILE" "$LOG_FILE.$(date +%Y%m%d%H%M%S)"
touch "$LOG_FILE"
chmod 0640 "$LOG_FILE"
chown root:root "$LOG_FILE"

# Compress the rotated log file
gzip "$LOG_FILE.$(date +%Y%m%d%H%M%S)"

# Send email notification
echo "Log file rotated: $LOG_FILE" | mail -s "Log Rotation Notification" your-email@example.com
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to automate log rotation using logrotate and custom scripts. Feel free to modify the example configuration and scripts to further enhance your skills.
