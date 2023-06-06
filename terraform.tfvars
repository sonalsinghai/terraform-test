# terraform.tfvars

vpc_configs = [
  {
    name                 = "vpc-1"
    cidr_block           = "10.0.0.0/16"
    public_subnet_count  = 3
    private_subnet_count = 3
    # In this use-case, subnet_cidr_offset with value of 1 will make sure that private subnet IP range starts beyond last of public subnet IP range
    subnet_cidr_offset = 1
  },
  {
    name                 = "vpc-2"
    cidr_block           = "10.1.0.0/16"
    public_subnet_count  = 2
    private_subnet_count = 2
    # subnet_cidr_offset with value of 1 will make sure that private subnet IP range starts beyond last of public subnet IP range
    subnet_cidr_offset = 1
  }
]
