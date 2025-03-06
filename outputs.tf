output "ec2_instance_id" {
  value = module.ec2.ec2_id
}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

output "s3_bucket_id" {
  value = module.s3.s3_bucket_id
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}