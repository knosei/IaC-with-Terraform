########################################
# Terraform & Backend Configuration
########################################
terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-kno"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

########################################
# AWS Provider
########################################
provider "aws" {
  region = "us-east-1"
}


########################################
# RDS Subnet Group (FIXED: 2 AZs)
########################################
resource "aws_db_subnet_group" "db_subnet_group" {
  name = "db-subnet-group"

  subnet_ids = [
    aws_subnet.public.id,
    aws_subnet.public_2.id
  ]

  tags = {
    Name = "db-subnet-group"
  }
}

########################################
# RDS Instance (MySQL)
########################################
resource "aws_db_instance" "db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "appdb"
  username             = "admin"
  password             = "password123"
  publicly_accessible  = true
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "terraform-rds"
  }
}