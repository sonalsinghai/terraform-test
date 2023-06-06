
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_available_azs" {
  description = "List of available Availability zone names"
  type        = list(string)
  default     = []
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
  default     = 3
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
  default     = 3
}

variable "subnet_cidr_offset" {
  description = "CIDR block offset for subnets"
  type        = number
  default     = 1
}
