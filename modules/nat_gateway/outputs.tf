
output "nat_gateway_id" {
  value       = aws_nat_gateway.nat_gateway.id
  description = "A string with value of the NAT gateway Id."
}
