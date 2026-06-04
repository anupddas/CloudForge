locals {

  project_name = "cloudforge"

  common_tags = {
    Project     = "CloudForge"
    ManagedBy   = "Terraform"
    Environment = var.environment
    Owner       = "anup"
  }

}