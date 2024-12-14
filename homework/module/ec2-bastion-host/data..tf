# Data resources for existing VPC and subnets
data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["my-vpc-bh"] # The name of your existing VPC
  }
}

data "aws_subnet" "public_subnet" {
  filter {
    name   = "tag:Name"
    values = ["public-subnet"] # The name of your existing public subnet
  }
  vpc_id = data.aws_vpc.my_vpc.id
}

data "aws_subnet" "private_subnet" {
  filter {
    name   = "tag:Name"
    values = ["private-subnet"] # The name of your existing private subnet
  }
  vpc_id = data.aws_vpc.my_vpc.id
}


# Reference to the existing Jenkins key pair (corrected)
data "aws_key_pair" "jenkins_key" {
  key_name = "jenkins" # The existing Jenkins key pair
}

# Data source to fetch the existing "terra-sg" security group by its name
data "aws_security_group" "public-ec2-sg" {
  filter {
    name   = "tag:Name"
    values = ["public-ec2-sg"] # The existing security group name
  }
  vpc_id = data.aws_vpc.my_vpc.id
}
