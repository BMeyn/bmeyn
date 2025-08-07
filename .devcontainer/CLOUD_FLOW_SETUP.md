# Cloud Flow Dependencies Setup

This devcontainer includes a comprehensive set of cloud workflow tools and dependencies to enable seamless cloud development and deployment workflows.

## Included Tools

### Cloud CLI Tools
- **Azure CLI** - Manage Azure resources and services
- **AWS CLI** - Interact with Amazon Web Services
- **Google Cloud CLI** - Work with Google Cloud Platform
- **Cloudflare CLI (Wrangler)** - Deploy and manage Cloudflare Workers
- **GitHub CLI** - Manage GitHub repositories and workflows

### Infrastructure & Orchestration
- **Terraform** - Infrastructure as Code provisioning
- **Pulumi** - Modern Infrastructure as Code platform
- **kubectl** - Kubernetes cluster management
- **Helm** - Kubernetes package manager
- **Docker Compose** - Multi-container Docker applications

### Development Tools
- **act** - Run GitHub Actions locally for testing workflows

## Quick Start

### 1. Check Installation Status
```bash
cloud-status
```

### 2. Authentication Setup

#### Azure
```bash
az login
```

#### AWS
```bash
aws configure
# or
aws sso login --profile your-profile
```

#### Google Cloud
```bash
gcloud auth login
gcloud config set project your-project-id
```

#### Cloudflare
```bash
wrangler login
```

#### GitHub
```bash
gh auth login
```

### 3. Available Aliases and Commands

- `azlogin` - Login to Azure
- `awsprofile` - List AWS profiles
- `gcpauth` - Authenticate with Google Cloud
- `cflogin` - Login to Cloudflare
- `k` - kubectl shorthand
- `tf` - terraform shorthand
- `cloud-help` - Show all available cloud commands
- `cloud-status` - Display status of all cloud CLIs

## Common Workflows

### Infrastructure Management
```bash
# Initialize Terraform
tf init

# Plan infrastructure changes
tf plan

# Apply changes
tf apply

# Kubernetes operations
k get pods
k apply -f deployment.yaml
```

### Cloudflare Workers Development
```bash
# Create new worker
wrangler generate my-worker

# Deploy worker
wrangler publish

# View logs
wrangler tail
```

### GitHub Actions Testing
```bash
# Run GitHub Actions locally
act

# Run specific workflow
act workflow_dispatch
```

## Environment Configuration

### Required Environment Variables
Set these in your shell or `.env` file:

```bash
# AWS
AWS_PROFILE=your-profile

# Azure
AZURE_SUBSCRIPTION_ID=your-subscription-id

# Google Cloud
GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account.json

# Cloudflare
CLOUDFLARE_API_TOKEN=your-api-token
```

### Configuration Files Location
- AWS: `~/.aws/config` and `~/.aws/credentials`
- Azure: `~/.azure/`
- Google Cloud: `~/.config/gcloud/`
- Kubernetes: `~/.kube/config`

## Troubleshooting

### Permission Issues
If you encounter permission issues, ensure you're authenticated with the respective cloud provider:

```bash
# Check current authentication status
cloud-status

# Re-authenticate if needed
az login  # Azure
aws sso login  # AWS
gcloud auth login  # Google Cloud
```

### Tool Not Found
If a tool is not found after container restart:

1. Rebuild the devcontainer
2. Check if the tool was installed correctly: `which <tool-name>`
3. Reload shell configuration: `source ~/.zshrc`

## Integration with Jekyll Blog

This setup enables cloud workflows for:
- Deploying the blog to cloud platforms
- Managing CDN configurations (Cloudflare)
- Automating build and deployment pipelines
- Infrastructure provisioning for hosting

### Example: Cloudflare Pages Deployment
```bash
# Configure Cloudflare Pages
wrangler pages project create my-blog

# Deploy to Cloudflare Pages
wrangler pages publish _site
```

## Contributing

To add new cloud tools or modify the setup:
1. Update `.devcontainer/devcontainer.json` for container features
2. Modify `.devcontainer/post-create.sh` for additional installations
3. Update this documentation