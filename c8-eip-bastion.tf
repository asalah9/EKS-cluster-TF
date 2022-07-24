# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2-public, module.vpc]
  instance   = module.ec2-public.id[0]
  vpc        = true
  tags       = local.common_tags
}
