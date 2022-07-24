module "security-group-Private" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 3 required variables here

  name        = var.sgname-private
  description = "Security group which is used as an argument in complete-sg"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_cidr_blocks = ["10.0.0.0/16"]
  ingress_rules       = ["http-80-tcp", "ssh-tcp", "https-443-tcp"]

  egress_rules = ["all-all"]

  tags = local.common_tags

}
