# Automate Infrastructure Provisioning

## Overview

In this project, you will learn how to automate infrastructure provisioning using Terraform and Ansible. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with Infrastructure as Code (IaC) and configuration management.

## Prerequisites

- Basic knowledge of Terraform and Ansible
- Terraform installed on your machine
- Ansible installed on your machine
- Access to a cloud provider (e.g., AWS, Azure, GCP)

## Project Structure

- `main.tf`: This file contains the main Terraform configuration.
- `variables.tf`: This file contains the variable definitions.
- `outputs.tf`: This file contains the output definitions.
- `ansible-playbook.yml`: This file contains the Ansible playbook for configuration management.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/20-Automate-Infrastructure-Provisioning
   ```

2. Initialize the Terraform working directory:
   ```bash
   terraform init
   ```

3. Create a `main.tf` file in the project directory and open it in your text editor.

## Example Terraform Configuration

### 1. Basic AWS EC2 Instance

This configuration creates an EC2 instance.

```hcl
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
```

### 2. Variables and Outputs

This configuration uses variables and outputs to make the Terraform code more flexible and reusable.

```hcl
# variables.tf
variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}

variable "instance_type" {
  description = "The type of instance to deploy"
  default     = "t2.micro"
}

# main.tf
provider "aws" {
  region = var.region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type

  tags = {
    Name = "example-instance"
  }
}

# outputs.tf
output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.example.id
}
```

## Applying the Configuration

1. Apply the Terraform configuration to create the resources:
   ```bash
   terraform apply
   ```

2. Confirm the apply action by typing `yes` when prompted.

3. Verify that the resources have been created successfully.

## Example Ansible Playbook

### 1. Basic Ansible Playbook

This playbook installs and configures Nginx on the EC2 instance.

```yaml
---
- name: Configure EC2 instance
  hosts: all
  become: yes
  tasks:
    - name: Install Nginx
      apt:
        name: nginx
        state: present

    - name: Start Nginx
      service:
        name: nginx
        state: started
        enabled: yes
```

## Running the Ansible Playbook

1. Run the Ansible playbook to configure the EC2 instance:
   ```bash
   ansible-playbook -i <inventory_file> ansible-playbook.yml
   ```

2. Verify that Nginx has been installed and started successfully.

## Conclusion

By completing this project, you will have gained a solid understanding of how to automate infrastructure provisioning using Terraform and Ansible. Feel free to modify the example configurations and create your own Terraform and Ansible configurations to further enhance your skills.
