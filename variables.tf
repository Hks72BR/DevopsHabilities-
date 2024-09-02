variable "aws_access_key" {
  description = "Access key for AWS"
  type        = string
}

variable "aws_secret_key" {
  description = "Secret key for AWS"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}
