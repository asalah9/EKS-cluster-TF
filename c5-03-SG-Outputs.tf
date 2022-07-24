output "Bastion-security_group_name" {
  description = "The name of the security group"
  value       = module.security-group-Bastion.this_security_group_name
}

output "Bastion-security_group_owner_id" {
  description = "The owner ID"
  value       = module.security-group-Bastion.this_security_group_id
}


output "Private-security_group_name" {
  description = "The name of the security group"
  value       = module.security-group-Private.this_security_group_name
}

output "Private-security_group_owner_id" {
  description = "The owner ID"
  value       = module.security-group-Private.this_security_group_id
}
