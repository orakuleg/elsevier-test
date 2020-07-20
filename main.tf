provider "aws" {
  access_key                = var.aws_access_key
  secret_key                = var.aws_secret_key
  region                    = var.aws_region
}

module "s3_backend" {
  source                    = "./modules/s3_backend"
  allowed_ips               = var.allowed_ips
  environment               = var.environment
  error_document            = var.error_document
  name                      = var.name
  index_document            = var.index_document
  website_bucket_name       = var.domain_name
}

module "cdn" {
  source                    = "./modules/cdn"
  domain_name               = var.domain_name
  certificate_arn           = var.certificate_arn
  default_root_object       = var.default_root_object
  environment               = var.environment
  origin_id                 = var.origin_id
}

module "route53" {
  source                    = "./modules/route53"
  domain_name               = var.domain_name
  environment               = var.environment
  out_cdn_domain            = module.cdn.out_cdn_domain
  out_cdn_hosted_zone_id    = module.cdn.out_cdn_hosted_zone_id
}
