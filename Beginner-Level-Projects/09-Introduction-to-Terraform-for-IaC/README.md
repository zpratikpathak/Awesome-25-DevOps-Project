# Introduction to Terraform for IaC

## Overview

In this project, you will learn the basics of Infrastructure as Code (IaC) using Terraform. This project is designed for beginners who want to get started with provisioning and managing cloud resources using Terraform.

## Prerequisites

- Basic knowledge of the command line
- A cloud provider account (e.g., AWS, Azure, GCP)
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
   cd Awesome-25-DevOps-Project/Beginner-Level-Projects/09-Introduction-to-Terraform-for-IaC
   ```

2. Initialize the Terraform working directory:
   ```bash
   terraform init
   ```

3. Create a `main.tf` file in the project directory and open it in your text editor.

## Example Terraform Configuration

### 1. Basic AWS EC2 Instance

This configuration creates a basic AWS EC2 instance.

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

## Conclusion

By completing this project, you will have gained a solid understanding of how to use Terraform for Infrastructure as Code (IaC). Feel free to modify the example configurations and create your own Terraform configurations to further enhance your skills.
