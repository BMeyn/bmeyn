# DevContainer Setup

This directory contains the complete devcontainer configuration for the Jekyll blog with cloud Flow dependencies.

## Files

- `devcontainer.json` - Main devcontainer configuration with cloud CLI tools and VS Code extensions
- `post-create.sh` - Setup script that runs after container creation to install additional tools
- `verify-cloud-setup.sh` - Verification script to check if all cloud tools are properly installed
- `CLOUD_FLOW_SETUP.md` - Comprehensive documentation for using cloud Flow tools
- `examples/` - Example configurations and scripts for cloud workflows

## Quick Start

1. **Open in DevContainer**: Use VS Code with the Dev Containers extension to open this repository
2. **Wait for Setup**: The post-create script will automatically install all cloud Flow dependencies
3. **Verify Installation**: Run `./devcontainer/verify-cloud-setup.sh` to check the setup
4. **Start Using**: Use `cloud-help` for available commands and `cloud-status` to check authentication

## Cloud Tools Included

### CLI Tools
- Azure CLI
- AWS CLI  
- Google Cloud CLI
- Cloudflare CLI (Wrangler)
- GitHub CLI

### Infrastructure & Orchestration
- Terraform
- Pulumi
- kubectl
- Helm
- Docker Compose

### Development Tools
- act (GitHub Actions local runner)
- Various VS Code extensions for cloud development

## Authentication Setup

After the devcontainer starts, authenticate with your cloud providers:

```bash
# Azure
az login

# AWS
aws configure

# Google Cloud
gcloud auth login

# Cloudflare
wrangler login

# GitHub
gh auth login
```

## Next Steps

1. Check `CLOUD_FLOW_SETUP.md` for detailed usage instructions
2. Explore the `examples/` directory for sample configurations
3. Run `cloud-help` for available custom commands
4. Start building and deploying your cloud workflows!

## Troubleshooting

If tools are missing or not working:
1. Rebuild the devcontainer
2. Check the post-create.sh logs
3. Run the verification script: `./devcontainer/verify-cloud-setup.sh`