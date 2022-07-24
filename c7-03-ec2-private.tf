module "ec2-private" {
  source     = "terraform-aws-modules/ec2-instance/aws"
  version    = "2.17.0"
  depends_on = [module.vpc] # VERY VERY IMPORTANT else userdata webserver provisioning will fail as it uses
  #yum install which will need (depends_on NATGW)
  #instance_count = 2
  count = length(module.vpc.private_subnets)
  name  = "Private_EC2_${count.index}"

  ami           = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  key_name      = var.instance_keypair
  # monitoring             = true
  vpc_security_group_ids = [module.security-group-Private.this_security_group_id]
  subnet_id              = module.vpc.private_subnets[count.index]

  user_data = file("app1-install.sh")

  tags = local.common_tags

}

#security-group-Bastion
