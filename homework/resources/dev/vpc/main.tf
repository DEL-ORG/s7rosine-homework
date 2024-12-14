terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

locals {
  aws_region         = "us-east-1"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidrs = [
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24"
  ]
  private_subnet_cidrs = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24"
  ]
  availability_zones  = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
  common_tags = {
    id             = "2008"
    owner          = "katya"
    environment    = "dev"
    project        = "springboot"
    create_by      = "Terraform"
    cloud_provider = "aws"
    company        = "EKS"
  }
}

module "vpc" {
  source = "../../../module/vpc/vpc" # Replace with the actual module path


  vpc_cidr             = local.vpc_cidr
  public_subnet_cidrs  = local.public_subnet_cidrs
  private_subnet_cidrs = local.private_subnet_cidrs
  availability_zones   = local.availability_zones
  common_tags          = local.common_tags
}
