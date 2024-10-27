/*

resource "aws_route53domains_registered_domain" "domain" {
  domain_name = var.domain_name

  admin_contact {
    first_name = var.first_name
    last_name = var.last_name
    email = var.email
    phone_number = var.phone
    address_line_1 = var.street
    city = var.city
    state = var.state
    country_code = var.country_code
    zip_code = var.zip_code
  }

  registrant_contact {
    first_name = var.first_name
    last_name = var.last_name
    email = var.email
    phone_number = var.phone
    address_line_1 = var.street
    city = var.city
    state = var.state
    country_code = var.country_code
    zip_code = var.zip_code
  }

  tech_contact {
    first_name = var.first_name
    last_name = var.last_name
    email = var.email
    phone_number = var.phone
    address_line_1 = var.street
    city = var.city
    state = var.state
    country_code = var.country_code
    zip_code = var.zip_code   
  }

  depends_on = [aws_route53_zone.primary]

}

*/
/*
resource "aws_route53_zone" "primary" {
  name = var.domain_name
}
*/

data "aws_route53_zone" "selected_zone" {
  name = var.domain_name
}


resource "aws_route53_record" "domain_A" {
  zone_id = data.aws_route53_zone.selected_zone.zone_id
  name = var.domain_name
  type = "A"

  alias {
    name = aws_cloudfront_distribution.cloudfront.domain_name
    zone_id = aws_cloudfront_distribution.cloudfront.hosted_zone_id
    evaluate_target_health = false
  }

  depends_on = [aws_cloudfront_distribution.cloudfront]
}