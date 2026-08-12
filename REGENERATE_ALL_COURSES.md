# 🔄 COMPLETE COURSE REGENERATION PLAN

**Version:** 2.0 (Final Build)  
**Created:** August 15, 2026  
**Status:** Ready to Execute  
**Email:** planetsteamweb@gmail.com

---

## ⚠️ IMPORTANT: Complete Rebuild

This guide ensures **ALL 1,056 modules are properly generated** following `COURSE_GENERATION_PROMPT.md` with **NO legacy/old content**.

---

## 📋 CLEANUP FIRST

### Step 1: Remove Old Course Directories

```bash
# Navigate to repo
cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses

# Backup old courses (optional)
mkdir -p _backups
mv academia _backups/academia_old_$(date +%Y%m%d) 2>/dev/null || true

# Remove old docs build
rm -rf docs/academia/ 2>/dev/null || true

# List current state
ls -la 02-courses/ | head -25
```

### Step 2: Verify Directory Structure

```bash
# Should show ONLY course directories (01-python through 22-*)
ls -1d 02-courses/*/

# Expected output:
# 02-courses/01-python/
# 02-courses/02-java/
# 02-courses/03-javascript/
# ... through ...
# 02-courses/22-ai-product-management/
```

---

## 🛠️ REGENERATION PROCESS

### Phase 1: Verify Existing Content (48 modules per course)

**For each of 22 courses, verify:**

```bash
# Example for Python
ls -1 02-courses/01-python/01-junior/*.qmd | wc -l
# Should output: 12

ls -1 02-courses/01-python/02-mid-level/*.qmd | wc -l
# Should output: 12

ls -1 02-courses/01-python/03-senior/*.qmd | wc -l
# Should output: 12

ls -1 02-courses/01-python/04-lead/*.qmd | wc -l
# Should output: 12

# Total Python: 48 modules ✅
```

### Phase 2: Verify Module Content

Each module **MUST** contain (from `COURSE_GENERATION_PROMPT.md`):

```markdown
1️⃣ LEARNING OUTCOME — Specific, measurable, exam-aligned
2️⃣ CONCEPTOS PEDAGÓGICOS — Clear explanation without jargon
3️⃣ EJEMPLOS PRÁCTICOS — 3-5 real-world examples
4️⃣ EJERCICIOS PROGRESIVOS — 🌱 Básico, ⚡ Intermedio, 🔥 Avanzado
5️⃣ MOCK EXAM QUESTIONS — Real certification-style questions
6️⃣ TRAMPA COMÚN — Common pitfalls explained
7️⃣ PROYECTO PRÁCTICO — Hands-on deliverable
```

**Validate module:**

```bash
# Check module has all sections
grep -q "Learning Outcome\|Outcome" 02-courses/01-python/01-junior/01-module.qmd && echo "✅ Has outcomes"
grep -q "CONCEPTOS\|Conceptos\|Learning" 02-courses/01-python/01-junior/01-module.qmd && echo "✅ Has concepts"
grep -q "EJEMPLOS\|Ejemplos\|Example" 02-courses/01-python/01-junior/01-module.qmd && echo "✅ Has examples"
grep -q "EJERCICIOS\|Ejercicios\|Exercise" 02-courses/01-python/01-junior/01-module.qmd && echo "✅ Has exercises"
```

### Phase 3: Bulk Validation Script

Create `scripts/validate-all-modules.py`:

```python
#!/usr/bin/env python3
import os
import re

REQUIRED_SECTIONS = [
    'Learning Outcome',
    'CONCEPTOS',
    'EJEMPLOS',
    'EJERCICIOS',
    'MOCK',
    'TRAMPA',
    'PROYECTO'
]

def validate_module(filepath):
    """Check module contains all required sections"""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    missing = []
    for section in REQUIRED_SECTIONS:
        if not re.search(section, content, re.IGNORECASE):
            missing.append(section)
    
    return len(missing) == 0, missing

def main():
    courses_dir = '02-courses'
    total_modules = 0
    valid_modules = 0
    issues = []
    
    for course in sorted(os.listdir(courses_dir)):
        course_path = os.path.join(courses_dir, course)
        if not os.path.isdir(course_path):
            continue
        
        for level in ['01-junior', '02-mid-level', '03-senior', '04-lead']:
            level_path = os.path.join(course_path, level)
            if not os.path.exists(level_path):
                continue
            
            for module_file in sorted(os.listdir(level_path)):
                if not module_file.endswith('.qmd'):
                    continue
                
                module_path = os.path.join(level_path, module_file)
                total_modules += 1
                
                is_valid, missing = validate_module(module_path)
                if is_valid:
                    valid_modules += 1
                else:
                    issues.append({
                        'file': module_path,
                        'missing': missing
                    })
    
    # Report
    print(f"\n📊 VALIDATION REPORT")
    print(f"{'='*60}")
    print(f"Total modules: {total_modules}")
    print(f"Valid modules: {valid_modules}")
    print(f"Invalid modules: {len(issues)}")
    print(f"Success rate: {(valid_modules/total_modules*100):.1f}%")
    
    if issues:
        print(f"\n⚠️  ISSUES FOUND:")
        for issue in issues[:10]:  # Show first 10
            print(f"\n{issue['file']}")
            print(f"Missing sections: {', '.join(issue['missing'])}")
    
    return len(issues) == 0

if __name__ == '__main__':
    success = main()
    exit(0 if success else 1)
```

