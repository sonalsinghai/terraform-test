# main.tf

# Define configuration aliases for different AWS regions
provider "aws" {
  region = "eu-west-2" # Update with your desired region
  # shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "estar"
}

# Get the list of availability zones in the region
data "aws_availability_zones" "available" {
  state = "available"
}

# Module for creating VPC
module "vpc" {
  source = "./modules/vpc"

  for_each = { for config in var.vpc_configs : config.name => config }

  vpc_name             = each.value.name
  vpc_cidr_block       = each.value.cidr_block
  aws_available_azs    = data.aws_availability_zones.available.names
  public_subnet_count  = min(each.value.public_subnet_count, length(data.aws_availability_zones.available.names))
  private_subnet_count = min(each.value.private_subnet_count, length(data.aws_availability_zones.available.names))
  subnet_cidr_offset   = each.value.subnet_cidr_offset
}

# Module for creating NAT Gateway
module "nat_gateway" {
  source = "./modules/nat_gateway"

  for_each = module.vpc

  estar_vpc          = each.value.estar_vpc
  aws_available_azs  = data.aws_availability_zones.available.names
  public_subnet_ids  = each.value.public_subnet_ids
  private_subnet_ids = each.value.private_subnet_ids
  internet_gateway   = each.value.internet_gateway
}
