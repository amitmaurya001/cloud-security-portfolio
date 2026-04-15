output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID (used in CI/CD cache invalidation)"
  value       = aws_cloudfront_distribution.site.id
}

output "cloudfront_domain_name" {
  description = "CloudFront-assigned domain name (*.cloudfront.net)"
  value       = aws_cloudfront_distribution.site.domain_name
}

output "cloudfront_arn" {
  description = "ARN of the CloudFront distribution"
  value       = aws_cloudfront_distribution.site.arn
}

output "s3_bucket_name" {
  description = "Name of the S3 origin bucket"
  value       = aws_s3_bucket.site.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 origin bucket"
  value       = aws_s3_bucket.site.arn
}

output "website_url" {
  description = "Public URL of the website"
  value       = var.domain_name != "" ? "https://${var.domain_name}" : "https://${aws_cloudfront_distribution.site.domain_name}"
}
