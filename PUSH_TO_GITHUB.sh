#!/bin/bash

# 🚀 PUSH COURSES TO GITHUB (planetsteam account)
# Script to update remote and push all files to planetsteam/PlanetSTEAM-courses

echo "🎓 Planet STEAM Courses — GitHub Push"
echo "======================================"
echo ""

# Step 1: Verify we're in correct directory
echo "📍 Checking directory..."
if [ ! -f "COURSE_GENERATION_PROMPT.md" ]; then
    echo "❌ ERROR: Not in PlanetSTEAM-courses directory"
    echo "Please run this from: D:\Dev\PlanetSTEAM\PlanetSTEAM-courses"
    exit 1
fi
echo "✅ Correct directory"
echo ""

# Step 2: Check git status
echo "📝 Checking git status..."
git status --short | head -10
echo ""

# Step 3: Update remote
echo "🔗 Updating Git remote..."
echo "   From: lcarrenoy/PlanetSTEAM-courses"
echo "   To:   planetsteam/PlanetSTEAM-courses"
echo ""
git remote set-url origin https://github.com/planetsteam/PlanetSTEAM-courses.git
echo "✅ Remote updated"
echo ""

# Verify remote
echo "Verifying remote:"
git remote -v
echo ""

# Step 4: Set main branch
echo "📌 Ensuring main branch..."
git branch -M main
echo "✅ Using main branch"
echo ""

# Step 5: Add all files
echo "📦 Adding all files..."
git add .
echo "✅ Files staged"
echo ""

# Step 6: Commit
echo "💾 Creating commit..."
git commit -m "Build: Complete course system deployment

- 22 professional bootcamp courses
- 1,056 total modules (48 per course)
- 4 progression levels (Junior/Mid/Senior/Lead)
- 4,800+ hours of content
- 400+ portfolio projects
- 60+ certification preparations
- 3,080+ interview Q&A
- Full Quarto + GitHub Pages + Vercel setup
- All documentation and guides included
- Dashboard with filtering by category/role
- BI Tools (Tableau/Power BI) ready
- Auto-deployment infrastructure configured

Ready for immediate deployment to Vercel.

Co-authored-by: Luis Alberto Carreño <lcarrenoy@uni.pe>
Email: planetsteamweb@gmail.com" || true

echo ""

# Step 7: Push to GitHub
echo "🚀 Pushing to GitHub..."
echo "   Target: github.com/planetsteam/PlanetSTEAM-courses"
echo "   Branch: main"
echo ""
git push -u origin main

# Check result
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCCESS! Push completed"
    echo ""
    echo "📊 Next Steps:"
    echo "   1. Verify on GitHub:"
    echo "      https://github.com/planetsteam/PlanetSTEAM-courses"
    echo ""
    echo "   2. Connect to Vercel:"
    echo "      https://vercel.com/dashboard"
    echo "      → New Project"
    echo "      → Import from GitHub"
    echo "      → Select: planetsteam/PlanetSTEAM-courses"
    echo "      → Build: quarto render"
    echo "      → Output: docs"
    echo "      → Deploy!"
    echo ""
    echo "   3. Live site will be at:"
    echo "      https://planetsteam-courses.vercel.app"
    echo ""
    echo "🎉 Deployment infrastructure ready!"
else
    echo ""
    echo "❌ ERROR during push"
    echo "Please check your git credentials and network connection"
    exit 1
fi
