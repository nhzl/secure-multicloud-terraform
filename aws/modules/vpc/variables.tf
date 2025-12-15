variable "vpc_prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "project" {
  type = string
}

variable "ipv4_netmask_length" {
  type = number
}

variable "cidr_pool_cidr" {
  type    = string
  default = "172.20.0.0/16"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "enable_nat" {
  type    = bool
  default = false
}
