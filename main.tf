provider "aws" {
  region = var.region
}

module "infrastructure" {
  source       = "./infrastructure"
  domain_name  = var.domain_name
  index        = var.index

  /*
  first_name   = var.first_name
  last_name    = var.last_name
  email        = var.email
  phone        = var.phone
  street       = var.street
  city         = var.city
  state        = var.state
  country_code = var.country_code
  zip_code     = var.zip_code
  */
}