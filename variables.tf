variable "aws_region" {
  default = "eu-west-1"
}

variable "aws_cidr_block" {
  type    = string
  default = "100.64.0.0/16"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "aws-iac"
}
