resource "aws_s3_bucket" "bucket" {
  bucket = var.domain_name
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "bucket_website" {
  bucket = var.domain_name
  
  index_document {
    suffix = var.index
  }

  depends_on = [ aws_s3_bucket.bucket ]
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls   = true
  block_public_policy = true
}

resource "null_resource" "upload_files" {
  depends_on = [ aws_s3_bucket_website_configuration.bucket_website ]

  provisioner "local-exec" {
    command = "aws s3 sync ../website s3://${aws_s3_bucket.bucket.bucket} --delete"
    working_dir = "${path.module}/../website"
  }
}