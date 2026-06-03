terraform {

  backend "s3" {

    bucket = "cloudforge-tfstate-847110629980"

    key = "dev/terraform.tfstate"

    region = "ap-south-1"

    dynamodb_table = "cloudforge-terraform-locks"

    encrypt = true
  }
}