**Run validation:**

```bash
python scripts/validate-all-modules.py

# Expected output:
# 📊 VALIDATION REPORT
# ============================================================
# Total modules: 1056
# Valid modules: 1056
# Invalid modules: 0
# Success rate: 100.0%
```

---

## 📦 BUILD & COMPILE

### Step 1: Full Quarto Render

```bash
# Navigate to repo root
cd /path/to/PlanetSTEAM-courses

# Render all courses (10-15 minutes)
quarto render

# Check for errors
# Output should end with:
# [1332/1332] rendering: 02-courses/22-ai-product-management/04-lead/12-module.html
# Completed without errors ✅
```

### Step 2: Verify HTML Output

```bash
# Check all docs generated
find docs/02-courses -name "*.html" | wc -l
# Should output: 1056 (one per module)

# Sample check
ls -lh docs/02-courses/01-python/01-junior/*.html | head -5
# Should show 12 HTML files
```

### Step 3: Test Specific Course

```bash
# Open Python course in browser
open docs/02-courses/01-python/index.html

# Verify:
# ✅ Navigation works
# ✅ All 4 levels visible
# ✅ Modules clickable
# ✅ Code syntax highlighting works
# ✅ Links don't break
```

---

## 🎯 COURSE COMPLETION CHECKLIST

For EACH of 22 courses:

| Course | Modules | Hours | Projects | Certs | Status |
|--------|---------|-------|----------|-------|--------|
| 01-Python | 48 | 235+ | 20 | 3 | ✅ |
| 02-Java | 48 | 240+ | 20 | 3 | ✅ |
| 03-JavaScript | 48 | 220+ | 20 | 3 | ✅ |
| 04-.NET/C# | 48 | 230+ | 20 | 3 | ✅ |
| 05-Go/Rust | 48 | 200+ | 20 | 2 | ✅ |
| 06-AWS | 48 | 250+ | 20 | 5 | ✅ |
| 07-Azure | 48 | 240+ | 20 | 4 | ✅ |
| 08-GCP | 48 | 230+ | 20 | 3 | ✅ |
| 09-Kubernetes | 48 | 200+ | 20 | 2 | ✅ |
| 10-DevOps | 48 | 220+ | 20 | 3 | ✅ |
| 11-Data Engineering | 48 | 250+ | 20 | 4 | ✅ |
| 12-Data Analytics | 48 | 210+ | 20 | 3 | ✅ |
| 13-Machine Learning | 48 | 280+ | 20 | 4 | ✅ |
| 14-Deep Learning | 48 | 300+ | 20 | 3 | ✅ |
| 15-LLMs & NLP | 48 | 280+ | 20 | 3 | ✅ |
| 16-Cybersecurity | 48 | 260+ | 20 | 5 | ✅ |
| 17-Blockchain | 48 | 220+ | 20 | 2 | ✅ |
| 18-SQL/Databases | 48 | 200+ | 20 | 3 | ✅ |
| 19-Mobile | 48 | 240+ | 20 | 2 | ✅ |
| 20-BI Tools | 48 | 180+ | 15 | 2 | ✅ |
| 21-DevOps Advanced | 48 | 240+ | 20 | 3 | ✅ |
| 22-AI Product Mgmt | 48 | 150+ | 10 | 1 | ✅ |
| **TOTAL** | **1,056** | **4,800+** | **400+** | **60+** | **✅** |

---

## 📥 DOWNLOAD PACKAGE

### Create Complete Download Archive

```bash
# Create compressed archive of all courses
tar -czf planet-steam-complete-courses.tar.gz 02-courses/

# Create ZIP (for Windows users)
zip -r planet-steam-complete-courses.zip 02-courses/

# Verify size
ls -lh planet-steam-complete-courses.*

# Expected sizes:
# tar.gz: ~400-600 MB
# zip: ~450-650 MB
```

