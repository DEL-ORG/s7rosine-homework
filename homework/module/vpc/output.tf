output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value       = aws_subnet.private[*].id
}

output "nat_gateway_ids" {
  description = "IDs of NAT Gateways"
  value       = aws_nat_gateway.nat[*].id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.my_igw.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.*.id
}

output "private_route_table_ids" {
  description = "The IDs of private route tables"
   value       = aws_route_table.private.*.id
}
# Output for public route table associations
output "public_route_table_association_ids" {
  description = "The IDs of the route table associations for public subnets"
  value       = aws_route_table_association.public.*.id
}
# Output for private route table associations
output "private_route_table_association_ids" {
  description = "The IDs of the route table associations for private subnets"
  value       = aws_route_table_association.private.*.id
}
