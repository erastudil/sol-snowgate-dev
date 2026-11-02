#!/usr/bin/env bash
set -e
REPO_NAME="${1:-sol-snowgate-dev}"
echo "=== Deploying $REPO_NAME for sol.snowgate.dev ==="

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) not found. Install from https://cli.github.com/ or push manually:"
  echo "  git remote add origin git@github.com:<YOUR_USER>/$REPO_NAME.git"
  echo "  git push -u origin main"
  exit 1
fi

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git init -b main
  git add .
  git commit -m "Initial commit: sol.snowgate.dev 1-page 4H SOL-PERP signal monitor"
fi

gh repo create "$REPO_NAME" --public --source=. --remote=origin --push
GH_USER=$(gh api user -q .login)

echo ""
echo "=== NEXT STEP: Add DNS CNAME Record for sol.snowgate.dev ==="
echo "  Type : CNAME"
echo "  Name : sol"
echo "  Value: ${GH_USER}.github.io"
echo "  TTL  : Auto / 300"
echo ""
echo "GitHub Actions will automatically publish https://sol.snowgate.dev once DNS propagates!"
