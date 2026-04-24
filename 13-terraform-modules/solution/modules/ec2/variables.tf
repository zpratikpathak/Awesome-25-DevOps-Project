variable "ami_id" {
  description = "AMI ID to deploy"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "server_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}
