variable "bucket_prefix" {
  type        = string
  description = "Base prefix for bucket name"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
}
