export AWS_ACCESS_KEY_ID="acessskey"
export AWS_SECRET_ACCESS_KEY="secretkey"
provider "aws" {
        region = "us-east-1"
}

resource "aws_s3_bucket" "TFbucketandy" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  } 
}
