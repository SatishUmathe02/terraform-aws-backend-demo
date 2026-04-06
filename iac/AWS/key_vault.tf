resource "aws_secretsmanager_secret" "hospital_secrets" {
  name        = "secrets-${local.resource_prefix}"
  description = "Secrets for ${var.hospital_identifier}"
  tags        = local.common_tags
}

resource "aws_kms_key" "encryption_key" {
  description             = "KMS key for ${local.resource_prefix}"
  deletion_window_in_days = 7
  tags                    = local.common_tags
}