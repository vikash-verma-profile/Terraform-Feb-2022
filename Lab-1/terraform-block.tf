#Terraform block
terraform {
  # reffered to cloud vendors or any provide you can have
  required_providers {
    aws={
        source ="hashicorp/aws"
    }
    #Single line comment
    /*
    multi line comment
    random={
        
    }
    */
  }
}

provider "aws" {
   region="us-east-1"
   profile="default"
}

#resource block

resource "aws_vpc" "myvpc" {
  cidr_block="10.0.0.0/16"
  tags={
      "Name"="myvpc-1"
  }
}
