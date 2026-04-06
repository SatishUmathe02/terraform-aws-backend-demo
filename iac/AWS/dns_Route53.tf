resource "aws_route53_record" "vm_record" {
  zone_id = var.route53_zone_id # Apni Domain Zone ID yahan dein
  name    = "api-${local.resource_prefix}.yourdomain.com"
  type    = "A"
  ttl     = 300
  records = [aws_instance.hospital_vm.public_ip]
}