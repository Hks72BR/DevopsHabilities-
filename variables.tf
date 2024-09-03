variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block_a" {
  description = "CIDR block for the public subnet in AZ A"
  default     = "10.0.1.0/24"
}

variable "public_subnet_cidr_block_b" {
  description = "CIDR block for the public subnet in AZ B"
  default     = "10.0.2.0/24"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "devops-cluster"
}
