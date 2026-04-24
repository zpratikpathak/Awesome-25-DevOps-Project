provider "aws" {
  region = "us-east-1"
}

# Web Tier (EC2 in Public Subnet)
resource "aws_instance" "web" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  subnet_id     = "subnet-public1"
  tags = {
    Name = "WebTier"
  }
}

# App Tier (ALB)
resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  subnets            = ["subnet-public1", "subnet-public2"]
}

# DB Tier (RDS)
resource "aws_db_instance" "database" {
  allocated_storage   = 20
  engine              = "mysql"
  engine_version      = "8.0"
  instance_class      = "db.t3.micro"
  username            = "admin"
  password            = "password123"
  skip_final_snapshot = true
}
