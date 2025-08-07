#!/usr/bin/env bash

if [ -f package.json ]; then
  bash -i -c "nvm install --lts && nvm install-latest-npm"
  npm i
  npm run build
fi

# Install dependencies for shfmt extension
curl -sS https://webi.sh/shfmt | sh &>/dev/null

# Add OMZ plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i -E "s/^(plugins=\()(git)(\))/\1\2 zsh-syntax-highlighting zsh-autosuggestions\3/" ~/.zshrc

# Avoid git log use less
echo -e "\nunset LESS" >>~/.zshrc

# Cloud Flow Dependencies Setup
echo "Setting up cloud Flow dependencies..."

# Install Cloudflare CLI (wrangler)
npm install -g wrangler

# Install additional cloud tools
# Install Docker Compose (if not already available)
if ! command -v docker-compose &> /dev/null; then
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

# Install Helm (Kubernetes package manager)
curl https://get.helm.sh/helm-v3.13.0-linux-amd64.tar.gz | tar xz
sudo mv linux-amd64/helm /usr/local/bin/helm
rm -rf linux-amd64

# Install Pulumi (Infrastructure as Code alternative to Terraform)
curl -fsSL https://get.pulumi.com | sh
echo 'export PATH=$PATH:$HOME/.pulumi/bin' >> ~/.zshrc

# Install act (Run GitHub Actions locally)
curl https://raw.githubusercontent.com/nektos/act/master/install.sh | sudo bash

# Set up cloud CLI aliases and helpful commands
cat >> ~/.zshrc << 'EOF'

# Cloud Flow aliases and functions
alias azlogin='az login'
alias awsprofile='aws configure list-profiles'
alias gcpauth='gcloud auth login'
alias k='kubectl'
alias tf='terraform'
alias cflogin='wrangler login'

# Helpful cloud functions
cloud-status() {
    echo "=== Cloud CLI Status ==="
    echo "Azure CLI: $(az --version 2>/dev/null | head -n1 || echo 'Not configured')"
    echo "AWS CLI: $(aws --version 2>/dev/null || echo 'Not configured')"
    echo "Google Cloud CLI: $(gcloud --version 2>/dev/null | head -n1 || echo 'Not configured')"
    echo "Terraform: $(terraform --version 2>/dev/null | head -n1 || echo 'Not configured')"
    echo "kubectl: $(kubectl version --client --short 2>/dev/null || echo 'Not configured')"
    echo "Cloudflare CLI: $(wrangler --version 2>/dev/null || echo 'Not configured')"
}

cloud-help() {
    echo "=== Cloud Flow Commands ==="
    echo "cloud-status  - Show status of all cloud CLIs"
    echo "azlogin       - Login to Azure"
    echo "awsprofile    - List AWS profiles"
    echo "gcpauth       - Authenticate with Google Cloud"
    echo "cflogin       - Login to Cloudflare"
    echo "k             - kubectl shorthand"
    echo "tf            - terraform shorthand"
}
EOF

echo "Cloud Flow dependencies setup completed!"
echo "Run 'cloud-help' for available commands and 'cloud-status' to check installation status."

# Run verification script
echo ""
echo "Running setup verification..."
bash .devcontainer/verify-cloud-setup.sh
