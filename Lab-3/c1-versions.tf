#Terraform block
terraform {
  # reffered to cloud vendors or any provide you can have
  required_providers {
    aws={
        source ="hashicorp/aws"
    }
  }
}
provider "aws" {
   region=var.aws_region
   profile="default"
}



