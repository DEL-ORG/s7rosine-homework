# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(var.common_tags, 
    {Name = format("%s-%s-%s-vpc", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )   
}



