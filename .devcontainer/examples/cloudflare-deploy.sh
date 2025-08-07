#!/usr/bin/env bash

# Cloudflare Pages Deployment Script
# This script builds and deploys the Jekyll blog to Cloudflare Pages

set -e

echo "🚀 Deploying Jekyll blog to Cloudflare Pages"

# Check if wrangler is logged in
if ! wrangler whoami &>/dev/null; then
    echo "❌ Please login to Cloudflare first: wrangler login"
    exit 1
fi

# Build the Jekyll site
echo "📦 Building Jekyll site..."
bundle exec jekyll build

# Deploy to Cloudflare Pages
echo "🌐 Deploying to Cloudflare Pages..."
wrangler pages publish _site

echo "✅ Deployment completed!"
echo "💡 Check your deployment status at: https://dash.cloudflare.com/"