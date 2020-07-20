# Allowed IPs that can directly access the S3 bucket
variable "allowed_ips" {
  type        = list
  default     = [
    "0.0.0.0/0"            # public access
    # "xxx.xxx.xxx.xxx/mm" # restricted
    # "999.999.999.999/32" # invalid IP, completely inaccessible
  ]
}

variable "aws_access_key" {
  description = "AWS access key to access console"
}

variable "aws_secret_key" {
  description = "AWS secret key to access console"
}

variable "aws_region" {
  default     = "eu-west-1"
}

variable "certificate_arn" {
  type        = string
  description = "ARF of certificate for your domain"
}

variable "default_root_object" {
  type        = string
  description = "Name of the main root document"
  default     = "index.html"
}

variable "domain_name" {
  type        = string
  description = "Domain name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "error_document" {
  type        = string
  description = "Name of the main error document"
  default     = "error.html"
}

variable "name" {
  type        = string
  description = "Name-tag"
  default     = "Website"
}

variable "index_document" {
  type        = string
  description = "Name of the main index document"
  default     = "index.html"
}


variable "origin_id" {
  type        = string
  description = "origin name"
  default     = "website"
}
