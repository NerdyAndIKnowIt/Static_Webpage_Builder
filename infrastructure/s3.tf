resource "aws_s3_bucket" "bucket" {
  bucket = var.domain_name
}

resource "aws_s3_bucket_website_configuration" "bucket_website" {
  bucket = var.domain_name
  // acl = "public-read"  // will make private after cloudfront is added
  // policy = data.aws_iam_policy_document.website_policy.json
  
  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}