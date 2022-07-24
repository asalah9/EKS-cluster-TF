# Public EC2 Instances - Bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of instances"
  value       = module.ec2-public.id
}

## ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
  description = "List of public IP addresses assigned to the instances"
  value       = module.ec2-public.public_ip
}


# Public EC2 Instances - Bastion Host
/*
## ec2_private
output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  value       = [
    module.ec2-private.id[0]
  ]
}
*/
## ec2_bastion_public_ip
output "ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = [module.ec2-private.*.private_ip, module.ec2-public.*.private_ip]
}

/*
output "ec2_private_instance_ids" {
  description = "List of IDs of instances"
  #value       = [module.ec2_private.id]
  value = [for ec2private in module.ec2-private : ec2private.id]
}
*/
