resource "aws_route53_zone" "primary" {
  name = var.domain_name
}

resource "aws_route53_record" "domain_A" {
  zone_id = aws_route53_zone.primary.zone_id
  name = var.domain_name
  type = "A"
  alias {
    name = aws_s3_bucket_website_configuration.bucket_website.website_domain
    zone_id = aws_s3_bucket_website_configuration.bucket_website.website_domain
    // aws_route53_zone.primary.zone_id
    // aws_s3_bucket_website_configuration.bucket.hosted_zone_id
    evaluate_target_health = false
  }
}