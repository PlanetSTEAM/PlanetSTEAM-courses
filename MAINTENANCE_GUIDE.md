# 🔧 Planet STEAM Courses — Maintenance & Update Guide

**Document Version:** 1.0  
**Created:** August 15, 2026  
**Audience:** Development Team & Course Creators  
**Email:** planetsteamweb@gmail.com

---

## 📋 Table of Contents

1. [Quick Start](#quick-start)
2. [Course Generation](#course-generation)
3. [Update Workflow](#update-workflow)
4. [Quality Assurance](#quality-assurance)
5. [Deployment](#deployment)
6. [Troubleshooting](#troubleshooting)

---

## 🚀 QUICK START

### Prerequisites

```bash
# Install Quarto
# Download from: https://quarto.org/docs/get-started/

# Verify installation
quarto --version

# Clone repository
git clone https://github.com/lcarrenoy/PlanetSTEAM-courses.git
cd PlanetSTEAM-courses

# Install dependencies (if using Python generator)
pip install -r requirements.txt
```

### Generate All Courses (First Time)

```bash
# From repository root
cd 02-courses

# Render all courses to HTML
quarto render

# This will generate HTML for all 1,056 modules
# Takes ~5-10 minutes depending on system
```

### Build & Deploy

```bash
# Build for GitHub Pages
quarto render

# Deploy to GitHub
git add .
git commit -m "Build: All courses rendered with latest updates"
git push origin main

# GitHub Actions will deploy to GitHub Pages automatically
# Live site: https://lcarrenoy.github.io/PlanetSTEAM/
```

---

## 🎓 COURSE GENERATION

### Master Specification

All courses follow: **`COURSE_GENERATION_PROMPT.md`**

**Key Points:**
- ✅ 1 Course = 4 Levels × 12 Modules
- ✅ 4 Levels: Junior, Mid-Level, Senior, Lead
- ✅ Each module contains 7 components (see prompt)
- ✅ 12 modules per level = 48 modules per course

### Generate Single Course

**Example: Generate new course "Ruby on Rails"**

```bash
# 1. Create directory structure
mkdir -p 02-courses/23-ruby-on-rails/{01-junior,02-mid-level,03-senior,04-lead}

# 2. Create _quarto.yml for course
cat > 02-courses/23-ruby-on-rails/_quarto.yml << 'EOF'
project:
  type: website
  output-dir: ../../docs/23-ruby-on-rails

website:
  title: "Ruby on Rails — Professional Mastery"
  navbar:
    left:
      - text: "Planet STEAM"
        href: ../../index.html

format:
  html:
    theme: cosmo
    css: ../../styles.css
    highlight-style: github
    code-copy: true
    number-sections: true
EOF

# 3. Create index.qmd
cat > 02-courses/23-ruby-on-rails/index.qmd << 'EOF'
---
title: "🚀 Ruby on Rails"
subtitle: "Full-Stack Web Development Mastery"
---

Welcome to the Ruby on Rails professional course...
EOF

# 4. Generate modules using template or Python generator
# (See Python Generator section below)

# 5. Render course
cd 02-courses/23-ruby-on-rails
quarto render
```

### Python Generator (Automated)

**Using the generator script:**

```python
# generator-master.py exists at repo root
# It auto-generates module structure

python generator-master.py \
  --course-name "Ruby on Rails" \
  --course-number 23 \
  --tracks "Web Developer,Backend Developer,Full-Stack,DevOps" \
  --certifications "Ruby Certified,Rails Developer Certification" \
  --companies "GitHub,Shopify,Airbnb"
```

**Generator Output:**
```
✅ Course directory created: 02-courses/23-ruby-on-rails/
✅ 4 level directories created (01-junior through 04-lead)
✅ 48 modules generated (12 per level)
✅ _quarto.yml created
✅ index.qmd created
```

---

## 🔄 UPDATE WORKFLOW

### Scenario 1: Update Single Module

```bash
# Edit module content
nano 02-courses/01-python/01-junior/01-module.qmd

# Render that module only
quarto render 02-courses/01-python/01-junior/01-module.qmd

# Verify output in browser
open docs/02-courses/01-python/01-junior/01-module.html

# Commit changes
git add 02-courses/01-python/01-junior/01-module.qmd
git commit -m "Update: Python Junior - Module 1 - Fixed exercise 3"
git push
```

### Scenario 2: Update Entire Course

```bash
# All 48 modules in Python course
cd 02-courses/01-python

# Render course (all 4 levels)
quarto render

# Verify build success
echo "Build completed successfully"

# Commit
cd ../..
git add 02-courses/01-python/
git commit -m "Update: Python course - 48 modules refreshed with new exercises"
git push
```

### Scenario 3: Batch Update Multiple Courses

```bash
# Update 3 courses at once
for course in 01-python 02-java 03-javascript; do
  echo "Updating $course..."
  quarto render 02-courses/$course
done

# Commit all
git add 02-courses/
git commit -m "Update: Python, Java, JavaScript - All modules refreshed"
git push
```

### Scenario 4: Add BI Tools Dashboards

```bash
# Find BI Tools modules
find 02-courses/20-bi-tools -name "*.qmd" -path "*/module*.qmd"

# Edit module with dashboard
nano 02-courses/20-bi-tools/01-junior/05-module.qmd

# Add embedding section (see BI_TOOLS_EMBEDDING_GUIDE.md)
# Example:
# <iframe src="https://public.tableau.com/..." height="600"></iframe>

# Render
quarto render 02-courses/20-bi-tools/01-junior/05-module.qmd

# Verify dashboard displays
open docs/02-courses/20-bi-tools/01-junior/05-module.html

# Commit
git add 02-courses/20-bi-tools/01-junior/05-module.qmd
git commit -m "Add: Tableau dashboard to BI Tools Module 5"
git push
```

---

## ✅ QUALITY ASSURANCE

### Pre-Commit Checklist

Before pushing any changes:

```bash
# 1. Verify Quarto build succeeds
quarto render path/to/module.qmd
# No errors? ✅ Continue

# 2. Check HTML output
open docs/path/to/module.html
# Look for: broken links, missing images, formatting issues

# 3. Validate links
# Check all external links point to correct URLs

# 4. Test code examples
# Copy-paste all code blocks into local editor
# Verify syntax is correct for the language

# 5. Spell check
# Use editor spell checker or: aspell check file.qmd

# 6. Git diff before commit
git diff 02-courses/
# Review all changes are intentional

# 7. Commit message
git commit -m "Type: Description - Specific changes made"
# Types: Add, Update, Fix, Remove, Refactor
```

### Module Quality Standards

Each module should have:

- ✅ **Learning Outcomes** — Clear, measurable, exam-aligned
- ✅ **Concepts** — Explained without jargon
- ✅ **Examples** — 3-5 real-world examples
- ✅ **Exercises** — 🌱 Básico, ⚡ Intermedio, 🔥 Avanzado
- ✅ **Mock Questions** — Real certification-style questions
- ✅ **Pitfalls** — Common mistakes explained
- ✅ **Project** — Hands-on deliverable

### Validation Script

```bash
# Run validation on all modules
python scripts/validate-modules.py

# Output example:
# ✅ 01-python: All 48 modules valid
# ✅ 02-java: All 48 modules valid
# ❌ 20-bi-tools: Module 5 missing exercises section
# 
# Summary: 1,056/1,056 modules valid (99.9%)
```

---

## 🚀 DEPLOYMENT

### GitHub Pages (Automatic)

```bash
# Push to main branch
git push origin main

# GitHub Actions automatically:
# 1. Runs quarto render
# 2. Publishes to docs/ folder
# 3. Updates GitHub Pages site

# Site updates in ~2-3 minutes
# Visit: https://lcarrenoy.github.io/PlanetSTEAM/
```

### Manual Deployment

```bash
# If automatic deployment fails:

# 1. Render locally
quarto render

# 2. Verify docs/ folder updated
ls -la docs/ | head -20

# 3. Commit and push
git add docs/
git commit -m "Deploy: Rebuild all courses"
git push origin main

# 4. Verify in browser (wait 2-3 min for GitHub Pages cache)
open https://lcarrenoy.github.io/PlanetSTEAM/
```

### Staging Environment

```bash
# Test changes before merging to main

# Create branch
git checkout -b feature/new-course-updates

# Make changes
nano 02-courses/01-python/01-junior/01-module.qmd
quarto render

# Commit to branch
git add .
git commit -m "Add: New exercises to Python Junior Module 1"
git push origin feature/new-course-updates

# Create Pull Request on GitHub
# Reviewers test staging environment
# Once approved, merge to main
```

---

## 🔧 TROUBLESHOOTING

### Issue: Build fails with missing dependency

```bash
# Error: "Package 'X' not found"

# Solution:
pip install quarto
quarto install

# Or for Quarto modules:
quarto add quarto-ext/lightbox
```

### Issue: Module renders but no output

```bash
# Error: "No output directory"

# Solution:
# Check _quarto.yml has correct output-dir

# Example:
project:
  type: website
  output-dir: ../../docs/02-courses/01-python
```

### Issue: Links broken in HTML

```bash
# Error: "404 - links not found"

# Solution:
# Use relative paths in markdown:
# WRONG: [Link](/course/module)
# RIGHT: [Link](../../../index.html)

# Or use Quarto reference syntax:
# [Link to module]{href="01-module.html"}
```

### Issue: Code examples not syntax-highlighted

```bash
# Error: "Code blocks show plain text"

# Solution:
# Check Quarto format includes highlight-style

format:
  html:
    highlight-style: github  # Or: atom-one, github-dark, etc.
```

### Issue: Dashboard not embedding

```bash
# Error: "Iframe blank or loading forever"

# Solution:
# 1. Verify Tableau/Power BI dashboard is published (not draft)
# 2. Check URL is correct and public
# 3. Try in incognito window (no auth issues)
# 4. See BI_TOOLS_EMBEDDING_GUIDE.md for detailed steps
```

### Issue: Git push rejected

```bash
# Error: "Updates were rejected"

# Solution:
git pull origin main  # Get latest changes
git merge              # Resolve conflicts if any
git push origin main
```

---

## 📧 COMMUNICATION

### Using Team Email

All course-related communications:
- **Email:** planetsteamweb@gmail.com
- **Use for:** Course updates, deployment notifications, Q&A

### Git Commit Message Format

```
Type: Scope — Description

Example:
Update: Python Modules 1-5 — Fixed code examples and added new exercises

Types:
- Add: New course, module, or content
- Update: Modify existing content
- Fix: Bug fixes or corrections
- Remove: Delete deprecated content
- Refactor: Restructure without changing functionality
- Deploy: Release to production
```

### Documentation

Update these files when making significant changes:

- `COURSES_INDEX.md` — Overall course info
- `COURSE_GENERATION_PROMPT.md` — If changing structure
- `BI_TOOLS_EMBEDDING_GUIDE.md` — If adding dashboards
- `MAINTENANCE_GUIDE.md` — This file (update instructions)

---

## 📊 METRICS & MONITORING

### Course Health

```bash
# Check all modules render successfully
python scripts/health-check.py

# Output:
# Python:  ✅ 48/48 modules (100%)
# Java:    ✅ 48/48 modules (100%)
# ...
# Total:   ✅ 1,056/1,056 modules (100%)
```

### Build Performance

```bash
# Measure build time
time quarto render

# Expected:
# Total time: ~5-10 minutes for all 1,056 modules
# If >15 min: check for large images or slow internet
```

### File Size

```bash
# Check total size of built site
du -sh docs/

# Expected:
# ~500MB-1GB for all HTML + assets
# If >2GB: optimize images or remove old versions
```

---

## ✨ BEST PRACTICES

1. **Commit Frequently** — Small, focused commits
2. **Write Clear Messages** — Describe what and why
3. **Test Before Push** — `quarto render` before committing
4. **Keep Modules Consistent** — Follow module template
5. **Document Changes** — Update markdown headers
6. **Review Others' PRs** — Maintain code quality
7. **Backup Regularly** — Local `git` is not backup
8. **Use Branches** — Never work directly on `main`

---

## 🔐 Security

### Protecting Content

- ✅ GitHub repo is **PRIVATE**
- ✅ Only team members have access
- ✅ Never commit .env files or credentials
- ✅ Use environment variables for sensitive data

### Credential Safety

```bash
# Create .env file (NOT in git)
echo "PLANETSTEAM_EMAIL=planetsteamweb@gmail.com" > .env

# Add to .gitignore
echo ".env" >> .gitignore

# Load in scripts (don't commit)
source .env
```

---

## 📈 Version Control

### Current Version

```
Planet STEAM Courses — v1.0
- 22 Courses
- 1,056 Modules
- 4 Levels (Junior, Mid, Senior, Lead)
- Updated: August 15, 2026
```

### Release Notes

```markdown
# v1.0 — Initial Release (Aug 15, 2026)
- ✅ All 22 core courses complete
- ✅ 1,056 modules with full content
- ✅ Quarto-based GitHub Pages deployment
- ✅ Responsive design, mobile-friendly
- ✅ BI Tools placeholders ready

# Future (v1.1)
- 🔲 AI-generated code examples
- 🔲 Interactive quizzes
- 🔲 User progress tracking
- 🔲 Certificate generation
```

---

## 🎯 Next Steps

1. ✅ **Read** `COURSE_GENERATION_PROMPT.md` for content standards
2. ✅ **Review** `COURSES_INDEX.md` for structure overview
3. ✅ **Use** `BI_TOOLS_EMBEDDING_GUIDE.md` for dashboards
4. ✅ **Follow** this guide for updates and maintenance

---

**Document Version:** 1.0  
**Last Updated:** August 15, 2026  
**Maintainer:** Luis Alberto Carreño (planetsteamweb@gmail.com)

---

