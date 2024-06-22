provider "aws" {
        region = "us-east-1"
        access_key = "AKIA5FTZEN7XLR4GFMGD"
        secret_key = "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"
}

resource "aws_s3_bucket" "TFbucketandy" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  } 
}