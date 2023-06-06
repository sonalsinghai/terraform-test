# Terraform Coding Test

Create multiple VPCs by adding more configurations to the `vpc_configs` variable in `terraform.tfvars` file.
<br>Each VPC will be created with its own set of subnets and parameters based on the provided configurations.

```shell
# Code formatting
terraform fmt -recursive

# Initialize modules & provider plugins. Downloads provider and locks the versions in .terraform.lock.hcl file
terraform init

# Updates terraform.tfstate file and then creates plan
terraform plan

# Apply it
terraform apply -auto-approve

# State
terraform state list
terraform show
terraform state show module.vpc["vpc-1"].aws_vpc.estar_vpc

# Destroy
terraform plan -destroy
terraform destroy -auto-approve
```

## Output

```shell
module.vpc["vpc-1"].aws_vpc.estar_vpc: Creating...
module.vpc["vpc-2"].aws_vpc.estar_vpc: Creating...
module.vpc["vpc-2"].aws_vpc.estar_vpc: Still creating... [10s elapsed]
module.vpc["vpc-1"].aws_vpc.estar_vpc: Still creating... [10s elapsed]
module.vpc["vpc-1"].aws_vpc.estar_vpc: Creation complete after 11s [id=vpc-0085775adbe8f3ade]
module.vpc["vpc-1"].aws_internet_gateway.estar_ig: Creating...
module.vpc["vpc-2"].aws_vpc.estar_vpc: Creation complete after 11s [id=vpc-016bf16d89f7921c1]
module.vpc["vpc-2"].aws_internet_gateway.estar_ig: Creating...
module.vpc["vpc-1"].aws_internet_gateway.estar_ig: Creation complete after 1s [id=igw-08e3c88cc2b8f414b]
module.vpc["vpc-2"].aws_internet_gateway.estar_ig: Creation complete after 1s [id=igw-06582f96dc1de2b6a]
module.vpc["vpc-1"].aws_subnet.private_subnet[0]: Creating...
module.vpc["vpc-1"].aws_subnet.public_subnet[2]: Creating...
module.vpc["vpc-1"].aws_subnet.private_subnet[1]: Creating...
module.vpc["vpc-1"].aws_subnet.public_subnet[0]: Creating...
module.vpc["vpc-1"].aws_subnet.private_subnet[2]: Creating...
module.vpc["vpc-2"].aws_subnet.public_subnet[0]: Creating...
module.vpc["vpc-2"].aws_subnet.public_subnet[1]: Creating...
module.vpc["vpc-1"].aws_subnet.public_subnet[1]: Creating...
module.vpc["vpc-2"].aws_subnet.private_subnet[1]: Creating...
module.vpc["vpc-2"].aws_subnet.private_subnet[0]: Creating...
module.vpc["vpc-1"].aws_subnet.private_subnet[1]: Creation complete after 0s [id=subnet-0cfeadcb06871b10b]
module.vpc["vpc-2"].aws_subnet.private_subnet[1]: Creation complete after 0s [id=subnet-0071958e797c01519]
module.vpc["vpc-1"].aws_subnet.private_subnet[2]: Creation complete after 0s [id=subnet-0c65ea7cdc6fc5ddb]
module.vpc["vpc-1"].aws_subnet.private_subnet[0]: Creation complete after 0s [id=subnet-07e25f4130b8962b6]
module.vpc["vpc-2"].aws_subnet.private_subnet[0]: Creation complete after 0s [id=subnet-0d63cb391e4b944bd]
module.vpc["vpc-1"].aws_subnet.public_subnet[2]: Still creating... [10s elapsed]
module.vpc["vpc-1"].aws_subnet.public_subnet[0]: Still creating... [10s elapsed]
module.vpc["vpc-2"].aws_subnet.public_subnet[1]: Still creating... [10s elapsed]
module.vpc["vpc-2"].aws_subnet.public_subnet[0]: Still creating... [10s elapsed]
module.vpc["vpc-1"].aws_subnet.public_subnet[1]: Still creating... [10s elapsed]
module.vpc["vpc-1"].aws_subnet.public_subnet[2]: Creation complete after 10s [id=subnet-0f147afb357b07e37]
module.vpc["vpc-1"].aws_subnet.public_subnet[0]: Creation complete after 10s [id=subnet-097975379688e1b57]
module.vpc["vpc-2"].aws_subnet.public_subnet[0]: Creation complete after 10s [id=subnet-09e754cf1cb7d50d3]
module.vpc["vpc-2"].aws_subnet.public_subnet[1]: Creation complete after 10s [id=subnet-0d42cca22383480ef]
module.vpc["vpc-1"].aws_subnet.public_subnet[1]: Creation complete after 10s [id=subnet-0ea85e14bfcc29818]
module.nat_gateway["vpc-2"].aws_eip.nat_eip: Creating...
module.nat_gateway["vpc-1"].aws_route_table_association.private_subnet_route_association[2]: Creating...
module.nat_gateway["vpc-2"].aws_route_table_association.private_subnet_route_association[0]: Creating...
module.nat_gateway["vpc-1"].aws_eip.nat_eip: Creating...
module.nat_gateway["vpc-2"].aws_route_table_association.private_subnet_route_association[1]: Creating...
module.nat_gateway["vpc-1"].aws_route_table_association.private_subnet_route_association[1]: Creating...
module.nat_gateway["vpc-1"].aws_route_table_association.private_subnet_route_association[0]: Creating...
module.nat_gateway["vpc-1"].aws_route_table_association.private_subnet_route_association[2]: Creation complete after 1s [id=rtbassoc-03db837eabdd3e9ba]
module.nat_gateway["vpc-1"].aws_route_table_association.private_subnet_route_association[0]: Creation complete after 1s [id=rtbassoc-00390f1c1c1814bc2]
module.nat_gateway["vpc-1"].aws_route_table_association.private_subnet_route_association[1]: Creation complete after 1s [id=rtbassoc-0e80ac4cf44060191]
module.nat_gateway["vpc-2"].aws_route_table_association.private_subnet_route_association[1]: Creation complete after 1s [id=rtbassoc-0c2a9dd4e79ba47db]
module.nat_gateway["vpc-2"].aws_route_table_association.private_subnet_route_association[0]: Creation complete after 1s [id=rtbassoc-0a37afab6ae04ec10]
module.nat_gateway["vpc-2"].aws_eip.nat_eip: Creation complete after 1s [id=eipalloc-07df749f85569b1eb]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Creating...
module.nat_gateway["vpc-1"].aws_eip.nat_eip: Creation complete after 1s [id=eipalloc-06f4caae87c0792e8]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Creating...
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [10s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [10s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [20s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [20s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [30s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [30s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [40s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [40s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [50s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [50s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [1m0s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [1m0s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [1m10s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [1m10s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Still creating... [1m20s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [1m20s elapsed]
module.nat_gateway["vpc-2"].aws_nat_gateway.nat_gateway: Creation complete after 1m24s [id=nat-06015ea73bf049e71]
module.nat_gateway["vpc-2"].aws_route.private_subnet_route: Creating...
module.nat_gateway["vpc-2"].aws_route.private_subnet_route: Creation complete after 0s [id=r-rtb-0ffbfc02638856b761080289494]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Still creating... [1m30s elapsed]
module.nat_gateway["vpc-1"].aws_nat_gateway.nat_gateway: Creation complete after 1m34s [id=nat-032e2612b6134c4cc]
module.nat_gateway["vpc-1"].aws_route.private_subnet_route: Creating...
module.nat_gateway["vpc-1"].aws_route.private_subnet_route: Creation complete after 0s [id=r-rtb-0997106d88d61bd0e1080289494]

Apply complete! Resources: 25 added, 0 changed, 0 destroyed.
```
