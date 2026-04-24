provider "aws" {
  alias  = "primary"
  region = "us-east-1"
}

provider "aws" {
  alias  = "secondary"
  region = "us-west-2"
}

resource "aws_db_instance" "primary" {
  provider             = aws.primary
  identifier           = "primary-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "password123"
  skip_final_snapshot  = true
  backup_retention_period = 7
}

resource "aws_db_instance" "replica" {
  provider             = aws.secondary
  identifier           = "replica-db"
  replicate_source_db  = aws_db_instance.primary.arn
  instance_class       = "db.t3.micro"
  skip_final_snapshot  = true
}

resource "aws_route53_health_check" "primary" {
  fqdn              = "primary.example.com"
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = "3"
  request_interval  = "30"
}

resource "aws_route53_record" "primary" {
  zone_id = "Z1234567890ABC"
  name    = "app.example.com"
  type    = "A"
  ttl     = "60"
  records = ["10.0.0.1"]
  
  failover_routing_policy {
    type = "PRIMARY"
  }
  
  set_identifier  = "primary"
  health_check_id = aws_route53_health_check.primary.id
}

resource "aws_route53_record" "secondary" {
  zone_id = "Z1234567890ABC"
  name    = "app.example.com"
  type    = "A"
  ttl     = "60"
  records = ["10.0.0.2"]
  
  failover_routing_policy {
    type = "SECONDARY"
  }
  
  set_identifier = "secondary"
}
