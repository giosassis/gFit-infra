provider "aws" {
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_access_key
}

module "security_group" {
  source = "./securitygroup.tf"
}

module "database" {
  source = "./database"
}

module "ec2" {
  source = "./ec2"
}

module "s3" {
  source = "./s3"
}