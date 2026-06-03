provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "CloudForge"
      ManagedBy   = "Terraform"
      Environment = var.environment
    }
  }
}