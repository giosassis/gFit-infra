output "database_endpoint" {
  value = module.database.endpoint
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket_endpoint" {
  value = module.s3.bucket_endpoint
}