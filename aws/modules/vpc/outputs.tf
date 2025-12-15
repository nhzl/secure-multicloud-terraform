output "vpc_name" {
  value = aws_s3_bucket.main.id
}

output "vpc_arn" {
  value = aws_s3_bucket.main.arn
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}
