provider "aws" {
  access_key                = var.aws_access_key
  secret_key                = var.aws_secret_key
  region                    = var.aws_region
}

module "s3_backend" {
  source                    = "./modules/s3_backend"
  website_bucket_name       = var.domain_name
  name                      = var.name
  environment               = var.environment
  index_document            = var.index_document
  error_document            = var.error_document
  allowed_ips               = var.allowed_ips
}

module "cdn" {
  source                    = "./modules/cdn"
  environment               = var.environment
  origin_id                 = var.origin_id
  default_root_object       = var.default_root_object
  website_bucket_name       = var.website_bucket_name
  out_bucket                = module.s3_backend.out_bucket
  domain_name               = var.domain_name
}

module "route53" {
  source                    = "./modules/route53"
  environment               = var.environment
  domain_name               = var.domain_name
  out_website_domain        = module.s3_backend.out_website_domain
  out_hosted_zone_id        = module.s3_backend.out_hosted_zone_id
}
