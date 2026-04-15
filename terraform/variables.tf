variable "region" {
  description = "AWS region for all resources (except ACM, which is always us-east-1)"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for resource naming and tagging"
  type        = string
  default     = "Amit-Maurya-Portfolio"
}

variable "environment" {
  description = "Deployment environment (e.g. production, staging)"
  type        = string
  default     = "production"
}

variable "domain_name" {
  description = "Root domain name (e.g. amitwebsite.online). Leave empty to skip custom domain setup."
  type        = string
  default     = "amitwebsite.online"
}
