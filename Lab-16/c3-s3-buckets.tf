#define local Values
locals{
    bucket-name="${var.app_name}-${var.environment_name}-bucket"
}

#create s3 bucket-with input and local variables
resource "aws_s3_bucket" "mys3bucket"{
    bucket=local.bucket-name
    tags = {
      Name = local.bucket-name
      Environment=var.environment_name
    }
}