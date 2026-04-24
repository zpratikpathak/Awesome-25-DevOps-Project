# Project: Ansible for Automated Server Configuration

## Description
Ansible is a powerful agentless tool for configuration management. This project uses an Ansible playbook to configure a fleet of servers (or a local VM) with Nginx, a custom index page, and security hardening.

## Objectives
- Write an Ansible inventory file.
- Create a playbook with tasks for package installation and file templating.
- Use Ansible variables and handlers.
- Run the playbook against a target host.

## Prerequisites
- Ansible installed locally
- SSH access to a target Linux machine (or local machine)

## How to Run
1. Navigate to the `solution` folder.
2. Update the `hosts.ini` file with your server IP.
3. Run the playbook: `ansible-playbook -i hosts.ini site.yml`
