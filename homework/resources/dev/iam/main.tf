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
  aws_region   = "us-east-1"
  group_name   = "STUDENT-GROUP"
  user_list    = ["user1", "user2", "user3"]
  policy_arn   = "arn:aws:iam::aws:policy/AdministratorAccess"
  common_tags = {
<<<<<<< HEAD
    name           = each.key
=======
>>>>>>> 95f7ec65e28b2df41e8ee53ec6433e76fc3990ea
    owner          = "EK TECH SOFTWARE SOLUTION"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}
module "iam_users_and_group" {
  source      = "../../../module/iam" # Replace with the actual module path
  aws_region  = local.aws_region
  group_name  = local.group_name
  user_list   = local.user_list
  policy_arn  = local.policy_arn
  common_tags = local.common_tags
}

