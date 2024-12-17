# Simple Server Provisioning with Ansible

## Overview

In this project, you will learn how to use Ansible to provision and configure servers. This project is designed for beginners who want to get started with Infrastructure as Code (IaC) using Ansible.

## Prerequisites

- Basic knowledge of the command line
- Ansible installed on your machine
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `playbooks/`: This folder contains example Ansible playbooks for server provisioning.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/07-Simple-Server-Provisioning-with-Ansible
   ```

2. Navigate to the `playbooks/` folder:
   ```bash
   cd playbooks
   ```

3. Open the example playbooks in your text editor and follow the instructions in the comments to understand how they work.

## Example Playbooks

### 1. Basic Server Setup

This playbook installs common packages and updates the system.

```yaml
---
- name: Basic Server Setup
  hosts: all
  become: yes
  tasks:
    - name: Update and upgrade apt packages
      apt:
        update_cache: yes
        upgrade: dist

    - name: Install common packages
      apt:
        name:
          - curl
          - git
          - vim
        state: present
```

### 2. Web Server Setup

This playbook installs and configures a web server (Nginx).

```yaml
---
- name: Web Server Setup
  hosts: webservers
  become: yes
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Start and enable Nginx service
      systemd:
        name: nginx
        state: started
        enabled: yes
```

### 3. Database Server Setup

This playbook installs and configures a database server (MySQL).

```yaml
---
- name: Database Server Setup
  hosts: dbservers
  become: yes
  tasks:
    - name: Install MySQL server
      apt:
        name: mysql-server
        state: present

    - name: Start and enable MySQL service
      systemd:
        name: mysql
        state: started
        enabled: yes

    - name: Secure MySQL installation
      mysql_secure_installation:
        login_user: root
        login_password: ''
        new_password: 'your_secure_password'
        remove_anonymous_users: yes
        disallow_root_login_remotely: yes
        remove_test_db: yes
        state: present
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to use Ansible for server provisioning and configuration. Feel free to modify the example playbooks and create your own playbooks to further enhance your skills.
