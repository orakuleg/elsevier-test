resource "aws_s3_bucket" "website" {
  bucket = var.website_bucket_name
  acl = "public-read"

  tags = {
    Name = var.name
    Environment = var.environment
  }

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT","POST"]
    allowed_origins = ["*"]
    expose_headers = ["ETag"]
    max_age_seconds = 3000
  }

  policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "PublicReadForGetBucketObjects",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.website_bucket_name}/*"
    }
  ]
}
EOF

  website {
    index_document = var.index_document
    error_document = var.error_document
  }
}

# AWS S3 bucket for www-redirect
resource "aws_s3_bucket" "website_redirect" {
  bucket = "www.${var.website_bucket_name}"
  acl = "public-read"

  website {
    redirect_all_requests_to = var.website_bucket_name
  }
}

output "out_website_domain" {
  value = aws_s3_bucket.website.website_domain
}

output "out_hosted_zone_id" {
  value = aws_s3_bucket.website.hosted_zone_id
}
