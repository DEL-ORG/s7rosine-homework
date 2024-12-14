# Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = merge(var.common_tags, 
    {Name = format("%s-%s-%s-vpc", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )   
}