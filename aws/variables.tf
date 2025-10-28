variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "aws_region" {
  type        = string
  default     = "us-east-1"
}
