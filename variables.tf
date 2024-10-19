//--------- Go to declare_variables.tfvars file to change the default variables ----------
//---------------------- Do not change any settings in this file--------------------------


//the domain name you would like to use
variable "domain_name" {
  default = "default"
  type    = string
}

//contact information for domain registration
//these will be used for the admin contact, registrant contact, and tech contact fields
variable "first_name" {
  default = "firstname"
  type    = string
}

variable "last_name" {
  default = "lastname"
  type    = string
}

variable "email" {
  default = "email@example.com"
  type    = string
}

variable "phone" {
  default = "+1.9999999999"
  type    = string
}

variable "street" {
  default = "123 Main St"
  type    = string
}

variable "city" {
  default = "cityname"
  type    = string
}

variable "state" {
  default = "state"
  type    = string
}

variable "country_code" {
  default = "US"
  type    = string
}

variable "zip_code" {
  default = "12345"
  type    = string
}

//the default file for the website in the s3 bucket
variable "index" {
  default = "index.html"
  type    = string
}

//the AWS region must be us-east-1 for route 53 and cloudfront to work properly
variable "region" {
  default = "us-east-1"
  type    = string
}


