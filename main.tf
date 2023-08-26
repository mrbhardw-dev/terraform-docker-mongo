locals {
  vpc_cidr       = cidrsubnet(var.aws_cidr_block, 6, 0)
  ec2_subnet_ids = [for _, value in module.vpc.public_subnet_attributes_by_az : value.id]
}


module "vpc" {
  source  = "aws-ia/vpc/aws"
  version = "4.3.0"

  name       = "${module.label.id}-vpc"
  cidr_block = local.vpc_cidr
  az_count   = 1
  tags       = module.label.tags_aws

  subnets = {
    # Dual-stack subnet
    public = {
      name_prefix               = "${module.label.id}-pub-sbt" # omit to prefix with "public"
      netmask                   = 24
      nat_gateway_configuration = "none" # options: "single_az", "all_azs" ,"none"
    }
  }
}