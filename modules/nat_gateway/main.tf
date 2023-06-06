
# Create an Elastic IP, which will be associated with the NAT gateway.
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "estar_nat_eip"
  }
}

# Create a Public NAT Gateway inside the first public subnet (aws_subnet.public_subnet[0]).
resource "aws_nat_gateway" "nat_gateway" {
  connectivity_type = "public"
  allocation_id     = aws_eip.nat_eip.id
  subnet_id         = var.public_subnet_ids[0]
  depends_on        = [var.internet_gateway]
}

# Update the route table of the private subnets to route outbound traffic (0.0.0.0/0) through the NAT gateway.
resource "aws_route_table_association" "private_subnet_route_association" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = var.estar_vpc.default_route_table_id
}

# Create a route in default route table
resource "aws_route" "private_subnet_route" {
  route_table_id         = var.estar_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
