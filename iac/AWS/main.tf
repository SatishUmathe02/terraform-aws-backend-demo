resource "aws_s3_bucket" "example" {
  bucket = "${var.hospital_id}-${var.environment}-demo-bucket"
}