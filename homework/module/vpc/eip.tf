resource "aws_eip" "nat-eip" {
  count = 3 # Assuming you want 3 NAT Gateways (one per private subnet/AZ)
  vpc   = true

  tags = merge(var.common_tags,
    {Name = format("%s-%s-%s-vpc", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )   
}
