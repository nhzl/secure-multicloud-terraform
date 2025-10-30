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

module "vpc" {
  source = "./modules/vpc"

  vpc_prefix  = var.vpc_prefix
  environment = var.environment
  project     = var.project

  ipv4_netmask_length = 20
  cidr_pool_cidr      = "172.20.0.0/16"

  tags = {
    Environment = var.environment
    Project     = var.project
  }

}
