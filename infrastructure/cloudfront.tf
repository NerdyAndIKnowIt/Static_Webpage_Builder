resource "aws_cloudfront_distribution" "cloudfront" {
    enabled = true
    aliases = [var.domain_name]
    default_root_object = var.index
    wait_for_deployment = true

    default_cache_behavior {
      allowed_methods = ["GET", "HEAD", "OPTIONS"]
      cached_methods = ["GET", "HEAD", "OPTIONS"]
      target_origin_id = aws_s3_bucket.bucket.bucket
      viewer_protocol_policy = "redirect-to-https"
    }
    
    origin {
      domain_name = aws_s3_bucket.bucket.bucket_domain_name
      origin_access_control_id = aws_cloudfront_origin_access_control.origin_access_control.id
      origin_id = aws_s3_bucket.bucket.id
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }

    viewer_certificate {
      acm_certificate_arn = aws_acm_certificate_validation.cert.certificate_arn
      ssl_support_method = "sni-only"
    }

    depends_on = [
        aws_s3_bucket_website_configuration.bucket_website,
        aws_acm_certificate_validation.cert
    ]
}

resource "aws_cloudfront_origin_access_control" "origin_access_control" {
  name = "s3_origin_access_control"
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}