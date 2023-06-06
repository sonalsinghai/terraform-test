# modules/vpc/main.tf

# Create an AWS VPC. The VPC should have a CIDR block of 10.0.0.0/16, which we will populate as a var.
resource "aws_vpc" "estar_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "estar_ig" {
  vpc_id = aws_vpc.estar_vpc.id

  tags = {
    Name = "estar_ig"
  }
}


# Create `/24` public subnets, one for each availability zone in the region up to a max of 3
resource "aws_subnet" "public_subnet" {
  # Count will go upto a maximum of var.public_subnet_count, whose default value is 3
  count = var.public_subnet_count

  vpc_id = aws_vpc.estar_vpc.id
  # Will create a /24 public subnet in each availability zone. 8 here is newbits and will result in these 3 CIDRs: 10.0.0.0/24, 10.0.1.0/24, 10.0.2.0/24
  cidr_block              = cidrsubnet(aws_vpc.estar_vpc.cidr_block, 8, count.index)
  map_public_ip_on_launch = true
  availability_zone       = element(var.aws_available_azs, count.index)
  depends_on              = [aws_internet_gateway.estar_ig]

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }
}

# Create `/21` private subnets, one for each availability zone in the region up to a max of 3
resource "aws_subnet" "private_subnet" {
  # Count will go upto a maximum of var.private_subnet_count, whose default value is 3
  count = var.private_subnet_count

  vpc_id = aws_vpc.estar_vpc.id
  # Will create a /21 private subnet in each availability zone. 5 here is newbits and will result in these 3 CIDRs: 10.0.8.0/21, 10.0.16.0/21, 10.0.24.0/21
  cidr_block        = cidrsubnet(aws_vpc.estar_vpc.cidr_block, 5, count.index + var.subnet_cidr_offset)
  availability_zone = element(var.aws_available_azs, count.index)
  depends_on        = [aws_internet_gateway.estar_ig]

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}
