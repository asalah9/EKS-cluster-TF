module "security-group-Bastion" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "3.18.0"
  # insert the 3 required variables here

  name        = var.sgname-bastion
  description = "Security group which is used as an argument in complete-sg"
  vpc_id      = module.vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  # Egress Rule - all-all open bydefault

  egress_rules = ["all-all"]

  tags = local.common_tags


}
