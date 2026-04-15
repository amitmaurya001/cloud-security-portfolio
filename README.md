# amitwebsite.online — Personal Portfolio

Personal portfolio website for **Amit Maurya** — Senior Cloud & AI Security Architect.

🌐 **Live:** [amitwebsite.online](https://amitwebsite.online)

---

## Built with Claude Code — Agentic AI DevOps

This entire website — from design to deployment — was built using **Claude Code**, Anthropic's agentic coding tool. This project demonstrates agentic AI DevOps in practice:

- **CLAUDE.md** context engineering — teaches Claude the project architecture and conventions
- **Slash commands** — reusable DevOps workflows
- **Terraform IaC** — infrastructure provisioned as code
- **GitHub Actions OIDC** — zero long-lived credentials in the pipeline

---

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | HTML5 + CSS3 + Vanilla JS |
| Fonts | Playfair Display + JetBrains Mono |
| Icons | Font Awesome + Simple Icons |
| Contact form | Formspree |
| Hosting | AWS S3 + CloudFront |
| SSL | AWS ACM |
| DNS | AWS Route 53 |
| IaC | Terraform |
| CI/CD | GitHub Actions (OIDC) |
| Built with | Claude Code |

---

## Project Structure

```
amit-website/
├── index.html          — Home page
├── lab.html            — AI Lab page
├── contact.html        — Contact page
├── robots.txt
├── sitemap.xml
├── assets/
│   ├── css/style.css   — Shared stylesheet
│   ├── js/main.js      — Hamburger menu
│   └── images/amit.jpg — Profile photo
├── terraform/          — AWS infrastructure
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── .github/workflows/  — CI/CD
    └── deploy.yml
```

---

## Local Preview

No build step needed — just open in browser:

```bash
# Clone the repo
git clone https://github.com/amit-maurya/cloud-security-portfolio

# Open in browser
open index.html   # macOS
# or double-click index.html in file explorer
```

Test responsive layouts: Chrome → F12 → Toggle device toolbar

---

## Deployment

### Prerequisites
- AWS account with Route 53 hosted zone for amitwebsite.online
- Terraform >= 1.4.8
- GitHub repository with OIDC configured

### Step 1 — Provision Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Note the outputs:
- `cloudfront_distribution_id`
- `s3_bucket_name`

### Step 2 — Configure GitHub Secrets

Add these secrets to your GitHub repository:

| Secret | Value |
|---|---|
| `AWS_ROLE_ARN` | IAM role ARN with OIDC trust |
| `S3_BUCKET_NAME` | `amitwebsite.online` |
| `CLOUDFRONT_DISTRIBUTION_ID` | From terraform output |

### Step 3 — Configure Formspree

1. Create account at [formspree.io](https://formspree.io)
2. Create new form
3. Replace `YOUR_FORMSPREE_ID` in `contact.html`

### Step 4 — Add Profile Photo

Replace the AM initials placeholder in `index.html`:

```html
<!-- Find this comment in index.html hero section -->
<!-- Replace amit-placeholder with actual photo -->
<!-- <img src="assets/images/amit.jpg" alt="Amit Maurya"> -->

<!-- Uncomment the img tag and comment out the initials div -->
```

### Step 5 — Deploy

```bash
git add .
git commit -m "Initial deployment"
git push origin main
```

GitHub Actions automatically:
1. Syncs files to S3
2. Invalidates CloudFront cache
3. Site is live at https://amitwebsite.online

---

## Security Features

- ✅ No public S3 access — CloudFront OAC only
- ✅ HTTPS enforced — HTTP redirects to HTTPS
- ✅ Security headers — CSP, HSTS, X-Frame-Options, XSS protection
- ✅ TLS 1.2+ minimum
- ✅ OIDC authentication — no long-lived AWS credentials
- ✅ No secrets in code

---

## License

MIT — feel free to use this as a template for your own portfolio.

---

*Built with [Claude Code](https://claude.ai/code) — Agentic AI DevOps*
