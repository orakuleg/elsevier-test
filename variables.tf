variable "aws_access_key" {
  description = "AWS access key to access console"
}

variable "aws_secret_key" {
  description = "AWS secret key to access console"
}

variable "aws_region" {
  default     = "eu-west-1"
}

variable "name" {
  type        = string
  description = "Name-tag"
  default     = "Website"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "index_document" {
  type        = string
  description = "Name of the main index document"
  default     = "index.html"
}

variable "error_document" {
  type        = string
  description = "Name of the main error document"
  default     = "error.html"
}

variable "default_root_object" {
  type        = string
  description = "Name of the main root document"
  default     = "index.html"
}

variable "origin_id" {
  type        = string
  description = "origin name"
  default     = "website"
}

variable "website_bucket_name" {
  type        = string
  description = "Name of bucket for hosting"
}
