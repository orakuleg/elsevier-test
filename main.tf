provider "aws" {
  access_key                = var.aws_access_key
  secret_key                = var.aws_secret_key
  region                    = var.aws_region
}

module "dev" {
  source                    = "./environments/dev"
  website_bucket_name       = var.website_bucket_name
  name                      = var.name
  index_document            = var.index_document
  error_document            = var.error_document
  environment               = "dev"
  origin_id                 = var.origin_id
  default_root_object       = var.default_root_object
}

module "production" {
  source                    = "./environments/production"
  website_bucket_name       = var.website_bucket_name
  name                      = var.name
  index_document            = var.index_document
  error_document            = var.error_document
  environment               = "production"
  origin_id                 = var.origin_id
  default_root_object       = var.default_root_object
}
