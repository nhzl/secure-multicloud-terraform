resource "random_id" "suffix" {
  byte_length = 2
}

data "aws_region" "current" {}


#Create IPAM
resource "aws_vpc_ipam" "main" {
  operating_regions {
    region_name = "data.aws_region.current.region"
  }

}

#Create IPAM Pool
resource "aws_vpc_ipam_pool" "main" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.main.private_default_scope_id
  locale         = data.aws_region.current.region
}

#Assign CIDR from IPAM
resource "aws_vpc_ipam_pool_cidr" "main" {
  ipam_pool_id = aws_vpc_ipam_pool.main.id
  cidr         = var.cidr_pool_cidr

}

#Create VPC from IPAM
resource "aws_vpc" "main" {
  ipv4_ipam_pool_id   = aws_vpc_ipam_pool.main.id
  ipv4_netmask_length = var.ipv4_netmask_length

  depends_on = [aws_vpc_ipam_pool_cidr.main]
  tags = merge({
    Name        = "${var.vpc_prefix}-vpc-${random_id.suffix.hex}"
    Environment = var.environment
    Project     = var.project
  }, var.tags)

}

