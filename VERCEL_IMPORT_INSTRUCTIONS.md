# ✅ VERCEL IMPORT — PlanetSTEAM Courses

**Status:** Ready to Import  
**Target Account:** planetsteam  
**Time:** ~5 minutes

---

## 🎯 YOU ARE HERE

```
✅ GitHub Push: DONE (planetsteam/PlanetSTEAM-courses)
⏳ Vercel Import: NOW (add new project)
🔄 Auto-Deploy: NEXT (verify live)
```

---

## 🚀 STEP-BY-STEP IMPORT

### Step 1: Go to Vercel Dashboard

```
URL: https://vercel.com/planetsteams-projects
(Already logged in as planetsteam)
```

You should see:
- ✅ "planetsteam's..." account
- ✅ Existing projects (planet-steam-app, luisc_0ekf270, mywebhtml)

### Step 2: Click "Add New" Button

```
Top right of Projects section
Click: "Add New" (black button)
```

Options appear:
- Project
- Environment
- Integration

### Step 3: Select "Project"

Click dropdown arrow next to "Add New":
```
↓ Add New
  → Project ← CLICK HERE
  → Environment
  → Integration
```

### Step 4: Import from Git

```
Choose: "Continue with GitHub"

You'll see two options:
1. Select Git Repository
2. Clone Template

Choose: "Select Git Repository"
```

### Step 5: Search for Repository

```
Search box appears: "Search repositories..."

Type: PlanetSTEAM-courses

Select: planetsteam/PlanetSTEAM-courses
```

### Step 6: Configure Project

After selecting repository, you see:

```
┌─────────────────────────────────┐
│ Import Git Repository           │
├─────────────────────────────────┤
│                                 │
│ Project Name:                   │
│ [planetsteam-courses          ] │
│                                 │
│ Framework Preset:               │
│ ○ Next.js                      │
│ ○ Svelte                       │
│ ⦿ Other (Recommended)          │
│                                 │
│ Root Directory:                 │
│ [./                            ] │
│                                 │
│ Build Command:                  │
│ [quarto render                 ] │
│                                 │
│ Output Directory:               │
│ [docs                          ] │
│                                 │
│ Install Command:                │
│ [                              ] │
│                                 │
│ Environment Variables:          │
│ [                              ] │
│                                 │
│ [Deploy] [Cancel]              │
└─────────────────────────────────┘
```

**SETTINGS:**

```
Project Name: planetsteam-courses
Framework: Other (not Next.js)
Root Directory: ./
Build Command: quarto render
Output Directory: docs
Install Command: (leave empty)
Environment: (leave empty for now)
```

### Step 7: Click Deploy

```
Click the blue "Deploy" button

Vercel will:
1. Clone repository
2. Install dependencies
3. Run: quarto render
4. Build: 1,056 modules
5. Deploy to CDN
```

---

## ⏱️ WAITING FOR BUILD

While Vercel builds:

```
🔄 Cloning repository...         (10 sec)
🔄 Installing dependencies...    (30 sec)
🔄 Running build command...      (4-5 min)
🔄 Generating output...          (30 sec)
✅ Deploying to CDN...           (20 sec)

TOTAL: ~5-6 minutes
```

Watch the build log for:
- ✅ "Cloning completed"
- ✅ "Installing packages"
- ✅ "Rendering with Quarto"
- ✅ "✓ Production ready"

---

## ✅ AFTER DEPLOYMENT

### Success Screen

You should see:

```
✅ Production Deployment

Domains:
  • planetsteam-courses.vercel.app

Status: Ready
Created: [timestamp] by planetsteam

Visit: [blue button]
```

### Click "Visit" Button

This opens your live site:

```
https://planetsteam-courses.vercel.app
```

Should show:
- ✅ Landing page
- ✅ All 22 courses
- ✅ Navigation working
- ✅ Dashboard accessible

---

## 🧪 VERIFICATION CHECKLIST

After site loads, verify:

- [ ] **Home Page Loads**
  ```
  https://planetsteam-courses.vercel.app/
  ```

- [ ] **Dashboard Works**
  ```
  https://planetsteam-courses.vercel.app/dashboard-courses.html
  ```

- [ ] **Course Accessible**
  ```
  https://planetsteam-courses.vercel.app/02-courses/01-python/
  ```

- [ ] **Module Loads**
  ```
  https://planetsteam-courses.vercel.app/02-courses/01-python/01-junior/
  ```

- [ ] **Styling Correct**
  - Navy blue header
  - Gold accents
  - Responsive on mobile

