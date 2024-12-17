# Automate Database Backups with Shell Scripts

## Overview

In this project, you will learn how to automate database backups using shell scripts. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with database management and automation.

## Prerequisites

- Basic knowledge of shell scripting
- Access to a database (e.g., MySQL, PostgreSQL)
- Cloud storage account (e.g., AWS S3, Google Cloud Storage)

## Project Structure

- `backup.sh`: This file contains the shell script for automating database backups.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/13-Automate-Database-Backups-with-Shell-Scripts
   ```

2. Create a `backup.sh` file in the project directory and open it in your text editor.

## Example Backup Script

### 1. Basic MySQL Backup Script

This script creates a backup of a MySQL database and uploads it to AWS S3.

```bash
#!/bin/bash

# Database credentials
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"
DB_NAME="your_db_name"

# S3 bucket name
S3_BUCKET="your_s3_bucket_name"

# Backup file name
BACKUP_FILE="backup-$(date +%Y-%m-%d).sql"

# Create a backup
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

# Upload the backup to S3
aws s3 cp $BACKUP_FILE s3://$S3_BUCKET/

# Remove the local backup file
rm $BACKUP_FILE
```

### 2. PostgreSQL Backup Script

This script creates a backup of a PostgreSQL database and uploads it to Google Cloud Storage.

```bash
#!/bin/bash

# Database credentials
DB_USER="your_db_user"
DB_PASSWORD="your_db_password"
DB_NAME="your_db_name"

# GCS bucket name
GCS_BUCKET="your_gcs_bucket_name"

# Backup file name
BACKUP_FILE="backup-$(date +%Y-%m-%d).sql"

# Create a backup
PGPASSWORD=$DB_PASSWORD pg_dump -U $DB_USER $DB_NAME > $BACKUP_FILE

# Upload the backup to GCS
gsutil cp $BACKUP_FILE gs://$GCS_BUCKET/

# Remove the local backup file
rm $BACKUP_FILE
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to automate database backups using shell scripts. Feel free to modify the example scripts and create your own backup scripts to further enhance your skills.
