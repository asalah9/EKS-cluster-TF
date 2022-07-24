module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"
  #version = "~> 2.78"

  name = local.name
  #cidr = "10.0.0.0/16 # 10.0.0.0/8 is reserved for EC2-Classic
  cidr             = var.vpc_cidr_block
  azs              = var.vpc_availability_zones
  private_subnets  = var.vpc_private_subnets
  public_subnets   = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets

  enable_dns_hostnames = true
  enable_dns_support   = true


  enable_nat_gateway = true
  single_nat_gateway = true

  #tags

  tags     = local.common_tags
  vpc_tags = local.common_tags
}
