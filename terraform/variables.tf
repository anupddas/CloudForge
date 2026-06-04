variable "aws_region" {
  description = "AWS Region"
  type        = string

  validation {
    condition     = can(regex("^[a-z]{2}-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "Must be a valid AWS region format."
  }
}

variable "environment" {
  description = "Deployment Environment"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Public Subnet CIDR"
  type        = string
}

variable "private_subnet_cidr" {
  description = "Private Subnet CIDR"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string

  validation {
    condition = contains([
      "t2.micro",
      "t3.micro",
      "t3.small"
    ], var.instance_type)

    error_message = "Supported values: t2.micro, t3.micro, t3.small."
  }
}