terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "azurerm" {
  features {}
}

# AWS Resource Example: S3 Bucket
resource "aws_s3_bucket" "multicloud_bucket" {
  bucket = "my-multicloud-aws-bucket-demo-2026"
  
  tags = {
    Environment = "Dev"
    Project     = "Multicloud"
  }
}

# Azure Resource Example: Resource Group
resource "azurerm_resource_group" "multicloud_rg" {
  name     = "multicloud-rg"
  location = "East US"

  tags = {
    Environment = "Dev"
    Project     = "Multicloud"
  }
}
