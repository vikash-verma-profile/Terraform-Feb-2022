#Input variables
variable "aws_region" {
  description = "Region in which AWS resource to be created"
  type=string
  default="us-east-1"
}
#app Name we will use for s3 bucket
variable "app_name" {
    description = "Application Name"
    type = string
}
#environment name
variable "environment_name" {
  description="Environment Name"
}