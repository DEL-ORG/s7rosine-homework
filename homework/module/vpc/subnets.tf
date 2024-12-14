# Public Subnets
resource "aws_subnet" "public" {
  count = 3

  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = element(var.public_subnet_cidrs, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)

  tags = merge(var.common_tags, 
    {Name = format("%s-%s-%s-${count.index}-vpc", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )   
}

# Private Subnets
resource "aws_subnet" "private" {
  count = 3

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = merge(var.common_tags, 
    {Name = format("%s-%s-%s-${count.index}-vpc", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )   
}