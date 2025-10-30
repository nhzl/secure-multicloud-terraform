resource "random_id" "suffix" {
  byte_length = 2
}

resource "aws_vpc_ipam" "test" {
  operating_regions {
    region_name = data.aws_region.current.region
  }
}

resource "aws_vpc_ipam_pool" "test" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.test.private_default_scope_id
  locale         = data.aws_region.current.region
}

resource "aws_vpc_ipam_pool_cidr" "test" {
  ipam_pool_id = aws_vpc_ipam_pool.test.id
  cidr         = "172.20.0.0/16"
}

resource "aws_vpc" "main" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.primary_pool.id
  ipv4_netmask_length = 20

  depends_on = [
    aws_vpc_ipam_pool_cidr.primary_pool_cidr
  ]

  tags = {
    Name        = "${var.vpc_prefix}-vpc-${random_id.suffix.hex}"
    Environment = var.env
    Project     = "secure-multicloud"
  }
}
