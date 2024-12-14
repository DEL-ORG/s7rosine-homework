resource "aws_nat_gateway" "nat" {
  count = 3

  allocation_id        = aws_eip.nat-eip[count.index].id
  subnet_id            = aws_subnet.public[count.index].id
  connectivity_type    = "public"

  tags = merge(var.common_tags, 
    {Name = format("%s-%s-%s-vpc", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )   
}