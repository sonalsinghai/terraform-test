terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # For latest version, comment out below line and add .terraform.lock.hcl file to VCS to maintain version uniformity
      version = "~> 5.0"
    }
  }
}
