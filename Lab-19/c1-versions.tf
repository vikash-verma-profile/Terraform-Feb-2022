terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version="3.0"
    }
  }
  #adding backend aas s3 remote state storage
  backend "s3" {
    bucket = "terraform-backend-sample-551"
    key    = "terraform.tfstate"
    region = "us-east-1"

    #enable state locking
    #for state locking
    #Create column name LockID in terraform-dev-state-table table
    dynamodb_table = "terraform-dev-state-table"
    
  }

}
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}



