param(
    [string]$RepoName = "sol-snowgate-dev"
)
Write-Host "=== Deploying $RepoName for sol.snowgate.dev ===" -ForegroundColor Cyan

if (-not (Test-Path ".git")) {
    git init -b main
    git add .
    git commit -m "Initial commit: sol.snowgate.dev 1-page 4H SOL-PERP signal monitor"
}

gh repo create $RepoName --public --source=. --remote=origin --push
$GhUser = (gh api user -q .login)

Write-Host "`n=== NEXT STEP: Add DNS CNAME Record in snowgate.dev DNS ===" -ForegroundColor Green
Write-Host "  Type : CNAME"
Write-Host "  Name : sol"
Write-Host "  Value: $GhUser.github.io"
