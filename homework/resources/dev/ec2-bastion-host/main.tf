locals {
  aws_region    = "us-east-1"
  instance_type = "t2.micro"
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
  source        = "../../../module/ec2-bastion-host"  # Replace with the actual module path
  
  aws_region    = local.aws_region
  instance_type = local.instance_type
  common_tags   = local.common_tags
}