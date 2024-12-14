data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["default-vpc"] # Replace with the actual Name tag value of your VPC
  }
}

data "aws_subnet" "subnet" {
  filter {
    name   = "tag:Name"
    values = ["subnet1"] # Corrected the missing closing quote
  }
}

data "aws_security_group" "existing_sg" {
  name = "terra-sg"
}
