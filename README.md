# `sol.snowgate.dev` — 1-Page No-Scroll SOL-PERP 4H Signal & Proximity Watch Dashboard

Zero-scroll (`100vh`) live monitoring web app for the two zero-losing-year Jupiter `SOL-PERP` 4-hour strategies (`#1 F6_07 Wyckoff Spring/SFP Sweep` and `#2 F8_05 STH-SOPR Capitulation Flush`), with persistent Web Audio chimes, dynamic tab-title ticker, and live Kraken / Binance / Jupiter Price API v2 polling.

## Quick Local Deployment to `sol.snowgate.dev` (30 Seconds)

### Option A: GitHub Pages (Pre-configured via `CNAME` + `.github/workflows/deploy.yml`)
1. Unzip this folder and open a terminal inside it:
   ```bash
   ./deploy_sol_snowgate.sh
   ```
   *(Or on Windows PowerShell: `./deploy_sol_snowgate.ps1`)*
2. In your DNS provider for **`snowgate.dev`** (Cloudflare, Route53, Namecheap, etc.), add a `CNAME` record:
   - **Type:** `CNAME`
   - **Name / Host:** `sol`
   - **Target:** `<your-github-username>.github.io` (if using Cloudflare, set Proxy status to **DNS Only** while GitHub provisions the Let's Encrypt TLS certificate, then you can toggle Proxy on).
3. In your GitHub repo **Settings → Pages**, set **Source** to **GitHub Actions** (the included `CNAME` file automatically binds `sol.snowgate.dev`).

### Option B: Cloudflare Pages or Vercel
- **Vercel:** Run `npx vercel --prod` inside this directory, then run `npx vercel domains add sol.snowgate.dev`.
- **Cloudflare Pages:** Run `npx wrangler pages deploy . --project-name sol-snowgate` and attach custom domain `sol.snowgate.dev` in the Cloudflare dashboard.
