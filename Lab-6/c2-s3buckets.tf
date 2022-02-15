resource "aws_s3_bucket" "mys3buckets" {

  #for each meta-argument
  #key and value pair
  for_each = toset(["dev-sample-5518","stage-Sample2-5518"])
      /*
    dev   = "my-dapp-bucket"
    qa    = "my-dapp-bucket"
    stage = "my-dapp-bucket"
    prod  = "my-dapp-bucket"
    */
    
  

  #bucket = "${each.key}-${each.value}"
  bucket = "${each.key}"
  #acl    = "private"
  tags = {
    Environment = each.key
    bucketname  = "${each.key}"
  }
}

