# Variables for the module
variable "vpc_configs" {
  description = "List of VPC configurations"
  type = list(object({
    name                 = string
    cidr_block           = string
    public_subnet_count  = number
    private_subnet_count = number
    subnet_cidr_offset   = number
  }))
}
