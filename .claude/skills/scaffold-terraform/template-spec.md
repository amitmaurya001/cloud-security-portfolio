# Terraform Template Specification

Generate these files in the `terraform/` directory:

**terraform/main.tf:**
- S3 bucket (private, enable versioning, no public access, block all public ACLs)
  - Enable SSE (AES256)
- S3 bucket policy granting CloudFront OAC read access
- Restrict bucket policy using CloudFront distribution ARN (aws:SourceArn)
- CloudFront distribution with:
  - S3 origin using OAC, not legacy OAI
  - Default root object: index.html
  - Custom error response: 404 → /index.html (200)
  - Viewer protocol policy: redirect-to-https
  - Set minimum TLS version (TLSv1.2_2021)
  - Restrict methods to GET, HEAD
  - Price class: PriceClass_200
  - Default cache behavior with CachingOptimized managed policy
  - Enable compression (compress = true)
  - Optional logging configuration
- Configure aliases in CloudFront:
  - domain_name
  - www.domain_name
- Custom domain setup for `amitwebsite.online`:
  - Use Route53 hosted zone lookup for domain
  - Create ACM certificate in us-east-1 with SAN for www subdomain
  - Validate certificate via DNS records
  - Attach certificate to CloudFront viewer_certificate
  - Create Route53 alias record for root domain pointing to CloudFront
  - Create Route53 alias record for www subdomain pointing to CloudFront
  - Support canonical domain strategy:
    - Option to redirect www → root domain
- All resources tagged with `Project` and `Environment` and `ManagedBy` variables

**terraform/variables.tf:**
- Variables for: region, project_name, environment (default "production"), domain_name (default "")

**terraform/outputs.tf:**
- Outputs for: cloudfront_distribution_id, cloudfront_domain_name, s3_bucket_name, s3_bucket_arn, website_url, cloudfront_arn

**terraform/providers.tf:**
- AWS provider with region variable, terraform block with required_version >= 1.4.8 and AWS provider source

**terraform/backend.tf:**
- S3 backend block (commented out with instructions to uncomment after creating state bucket)
- Include comments explaining: first run `terraform init` without backend, create the resources, then uncomment backend and run `terraform init -migrate-state`