- [ ] **Navigation Works**
  - Click links
  - No 404 errors
  - Back button works

---

## 🎯 FINAL RESULT

After everything is live:

```
✅ GitHub Repository
   https://github.com/planetsteam/PlanetSTEAM-courses
   (Source code)

✅ Vercel Live Site  
   https://planetsteam-courses.vercel.app
   (Public access)

✅ Course Dashboard
   https://planetsteam-courses.vercel.app/dashboard-courses.html
   (Browse by role/category)

✅ Individual Courses
   https://planetsteam-courses.vercel.app/02-courses/01-python/
   (Full 48 modules per course)

✅ Auto-Deployment
   Push → GitHub → Vercel → Live (2-3 min automatic)
```

---

## 🔄 HOW AUTO-DEPLOYMENT WORKS

After initial setup, every `git push`:

```
1. You push to GitHub
   git push origin main

2. GitHub notifies Vercel (webhook)
   ↓

3. Vercel automatically:
   - Clones latest code
   - Runs: quarto render
   - Deploys new build
   ↓

4. Site updates within 2-3 minutes
   No manual action needed!
```

---

## 🛠️ TROUBLESHOOTING

### Issue: Build fails with "quarto not found"

**Solution:**
1. Vercel Dashboard → Settings
2. Environment Variables → Add:
   ```
   QUARTO_PYTHON_REQUIRED = true
   ```
3. Trigger Redeploy

### Issue: Build timeout after 15 minutes

**Solution:**
1. Check file sizes: `du -sh docs/`
2. Optimize large images (reduce > 1MB)
3. Retry deploy in Vercel

### Issue: Blank page or 404 errors

**Solution:**
1. Verify `docs/` folder has content
2. Check `quarto render` ran successfully locally
3. Vercel → Deployments → View Logs

### Issue: CSS/Images not loading

**Solution:**
1. Clear browser cache (Ctrl+Shift+Delete)
2. Hard refresh (Ctrl+Shift+R)
3. Check console for 404 errors
4. Verify relative paths in HTML

---

## 📊 WHAT'S DEPLOYED

Vercel serves:

```
https://planetsteam-courses.vercel.app/
├── index.html (landing)
├── dashboard-courses.html (browser)
├── 02-courses/ (all modules)
│   ├── 01-python/
│   │   ├── index.html
│   │   ├── 01-junior/
│   │   │   ├── 01-module.html
│   │   │   ├── 02-module.html
│   │   │   └── ... (12 modules)
│   │   ├── 02-mid-level/
│   │   ├── 03-senior/
│   │   └── 04-lead/
│   ├── 02-java/
│   ├── ... (20 more courses)
│   └── 22-ai-product-mgmt/
└── assets/ (CSS, images, etc.)
```

**Total:** 1,056 HTML files + assets

---

## 📈 MONITORING

After deployment, you can monitor:

### On Vercel Dashboard:

1. **Deployments Tab**
   - View deployment history
   - Check build logs
   - Trigger redeploys

2. **Analytics Tab**
   - Page views
   - Edge network usage
   - Performance metrics

3. **Settings Tab**
   - Environment variables
   - Build settings
   - Custom domains

---

## ✨ SUCCESS INDICATORS

You've successfully deployed when:

```
✅ Vercel shows "Ready" status (green)
✅ Production URL is live and responsive
✅ All courses accessible
✅ Dashboard loads with filters working
✅ No errors in browser console
✅ Images and styling display correctly
✅ Navigation between modules works
✅ Can access all 1,056 module pages
```

---

## 🎉 YOU'RE DONE!

Once live, share these URLs:

```
📚 Full Courses: https://planetsteam-courses.vercel.app
📊 Dashboard: https://planetsteam-courses.vercel.app/dashboard-courses.html
🐙 GitHub: https://github.com/planetsteam/PlanetSTEAM-courses
📧 Email: planetsteamweb@gmail.com
```

---

## 📝 NEXT UPDATES

From now on, to update courses:

```bash
# 1. Make changes locally
nano 02-courses/01-python/01-junior/01-module.qmd

# 2. Test locally (optional)
quarto render 02-courses/01-python/01-junior/01-module.qmd

# 3. Commit and push
git add .
git commit -m "Update: Module changes"
git push origin main

# 4. Wait 2-3 minutes
# Vercel automatically builds and deploys!

# 5. Verify live
# Visit: https://planetsteam-courses.vercel.app
```

---

**Status:** Ready to Import  
**Date:** August 15, 2026  
**Account:** planetsteam  
**Email:** planetsteamweb@gmail.com

