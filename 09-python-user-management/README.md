# Project: Automating User Management with Python

## Description
Automation is key in DevOps. This project uses Python to automate the creation and management of user accounts on a Linux system, demonstrating how to use Python for system administration.

## Objectives
- Use the `os` and `subprocess` modules in Python.
- Create users from a list in a text file.
- Set default passwords and home directories.
- Log successes and failures.

## Prerequisites
- Python 3.x installed
- Root/Sudo privileges (since it modifies system users)

## How to Run
1. Navigate to the `solution` folder.
2. Prepare a `users.txt` with names (one per line).
3. Run the script: `sudo python3 user_manager.py`
