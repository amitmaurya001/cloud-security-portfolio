# ---------------------------------------------------------------------------
# Remote State Backend (S3)
# ---------------------------------------------------------------------------
# Instructions:
#   1. On first run, leave this block commented out.
#      Run: terraform init && terraform apply
#      This creates all infrastructure including the S3 bucket.
#
#   2. Create a separate S3 bucket for Terraform state (or reuse an existing one).
#      Enable versioning + SSE on that bucket.
#
#   3. Uncomment the backend block below, fill in your state bucket name and
#      DynamoDB lock table name, then run: terraform init -migrate-state
#      Terraform will copy local state into the remote backend automatically.
# ---------------------------------------------------------------------------

# terraform {
#   backend "s3" {
#     bucket         = "your-terraform-state-bucket"   # <-- replace
#     key            = "amitwebsite/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "terraform-lock"                # <-- replace or remove if not using DynamoDB locking
#   }
# }
