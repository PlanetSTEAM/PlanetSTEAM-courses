# 🚀 EXECUTE PUSH TO GITHUB

**Status:** Ready to Deploy  
**Target:** planetsteam/PlanetSTEAM-courses  
**Time:** ~2-3 minutes

---

## ⚡ QUICK EXECUTION

### Option 1: PowerShell (Easiest - Windows)

```powershell
# 1. Open PowerShell as Administrator
# 2. Navigate to repo
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses

# 3. Allow script execution (first time only)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# 4. Run the push script
.\PUSH_TO_GITHUB.ps1

# ✅ Done! Automatic commit + push to GitHub
```

### Option 2: Git Bash / Terminal

```bash
# 1. Open Terminal/Git Bash
# 2. Navigate to repo
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses

# 3. Run the bash script
bash PUSH_TO_GITHUB.sh

# ✅ Done! Automatic commit + push
```

### Option 3: Manual (Step by Step)

```bash
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses

# Update remote
git remote set-url origin https://github.com/planetsteam/PlanetSTEAM-courses.git

# Verify
git remote -v

# Prepare main branch
git branch -M main

# Stage all files
git add .

# Commit
git commit -m "Build: Complete course system deployment (1,056 modules)"

# Push to GitHub
git push -u origin main

# ✅ Done!
```

---

## ✅ VERIFICATION

### Immediately After Push

```bash
# Check local status
git status
# Should show: "On branch main, Your branch is up to date with 'origin/main'"

# View recent commits
git log --oneline | head -5
# Should show your new commit at top
```

### On GitHub (1-2 minutes)

Visit: https://github.com/planetsteam/PlanetSTEAM-courses

Should show:
- ✅ Repository created
- ✅ All files pushed
- ✅ Latest commit visible
- ✅ Branch: main

### Check File Count

```bash
# Count files pushed
git ls-files | wc -l
# Should be: 1,056+ files (modules + docs)
```

---

## 📊 EXPECTED OUTPUT

When push succeeds, you'll see:

```
Enumerating objects: 2,547, done.
Counting objects: 100% (2,547/2,547), done.
Compressing objects: 100% (2,100/2,100), done.
Writing objects: 100% (2,547/2,547), 245.67 MiB | 5.2 MiB/s
Total 2,547 (delta 847), reused 1,203 (delta 0), pack-reused 0

To github.com:planetsteam/PlanetSTEAM-courses.git
 * [new branch]      main -> main
Branch 'main' set to track remote branch 'main' from 'origin'.

✅ SUCCESS!
```

---

## 🎯 AFTER PUSH: NEXT STEPS (DO NOW!)

### Step 1: Verify GitHub (2 min)

```
1. Go to: https://github.com/planetsteam/PlanetSTEAM-courses
2. See all 1,056+ files
3. Confirm latest commit message
```

### Step 2: Login to Vercel (2 min)

```
1. Go to: https://vercel.com/dashboard
2. Login with: planetsteamweb@gmail.com
3. Click: "New Project"
```

### Step 3: Import from GitHub (2 min)

```
1. Click: "Connect with GitHub"
2. Authorize Vercel
3. Search: "PlanetSTEAM-courses"
4. Click: "Import"
```

### Step 4: Configure Vercel (2 min)

```
Project Settings:
  Project Name: planetsteam-courses
  Build Command: quarto render
  Output Directory: docs
  Environment: (leave empty for now)
  
Click: "Deploy"
```

### Step 5: Wait for Build (5 min)

```
Vercel automatically:
1. Clones from GitHub
2. Installs Quarto
3. Runs: quarto render
4. Builds: 1,056 modules
5. Deploys to CDN
```

### Step 6: Verify Live Site (1 min)

```
After build completes:
1. Go to: https://planetsteam-courses.vercel.app
2. See all courses
3. Test: dashboard-courses.html
4. Verify navigation works
```

---

## ⚠️ TROUBLESHOOTING

### Error: "Permission denied (publickey)"

**Solution:**
```bash
# Check SSH keys
ssh -T git@github.com

# If fails, use HTTPS instead
git remote set-url origin https://github.com/planetsteam/PlanetSTEAM-courses.git
git push origin main
```

### Error: "Everything up-to-date"

**Solution:** This means files already pushed. Continue to Vercel step.

### Error: "Quarto not found" (on Vercel)

**Solution:**
1. Vercel Dashboard → Settings → Environment
2. Add: `QUARTO_PYTHON_REQUIRED=true`
3. Click: Redeploy

### Error: "Build timeout"

**Solution:**
1. Check file sizes: `du -sh docs/`
2. Optimize large images
3. Retry deploy

---

## 📈 FINAL STATUS CHECK

```bash
# Verify everything is ready
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses

# 1. Check files
ls -la 02-courses/ | wc -l
# Should show: 23 (22 courses + 1 file)

# 2. Check modules
find 02-courses -name "*.qmd" | wc -l
# Should show: 1056

# 3. Check documentation
ls -1 *.md | wc -l
# Should show: 7+ (guides)

# 4. Check git
git status
# Should show: "clean working tree"

# 5. Check remote
git remote -v
# Should show: planetsteam/PlanetSTEAM-courses
```

---

## ✨ WHEN EVERYTHING IS DONE

You'll have:

```
✅ GitHub Repository:
   https://github.com/planetsteam/PlanetSTEAM-courses
   (Private, only team access)

✅ Live Vercel Site:
   https://planetsteam-courses.vercel.app
   (Public, all can access)

✅ Dashboard:
   https://planetsteam-courses.vercel.app/dashboard-courses.html
   (Filter by category & role)

✅ Auto-Deployment:
   Push → GitHub → Vercel → Live (2-3 min)

✅ Email:
   planetsteamweb@gmail.com
```

---

## 📋 CHECKLIST

Before running script:

- [ ] In correct directory: D:\Dev\PlanetSTEAM\PlanetSTEAM-courses
- [ ] Git installed and working
- [ ] GitHub account: planetsteam
- [ ] Email: planetsteamweb@gmail.com
- [ ] Vercel account ready (or to create)
- [ ] Internet connection stable

After push completes:

- [ ] No errors in terminal
- [ ] Visit GitHub repo (see all files)
- [ ] Have Vercel dashboard open
- [ ] Ready to click "New Project"

---

## 🚀 READY?

**Run this now:**

```powershell
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses
.\PUSH_TO_GITHUB.ps1
```

**OR (if PowerShell issues):**

```bash
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses
git remote set-url origin https://github.com/planetsteam/PlanetSTEAM-courses.git
git branch -M main
git add .
git commit -m "Build: 1,056 modules - Complete course system"
git push -u origin main
```

**Then immediately go to Vercel and import!**

---

**Execution Time:** ~3 minutes  
**Setup Time:** ~5 minutes (Vercel)  
**Total to Live:** ~8 minutes

**🎉 Let's go!**

