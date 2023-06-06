
variable "estar_vpc" {
  description = "VPC resource"
}

variable "aws_available_azs" {
  description = "List of available Availability zone names"
  type        = list(string)
  default     = []
}

variable "public_subnet_ids" {
  description = "List of Public subnet Ids"
  type        = list(string)
  default     = []
}

variable "private_subnet_ids" {
  description = "List of Private subnet Ids"
  type        = list(string)
  default     = []
}

variable "internet_gateway" {
  description = "Internet gateway resource"
}
