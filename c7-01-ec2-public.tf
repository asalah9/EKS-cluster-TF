module "ec2-public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  name = "Bastion_EC2"

  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # monitoring             = true
  vpc_security_group_ids = [module.security-group-Bastion.this_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags                   = local.common_tags


}

#
