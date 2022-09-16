variable "region" {
  type        = string
  default     = "us-east-1"
}

variable "vpc-name" {
  type        = string
  default     = "eks-main"
}

variable "env-name" {
  type        = string
  default     = "staging"
}

variable "instance-type" {
  type        = string
  default     = "t3.small"
}

variable "cluster-name" {
  type        = string
  default     = "eks-testing"
}

variable "eks-role" {
  type        = string
  default     = "eks-admin"
}

variable "eks-policy" {
  type        = string
  default     = "allow-eks-access"
}

variable "eks-group" {
  type        = string
  default     = "myeks-group"
}

variable "developers" {
  type        = string
  default     = "developers"
}