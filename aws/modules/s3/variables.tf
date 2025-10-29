variable "bucket_prefix" {
  type = string ### e.g. "secure-multicloud"
}

variable "force_destroy" {
  type    = bool
  default = false ### optional safety off by default
}

variable "versioning_enabled" {
  type    = bool
  default = true ### best practice: on
}

variable "sse_algorithm" {
  type    = string
  default = "AES256" ### or "aws:kms"
}

variable "kms_key_id" {
  type    = string
  default = null ### optional KMS support
}

variable "tags" {
  type    = map(string)
  default = {} ### user-provided tags
}
