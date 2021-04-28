output "name" {
  value       = data.ns_subdomain.this.dns_name
  description = "string ||| The name that precedes the domain name for the created subdomain."
}

output "fqdn" {
  value       = aws_route53_zone.this.name
  description = "string ||| The FQDN (fully-qualified domain name) for the created subdomain."
}

output "zone_id" {
  value       = aws_route53_zone.this.zone_id
  description = "string ||| The zone ID of the AWS Route53 Zone for the created subdomain."
}

output "nameservers" {
  value       = aws_route53_zone.this.name_servers
  description = "list(string) ||| The list of nameservers of the AWS Route53 Zone for the created subdomain."
}

output "domain_name" {
  value       = local.domain_name
  description = "string ||| The name of the root domain."
}

output "domain_zone_id" {
  value       = local.domain_zone_id
  description = "string ||| The zone ID of the root domain."
}

output "cert_arn" {
  value       = try(module.cert[0].certificate_arn, "")
  description = "string ||| If var.create_cert is enabled, the ARN of the SSL Certificate."
}
