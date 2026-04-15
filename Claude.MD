# CLAUDE.md — amitwebsite.online Portfolio

## Project Overview
Personal portfolio website for Amit Maurya — Cloud & AI Security Architect.
Built using Claude Code with Agentic AI DevOps practices. Static HTML/CSS portfolio website deployed to AWS using S3 + CloudFront, provisioned with Terraform, and automated via GitHub Actions.

## Tech Stack
- **Frontend:** Pure HTML5 + CSS3 + minimal vanilla JS (hamburger menu only)
- **Fonts:** Playfair Display (headings) + JetBrains Mono (body) via Google Fonts
- **Icons:** Font Awesome 6.5 + Simple Icons (Topmate) via CDN
- **Contact form:** Formspree (static form backend)
- **Hosting:** AWS S3 + CloudFront + ACM + Route 53
- **IaC:** Terraform (us-east-1)
- **CI/CD:** GitHub Actions with OIDC authentication
- AWS S3 bucket for static site hosting (private, OAC-based access)
- CloudFront distribution as CDN with S3 origin
- GitHub OIDC provider + IAM role for keyless CI/CD auth
- All resources tagged with `Project` and `Environment`


## File Structure
```
amitsite/
├── index.html          — Home page
├── lab.html            — AI Lab page
├── contact.html        — Contact page
├── robots.txt          — SEO crawler directives
├── sitemap.xml         — SEO sitemap
├── assets/
│   ├── css/
│   │   └── style.css   — Shared stylesheet (all pages)
│   ├── js/
│   │   └── main.js     — Hamburger menu only
│   └── images/
│       └── amit.jpg    — Profile photo (passport size)
├── terraform/
│   ├── main.tf         — S3, CloudFront, ACM, Route53
│   ├── variables.tf    — Variables
│   └── outputs.tf      — Outputs
├── .github/
│   └── workflows/
│       └── deploy.yml  — GitHub Actions OIDC deployment
├── CLAUDE.md           — This file
└── README.md           — Project documentation
```

## GitHub Secrets Required
- AWS_ROLE_ARN — IAM role ARN for OIDC
- S3_BUCKET_NAME — amitwebsite.online
- CLOUDFRONT_DISTRIBUTION_ID — from Terraform output

### Infrastructure (`terraform/`)
- AWS S3 bucket for static site hosting (private, OAC-based access)
- CloudFront distribution as CDN with S3 origin
- GitHub OIDC provider + IAM role for keyless CI/CD auth
- All resources tagged with `Project` and `Environment`

## Live Site
- URL: https://amitwebsite.online
- S3 bucket: from terraform output
- CloudFront distribution ID: from Terraform output
- CloudFront domain: from terraform output
- ACM certificate ARN: from Terraform output
- Route 53 hosted zone ID: from Terraform output
- GitHub repo: https://github.com/amitmaurya001/cloud-security-portfolio/

## Deployment Steps
- terraform init && terraform plan && terraform apply
- Add GitHub secrets (AWS_ROLE_ARN, S3_BUCKET_NAME, CLOUDFRONT_DISTRIBUTION_ID)
- git push origin main → GitHub Actions deploys automatically
- Syncs site files to S3, then invalidates CloudFront cache
- Site live at https://amitwebsite.online

## Custom Agents (`.claude/agents/`)

This project has 4 specialized subagents. Use them by name when delegating tasks:
- **tf-writer** — generates Terraform code (has Write access + project memory)
- **security-auditor** — audits TF for security issues (Read-only, Sonnet)
- **cost-optimizer** — reviews infra cost (Read-only, Haiku)
- **drift-detector** — detects state drift (Bash, Haiku)

## Skills (`.claude/skills/`)

All infrastructure and deployment tasks are handled via skills. Do not write Terraform or CI/CD code manually — use the appropriate skill. Action skills have `disable-model-invocation: true` (manual only). The `project-scope` skill has `user-invocable: false` (auto-loaded by Claude as background knowledge).

```
/scaffold-terraform [region] [name]  → Generate all Terraform files (uses tf-writer agent)
/scaffold-cicd [aws-account-id]      → Generate GitHub Actions + OIDC IAM role
/tf-plan                             → Run terraform plan + risk analysis
/tf-apply                            → Run terraform apply + verify
/deploy                              → Sync S3 + invalidate CloudFront
/infra-status                        → Health dashboard of all resources
/infra-audit                         → Parallel security + cost + drift audit (forked context)
/setup-gh-actions [create|validate]  → Create or validate CI workflow
/tf-destroy                          → Safe destroy with confirmation
project-scope                        → Background knowledge: AWS service constraints (auto-loaded)
/commit                              → Auto-generate commit message (built-in)
/compact                             → Compress long conversation context (built-in)
```

## Commands

```bash
# Terraform
cd terraform && terraform init
cd terraform && terraform plan
cd terraform && terraform apply

# Local preview
open index.html

# Manual S3 sync (CI does this automatically)
aws s3 sync . s3://$BUCKET_NAME --exclude "terraform/*" --exclude ".git/*" --exclude ".github/*" --exclude "*.md" --exclude ".claude/*"
```

## DO NOT
- Add JavaScript frameworks
- Add npm/node dependencies
- Commit AWS credentials
- Make S3 bucket public
- Add inline event handlers (use main.js)

## Conventions
- Terraform files use `terraform/` directory with standard layout (main.tf, variables.tf, outputs.tf)
- All deployments to happen in AWS us-east-1 region only
- GitHub Actions uses OIDC — no stored AWS access keys ever
- All infrastructure changes go through Terraform — never modify AWS resources manually
- Site content changes deploy automatically via GitHub Actions on push to main
