#!/usr/bin/env bash

# Cloud Flow Setup Verification Script
echo "🌟 Cloud Flow Dependencies Verification"
echo "======================================="

# Check if we're in a devcontainer
if [ -n "$REMOTE_CONTAINERS" ] || [ -n "$CODESPACES" ]; then
    echo "✅ Running in devcontainer environment"
else
    echo "⚠️  Not running in devcontainer - some tools may not be available"
fi

echo ""
echo "📦 Checking Cloud CLI Tools:"
echo "----------------------------"

# Function to check command availability
check_command() {
    local cmd=$1
    local name=$2
    
    if command -v "$cmd" &> /dev/null; then
        version=$($cmd --version 2>/dev/null | head -n1 || echo "version unknown")
        echo "✅ $name: $version"
        return 0
    else
        echo "❌ $name: Not found"
        return 1
    fi
}

# Check all cloud tools
check_command "az" "Azure CLI"
check_command "aws" "AWS CLI"
check_command "gcloud" "Google Cloud CLI"
check_command "wrangler" "Cloudflare CLI"
check_command "gh" "GitHub CLI"
check_command "terraform" "Terraform"
check_command "kubectl" "kubectl"
check_command "helm" "Helm"
check_command "docker" "Docker"
check_command "docker-compose" "Docker Compose"
check_command "act" "GitHub Actions (act)"

echo ""
echo "🔧 Development Tools:"
echo "---------------------"
check_command "node" "Node.js"
check_command "npm" "npm"
check_command "git" "Git"
check_command "code" "VS Code CLI"

echo ""
echo "📁 Configuration Directories:"
echo "-----------------------------"

check_dir() {
    local dir=$1
    local name=$2
    
    if [ -d "$dir" ]; then
        echo "✅ $name: $dir"
    else
        echo "❌ $name: $dir (not found)"
    fi
}

check_dir "$HOME/.aws" "AWS Config"
check_dir "$HOME/.azure" "Azure Config"
check_dir "$HOME/.config/gcloud" "Google Cloud Config"
check_dir "$HOME/.kube" "Kubernetes Config"

echo ""
echo "🎯 Custom Commands Available:"
echo "-----------------------------"
if command -v cloud-status &> /dev/null; then
    echo "✅ cloud-status - Check all cloud CLIs"
    echo "✅ cloud-help - Show cloud commands help"
    echo "✅ azlogin, awsprofile, gcpauth, cflogin - Quick auth commands"
    echo "✅ k (kubectl), tf (terraform) - Command aliases"
else
    echo "❌ Custom cloud commands not loaded (restart shell or source ~/.zshrc)"
fi

echo ""
echo "🚀 Setup Summary:"
echo "-----------------"

total_tools=11
found_tools=0

for cmd in az aws gcloud wrangler gh terraform kubectl helm docker docker-compose act; do
    if command -v "$cmd" &> /dev/null; then
        ((found_tools++))
    fi
done

echo "Tools installed: $found_tools/$total_tools"

if [ $found_tools -eq $total_tools ]; then
    echo "🎉 All cloud Flow dependencies are installed and ready!"
    echo ""
    echo "Next steps:"
    echo "1. Run 'cloud-help' for available commands"
    echo "2. Run 'cloud-status' to check authentication status"
    echo "3. Authenticate with your cloud providers"
    echo "4. Check the documentation: .devcontainer/CLOUD_FLOW_SETUP.md"
elif [ $found_tools -gt $((total_tools / 2)) ]; then
    echo "⚠️  Most tools are installed, but some may be missing."
    echo "   Consider rebuilding the devcontainer if tools are missing."
else
    echo "❌ Many tools are missing. Please rebuild the devcontainer."
fi

echo ""
echo "📖 For detailed setup instructions, see:"
echo "   .devcontainer/CLOUD_FLOW_SETUP.md"