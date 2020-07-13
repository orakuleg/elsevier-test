module "dev-s3_backend" {
  source                    = "../../s3_backend"
  website_bucket_name       = var.website_bucket_name
  name                      = var.name
  environment               = var.environment
  index_document            = var.index_document
  error_document            = var.error_document
}

module "dev-cdn" {
  source                    = "../../cdn"
  environment               = var.environment
  origin_id                 = var.origin_id
  default_root_object       = var.default_root_object
  website_bucket_name       = var.website_bucket_name
}
