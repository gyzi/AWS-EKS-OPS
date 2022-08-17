variable "region" {
  type        = string
  default     = "us-east-1"
  description = "Region Name"
}
variable "aws_profile" {
  type = string
}

variable "repo_name" {
  type        = string
  default     = "node"
  description = "ECR repo Name"
}
