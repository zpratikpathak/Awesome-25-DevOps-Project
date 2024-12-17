# Infrastructure as Code on Multi-Cloud

## Overview

In this project, you will learn how to manage infrastructure across multiple cloud providers using Terraform. This project is designed for advanced-level DevOps engineers who want to gain hands-on experience with multi-cloud infrastructure management.

## Prerequisites

- Advanced knowledge of Terraform
- Accounts with multiple cloud providers (e.g., AWS, Azure, GCP)
- Terraform installed on your machine
- A text editor (e.g., Vim, Nano, or VS Code)

## Project Structure

- `main.tf`: This file contains the main Terraform configuration.
- `variables.tf`: This file contains the variable definitions.
- `outputs.tf`: This file contains the output definitions.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Advanced-Level-Projects/22-Infrastructure-as-Code-on-Multi-Cloud
   ```

2. Initialize the Terraform working directory:
   ```bash
   terraform init
   ```

3. Create a `main.tf` file in the project directory and open it in your text editor.

## Example Terraform Configuration

### 1. Multi-Cloud Configuration

This configuration creates resources across multiple cloud providers.

```hcl
provider "aws" {
  region = "us-west-2"
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = "my-gcp-project"
  region  = "us-central1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West US"
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
```

### 2. Variables and Outputs

This configuration uses variables and outputs to make the Terraform code more flexible and reusable.

```hcl
# variables.tf
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  default     = "us-west-2"
}

variable "azure_location" {
  description = "The Azure location to deploy resources in"
  default     = "West US"
}

variable "gcp_project" {
  description = "The GCP project to deploy resources in"
  default     = "my-gcp-project"
}

variable "gcp_region" {
  description = "The GCP region to deploy resources in"
  default     = "us-central1"
}

# main.tf
provider "aws" {
  region = var.aws_region
}

provider "azurerm" {
  features {}
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.azure_location
}

resource "google_compute_instance" "example" {
  name         = "example-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}

# outputs.tf
output "aws_instance_id" {
  description = "The ID of the AWS EC2 instance"
  value       = aws_instance.example.id
}

output "azure_resource_group_name" {
  description = "The name of the Azure resource group"
  value       = azurerm_resource_group.example.name
}

output "gcp_instance_name" {
  description = "The name of the GCP compute instance"
  value       = google_compute_instance.example.name
}
```

## Applying the Configuration

1. Apply the Terraform configuration to create the resources:
   ```bash
   terraform apply
   ```

2. Confirm the apply action by typing `yes` when prompted.

3. Verify that the resources have been created successfully.

## Conclusion

By completing this project, you will have gained a solid understanding of how to manage infrastructure across multiple cloud providers using Terraform. Feel free to modify the example configurations and create your own multi-cloud Terraform configurations to further enhance your skills.
