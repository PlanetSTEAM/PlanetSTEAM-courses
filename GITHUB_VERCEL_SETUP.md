# 🚀 GitHub → Vercel Deployment Setup

**Version:** 2.0  
**Status:** Configuration for planetsteam Account  
**Email:** planetsteamweb@gmail.com  
**Date:** August 15, 2026

---

## 📋 SETUP STRATEGY

```
Local Machine
    ↓
GitHub (planetsteam/PlanetSTEAM-courses)
    ↓
Vercel (planetsteam account)
    ↓
https://planetsteam-courses.vercel.app ✨
```

---

## ✅ STEP 1: GitHub Setup (planetsteam Account)

### 1a: Verify GitHub Account

```bash
# Login with planetsteam account
# https://github.com/login

# Username: planetsteam
# Email: planetsteamweb@gmail.com
```

### 1b: Create Repository

**On GitHub.com:**

1. Click **"New"** (or go to github.com/new)
2. Repository name: `PlanetSTEAM-courses`
3. Description: "Professional STEAM bootcamp courses - 22 courses, 1,056 modules"
4. Visibility: **Private** (only team access)
5. Initialize with: None (we'll push local repo)
6. Click **"Create repository"**

### 1c: Get Repository URL

```
https://github.com/planetsteam/PlanetSTEAM-courses.git
```

---

## ✅ STEP 2: Push Local Repo to GitHub

### 2a: Update Git Remote

```bash
# Navigate to local repo
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses

# Check current remote
git remote -v
# Should show: origin https://github.com/lcarrenoy/PlanetSTEAM-courses.git

# Update to planetsteam account
git remote set-url origin https://github.com/planetsteam/PlanetSTEAM-courses.git

# Verify
git remote -v
# Should show: origin https://github.com/planetsteam/PlanetSTEAM-courses.git
```

### 2b: Push All Content

```bash
# Create main branch if needed
git branch -M main

# Push all commits
git push -u origin main

# This pushes:
# ✅ All 1,056 module files
# ✅ Documentation files
# ✅ Dashboard HTML
# ✅ Quarto configuration

# Verify on GitHub
# https://github.com/planetsteam/PlanetSTEAM-courses
```

### 2c: Configure GitHub Pages (Optional - for local testing)

**On GitHub.com → Settings → Pages:**

1. Source: Deploy from a branch
2. Branch: `main`
3. Folder: `/docs` (if using GitHub Pages for HTML)
4. Save

This creates: `https://planetsteam.github.io/PlanetSTEAM-courses`

---

## ✅ STEP 3: Vercel Deployment

### 3a: Create Vercel Account (if needed)

```
Login: https://vercel.com/
Email: planetsteamweb@gmail.com
Password: [use your password]
Account name: planetsteam (or organization)
```

### 3b: Connect GitHub to Vercel

**On Vercel.com:**

1. Dashboard → **"New Project"**
2. Click **"Continue with GitHub"**
3. Authorize Vercel to access GitHub
4. Search for: `PlanetSTEAM-courses`
5. Click **"Import"**

### 3c: Configure Project Settings

**On Vercel Import Screen:**

```
Project Name: planetsteam-courses
Framework Preset: Other (since using Quarto)
Root Directory: ./
Build Command: quarto render
Output Directory: docs
```

**Environment Variables:**
```
QUARTO_PYTHON_REQUIRED: true
```

**Click "Deploy"**

### 3d: Verify Deployment

After ~3-5 minutes:

```
✅ Build completed
✅ Production URL: https://planetsteam-courses.vercel.app
✅ Site live at that URL
```

---

## 🔄 CONTINUOUS DEPLOYMENT

### Automatic Updates

Once connected, **every push to `main` triggers:**

```
Git push → GitHub
    ↓
GitHub webhook → Vercel
    ↓
Vercel: quarto render
    ↓
Vercel: Deploy new version
    ↓
Site updates automatically ✨
```

### Manual Redeploy

If needed:

1. Vercel Dashboard
2. Project: `planetsteam-courses`
3. Click **"Redeploy"**
4. Choose latest commit
5. Click **"Redeploy"**

---

## 📝 WORKFLOW (Going Forward)

### Make Changes Locally

```bash
# Edit course
nano 02-courses/01-python/01-junior/01-module.qmd

# Test locally
quarto render 02-courses/01-python/01-junior/01-module.qmd

# Verify in browser
open docs/02-courses/01-python/01-junior/01-module.html
```

### Push to GitHub

```bash
# Add changes
git add 02-courses/01-python/01-junior/01-module.qmd

# Commit
git commit -m "Update: Python Junior Module 1 - Fixed exercise 3"

# Push to GitHub
git push origin main

# GitHub webhook automatically notifies Vercel
# Vercel rebuilds and deploys within 2-3 minutes
```

### Verify on Vercel

```
✅ Visit: https://planetsteam-courses.vercel.app
✅ See updated content live
```

---

## 🎯 URLS SUMMARY

### GitHub
```
Repository: https://github.com/planetsteam/PlanetSTEAM-courses
Git Clone: git clone https://github.com/planetsteam/PlanetSTEAM-courses.git
Settings: https://github.com/planetsteam/PlanetSTEAM-courses/settings
```

### Vercel
```
Project: https://vercel.com/planetsteam/planetsteam-courses
Live Site: https://planetsteam-courses.vercel.app
Dashboard: https://vercel.com/dashboard
```

### Course Access
```
Free Courses: https://planetsteam-courses.vercel.app/02-courses/
Dashboard: https://planetsteam-courses.vercel.app/dashboard-courses.html
```

---

## 🔐 SECURITY

### GitHub Access

**Add Team Members:**

1. GitHub.com → PlanetSTEAM-courses
2. Settings → Collaborators
3. Add users with role: "Collaborator" or "Maintainer"

### Vercel Access

**Add Team Members:**

1. Vercel.com → Settings → Members
2. Invite users
3. Set permissions: "Developer" or "Admin"

### Credentials

**Never commit:**
- `.env` files
- API keys
- Passwords
- Private credentials

**Store safely:**
```
1. Use GitHub Secrets (for CI/CD)
2. Use Vercel Environment Variables
3. Keep locally in .env (add to .gitignore)
```

---

## 🛠️ TROUBLESHOOTING

### Issue: Build Fails on Vercel

```
Error: "quarto command not found"

Solution:
1. Vercel → Settings → Environment
2. Add variable: QUARTO_PYTHON_REQUIRED=true
3. Trigger rebuild
```

### Issue: Webhook Not Firing

```
Error: "Changes pushed but site not updating"

Solution:
1. Vercel → Settings → Git
2. Disconnect and reconnect GitHub
3. Or manually click "Redeploy"
```

### Issue: Wrong Branch Deploying

```
Error: "Old version showing live"

Solution:
1. Vercel → Settings → Git
2. Verify "Production Branch" = main
3. Check latest commit is deployed
4. Click "Redeploy" if needed
```

### Issue: Large File Timeout

```
Error: "Build timeout after 15 minutes"

Solution:
1. Check file sizes: du -sh docs/
2. Optimize large images (> 1MB)
3. Remove unnecessary files
4. Push again
```

---

## 📊 BUILD MONITORING

### GitHub Actions (Optional)

Can add GitHub Actions workflow for pre-deploy checks:

**File: `.github/workflows/check.yml`**

```yaml
name: Validate Courses
on: [push]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Validate modules
        run: python scripts/validate-all-modules.py
```

This runs before Vercel build:
- ✅ Validates all modules
- ✅ Checks for errors
- ✅ Prevents bad commits

---

## 📈 MONITORING LIVE SITE

### Check Build Status

```bash
# Last deployment
curl https://api.vercel.com/v6/deployments?projectId=[ID] \
  -H "Authorization: Bearer $VERCEL_TOKEN"

# Or check Vercel dashboard
https://vercel.com/planetsteam/planetsteam-courses
```

### Site Analytics

On Vercel dashboard:
- Deployments history
- Build times
- Edge network usage
- Error logs

### Uptime Monitoring

```
Vercel provides:
✅ Automatic HTTPS
✅ CDN distribution
✅ 99.95% uptime SLA
✅ Automatic failover
```

---

## 🎯 COMPLETE SETUP CHECKLIST

### Phase 1: GitHub Setup
- [ ] planetsteam account created (or use existing)
- [ ] Email: planetsteamweb@gmail.com verified
- [ ] New repo: PlanetSTEAM-courses created (Private)
- [ ] Local git remote updated to planetsteam/PlanetSTEAM-courses
- [ ] All commits pushed to main branch
- [ ] GitHub Pages configured (optional)
- [ ] Team members added as collaborators

### Phase 2: Vercel Setup
- [ ] Vercel account created (or use existing)
- [ ] Email: planetsteamweb@gmail.com
- [ ] GitHub connected to Vercel
- [ ] New project imported: PlanetSTEAM-courses
- [ ] Build command: `quarto render`
- [ ] Output directory: `docs`
- [ ] Environment variables added

### Phase 3: Testing
- [ ] First deployment successful
- [ ] Production URL live: planetsteam-courses.vercel.app
- [ ] All 22 courses accessible
- [ ] Dashboard loads (dashboard-courses.html)
- [ ] Links work
- [ ] Navigation functional

### Phase 4: Team Access
- [ ] GitHub collaborators invited
- [ ] Vercel team members invited
- [ ] Permissions set correctly
- [ ] Access verified for all team

### Phase 5: Documentation Updated
- [ ] This file saved locally
- [ ] Links updated in COURSES_INDEX.md
- [ ] Links updated in MAINTENANCE_GUIDE.md
- [ ] Dashboard links updated
- [ ] README updated with new URLs

---

## 📧 HANDOFF

After completion, share:

```
✅ GitHub Repo: https://github.com/planetsteam/PlanetSTEAM-courses
✅ Live Site: https://planetsteam-courses.vercel.app
✅ Dashboard: https://planetsteam-courses.vercel.app/dashboard-courses.html
✅ Email: planetsteamweb@gmail.com

To team:
- Clone: git clone https://github.com/planetsteam/PlanetSTEAM-courses.git
- Read: MAINTENANCE_GUIDE.md
- Edit: Any .qmd file in 02-courses/
- Push: Changes auto-deploy via Vercel
```

---

## ✨ SUCCESS

When complete:

```
✅ 1,056 modules live
✅ 22 courses accessible
✅ Auto-deployment working
✅ Team can collaborate
✅ Public can browse
✅ Uses planetsteam brand
✅ Powered by Vercel
✅ Secure on GitHub
```

---

**Configuration Date:** August 15, 2026  
**Account:** planetsteam (GitHub & Vercel)  
**Email:** planetsteamweb@gmail.com  
**Status:** Ready to Deploy

