
output "estar_vpc" {
  value = aws_vpc.estar_vpc
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}

output "internet_gateway" {
  value = aws_internet_gateway.estar_ig
}
