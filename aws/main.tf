module "s3" {
  source = "./modules/s3" ### module path

  bucket_prefix      = var.bucket_prefix ### e.g. "secure-multicloud-dev"
  force_destroy      = true              ### or false
  versioning_enabled = true
  sse_algorithm      = "AES256" ### or "aws:kms"
  #kms_key_id        = ""                ### if using kms

  tags = {
    Environment = var.environment
    Project     = var.project
  }
}
