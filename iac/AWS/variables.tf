variable "hospital_identifier" {
  type        = string
  description = "Hospital ka unique ID (e.g., hospital-001)"
}

variable "environment" {
  type        = string
  description = "Deployment environment (dev, staging, prod)"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "instance_type" {
  type    = string
  default = "t3.medium" # Azure 'standard_b2s' ke barabar
}

variable "ami_id" {
  type        = string
  description = "Ubuntu 22.04 LTS AMI ID"
  default     = "ami-0c7217cdde317cfec" # Ye region ke hisaab se check karein
}

variable "route53_zone_id" {
  type        = string
  description = "AWS Route53 Hosted Zone ID for DNS"
  default     = ""
}