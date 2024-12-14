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
  aws_region    = "us-east-1"
  instance_type = "t2.micro"
  key_name      = "jenkins"
  resource_type = "ec2_instance"
  common_tags   = {
    resource_type  = "ec2"
    environment    = "dev"
    owner          = "katya"
    project        = "healthcare"
    create_by      = "Terraform"
    cloud_provider = "aws"
    company        = "EKS"
  }
}

module "ec2_instance" {
<<<<<<< HEAD
  source        = "../../../module/ec2-bastion-host"  # Replace with the actual module path
=======
  source        = "../../../module/EC2-code1"  # Replace with the actual module path
>>>>>>> 95f7ec65e28b2df41e8ee53ec6433e76fc3990ea
  
  aws_region    = local.aws_region
  instance_type = local.instance_type
  key_name      = local.key_name
<<<<<<< HEAD
=======
  resource_type = local.resource_type
>>>>>>> 95f7ec65e28b2df41e8ee53ec6433e76fc3990ea
  common_tags   = local.common_tags
}
