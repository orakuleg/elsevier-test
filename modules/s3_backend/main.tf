resource "aws_s3_bucket" "website" {
  bucket = var.website_bucket_name
  acl = "private"
  policy = data.aws_iam_policy_document.bucket_policy.json

  tags = {
    Name = var.name
    Environment = var.environment
  }

  force_destroy = "true"

  cors_rule {
    allowed_headers = [
      "*"]
    allowed_methods = [
      "PUT",
      "POST"]
    allowed_origins = [
      "*"]
    expose_headers = [
      "ETag"]
    max_age_seconds = 3000
  }

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
}

data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "AllowedIPReadAccess"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.website_bucket_name}/*",
    ]

    condition {
      test = "IpAddress"
      variable = "aws:SourceIp"

      values = var.allowed_ips
    }

    principals {
      type = "*"
      identifiers = [
        "*"]
    }
  }

  statement {
    sid = "AllowCFOriginAccess"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "arn:aws:s3:::${var.website_bucket_name}/*",
    ]

    principals {
      type = "*"
      identifiers = [
        "*"]
    }
  }
}

# AWS S3 bucket for www-redirect
resource "aws_s3_bucket" "website_redirect" {
  bucket = "www.${var.website_bucket_name}"
  acl = "public-read"

  website {
    redirect_all_requests_to = "https://${var.website_bucket_name}"
  }
}
