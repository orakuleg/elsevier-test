resource "aws_route53_zone" "main" {
  name = var.domain_name
  comment = "Managed by Terraform"

  tags = {
    Environment = var.environment
  }
}

resource "aws_route53_record" "main-a-record" {
  name = var.domain_name
  zone_id = aws_route53_zone.main.zone_id
  type = "A"
  alias {
    name = var.out_cdn_domain
    zone_id = var.out_cdn_hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "main-c-name" {
  zone_id = aws_route53_zone.main.zone_id
  name = "www"
  type = "CNAME"
  ttl = "300"
  records = [var.domain_name]
}
