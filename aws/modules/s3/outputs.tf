output "s3_bucket_name" {
  value = module.s3.bucket_name ### pass-through output
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}