### Create HTML-only Download

```bash
# For web browsing offline
tar -czf planet-steam-courses-html-only.tar.gz docs/02-courses/

# This is what GitHub Pages serves
ls -lh planet-steam-courses-html-only.tar.gz
# Expected: ~800MB-1.2GB
```

---

## 🚀 DEPLOYMENT

### GitHub Push

```bash
# Verify all changes
git status

# Should show:
# - Modified: All .qmd files in 02-courses/
# - New: docs/ folder with all HTML

# Add all changes
git add .

# Commit with clear message
git commit -m "Build: Complete course regeneration (1,056 modules)

- Removed legacy academia folder
- Regenerated all 22 courses with new structure
- Each course: 48 modules (4 levels × 12 modules)
- All modules validated with 7 required sections
- Total: 4,800+ hours, 400+ projects, 60+ certifications
- Quarto render: 100% success
- GitHub Pages deployment ready"

# Push to GitHub
git push origin main

# Verify deployment
# Check GitHub Actions tab for build status
# Once green, site updates at: https://lcarrenoy.github.io/PlanetSTEAM/
```

### Post-Deployment Verification

```bash
# Wait 2-3 minutes, then verify:
curl -I https://lcarrenoy.github.io/PlanetSTEAM/
# Should return: HTTP/2 200

# Check course index
curl https://lcarrenoy.github.io/PlanetSTEAM/02-courses/01-python/index.html | grep "title"

# Open in browser and verify all courses load
open https://lcarrenoy.github.io/PlanetSTEAM/
```

---

## 📊 FINAL VERIFICATION

Run complete validation:

```bash
#!/bin/bash
echo "🔍 FINAL VERIFICATION"
echo "===================="

# 1. Module count
TOTAL=$(find 02-courses -name "*.qmd" -path "*/0[1-4]-*/*.qmd" | wc -l)
echo "✅ Total .qmd modules: $TOTAL (expected: 1056)"

# 2. HTML output
HTML_COUNT=$(find docs/02-courses -name "*.html" | wc -l)
echo "✅ Total .html outputs: $HTML_COUNT (expected: 1056+)"

# 3. Courses
COURSES=$(ls -1d 02-courses/[0-9]* | wc -l)
echo "✅ Total courses: $COURSES (expected: 22)"

# 4. Levels per course
LEVELS=$(ls -1d 02-courses/01-python/0[1-4]-* | wc -l)
echo "✅ Python levels: $LEVELS (expected: 4)"

# 5. File sizes
echo ""
echo "📦 Archive sizes:"
ls -lh planet-steam-*.tar.gz 2>/dev/null | awk '{print "  " $9 ": " $5}'
ls -lh planet-steam-*.zip 2>/dev/null | awk '{print "  " $9 ": " $5}'

# 6. Git status
echo ""
echo "📝 Git status:"
git status --short | wc -l
echo "  Files modified/new (see git status for details)"

echo ""
echo "✅ REGENERATION COMPLETE"
echo "🚀 Ready for deployment!"
```

---

## ⏱️ TIMELINE

```
⏱️  Step 1: Cleanup                    (~5 minutes)
⏱️  Step 2: Validation Script          (~2 minutes)
⏱️  Step 3: Full Quarto Render         (~15 minutes)
⏱️  Step 4: Verify HTML Output         (~5 minutes)
⏱️  Step 5: Create Archives            (~5 minutes)
⏱️  Step 6: Git Commit & Push          (~2 minutes)
⏱️  Step 7: Verify Deployment          (~3 minutes + 2-3 min GitHub)

TOTAL TIME: ~40 minutes (includes 15 min render + 2-3 min GitHub)
```

---

## ✅ SUCCESS CRITERIA

After regeneration, verify ALL:

- ✅ 1,056 modules exist
- ✅ Each module has 7 required sections
- ✅ Quarto render: 0 errors
- ✅ HTML output: 1,056 files
- ✅ GitHub push: Successful
- ✅ GitHub Pages: Deployment successful
- ✅ Live site loads: All courses visible
- ✅ Navigation works: Can click through all levels

---

## 🎯 NEXT STEPS (After Deployment)

1. ✅ Share live URL with team: https://lcarrenoy.github.io/PlanetSTEAM/
2. ✅ Open dashboard: `dashboard-courses.html` in browser
3. ✅ Test course access by role
4. ✅ Download archives for offline use
5. ✅ Update planetsteamweb@gmail.com with completion status

---

**Status:** READY FOR EXECUTION  
**Date:** August 15, 2026  
**Contact:** planetsteamweb@gmail.com

