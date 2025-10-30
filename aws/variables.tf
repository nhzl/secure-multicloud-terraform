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

variable "environment" {
  type = string
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
