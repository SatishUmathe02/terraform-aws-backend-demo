locals {
  # Azure ki tarah underscores ko dashes se badalna
  sanitized_hospital_id = replace(var.hospital_identifier, "_", "-")
  
  # Naming pattern: {hospital-id}-{environment}
  resource_prefix = "${local.sanitized_hospital_id}-${var.environment}"

  # Common tags jo har resource par lagenge
  common_tags = {
    Hospital     = var.hospital_identifier
    Environment  = var.environment
    ManagedBy    = "Terraform"
    DeployedBy   = "GitHub Actions"
    CreatedDate  = formatdate("YYYY-MM-DD", timestamp())
  }

  # Resource Names (AWS naming style)
  vpc_name             = "vpc-${local.resource_prefix}"
  subnet_name          = "subnet-${local.resource_prefix}"
  security_group_name  = "sg-${local.resource_prefix}"
  ec2_name             = "vm-${local.resource_prefix}"
  s3_config_bucket     = "config-${local.resource_prefix}" # Storage account ka alternative
  secret_name          = "secret-${local.resource_prefix}" # Key Vault ka alternative
}

# Verification ke liye output
output "aws_resource_summary" {
  value = {
    hospital_id    = var.hospital_identifier
    environment    = var.environment
    vpc_name       = local.vpc_name
    ec2_instance   = local.ec2_name
    config_storage = local.s3_config_bucket
  }
}