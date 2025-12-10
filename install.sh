#!/bin/bash

# AutoDoc Manual Installation Script
# Usage: curl -sSL https://raw.githubusercontent.com/Harry-kp/autodoc/main/install.sh | bash

set -e

echo "🤖 AutoDoc Installation Script"
echo "================================"
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not in a git repository"
    echo "Please run this script from the root of your project"
    exit 1
fi

# Create directories
echo "📁 Creating directories..."
mkdir -p .github/agents
mkdir -p .github/workflows

# Download agent configuration
echo "🤖 Downloading Copilot agent configuration..."
curl -sSL -o .github/agents/docusaurus.md \
    https://raw.githubusercontent.com/Harry-kp/autodoc/main/.github/agents/docusaurus.md

if [ ! -f .github/agents/docusaurus.md ]; then
    echo "❌ Failed to download agent configuration"
    exit 1
fi

# Download workflow
echo "⚙️  Downloading GitHub Actions workflow..."
curl -sSL -o .github/workflows/auto-docs.yml \
    https://raw.githubusercontent.com/Harry-kp/autodoc/main/.github/workflows/auto-docs.yml

if [ ! -f .github/workflows/auto-docs.yml ]; then
    echo "❌ Failed to download workflow"
    exit 1
fi

echo ""
echo "✅ Installation complete!"
echo ""
echo "📋 Files added:"
echo "  - .github/agents/docusaurus.md"
echo "  - .github/workflows/auto-docs.yml"
echo ""
echo "🚀 Next steps:"
echo "  1. Review the files: git status"
echo "  2. Commit the changes: git add .github/ && git commit -m 'feat: Add AutoDoc agent'"
echo "  3. Push to GitHub: git push"
echo "  4. Ensure GitHub Copilot is enabled on your repository"
echo "  5. Test by merging a PR with code changes"
echo ""
echo "📚 Documentation: https://github.com/Harry-kp/autodoc"
echo ""
