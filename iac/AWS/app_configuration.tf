resource "aws_s3_bucket" "config_bucket" {
  bucket = "config-${local.resource_prefix}"
  tags   = local.common_tags
}

resource "aws_s3_bucket_versioning" "config_versioning" {
  bucket = aws_s3_bucket.config_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}