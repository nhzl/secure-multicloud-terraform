locals {
  common_tags = {
    Environment = var.environment
    Project     = var.project
  }
}

variable "env" {
  type        = string
  description = "Deployment environment (dev, stage, prod)"
}

variable "bucket_prefix" {
  type        = string
  description = "Base prefix for bucket name"
}

variable "vpc_prefix" {
  type        = string
  description = "Base prefix for vpc name"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project" {
  type    = string
  default = "secure-multicloud"
}

variable "ipv4_netmask_length" {
  type = number
}

variable "cidr_pool_cidr" {
  type    = string
  default = "172.20.0.0/16"
}

variable "enable_nat" {
  type    = bool
  default = false
}
