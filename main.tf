provider "aws" {
  region = "us-east-1"
}

provider "random" {}

resource "random_id" "bucket_id" {
  byte_length = 4
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "wagnerlopesteste-${random_id.bucket_id.hex}"
}

resource "aws_s3_bucket" "another_bucket" {
  bucket = "wagnerlopesteste-${random_id.bucket_id.hex}"
  acl           = "private"


  tags = {
    Name        = "wagnerlopes-teste"
    Environment = "Production"
  }
}