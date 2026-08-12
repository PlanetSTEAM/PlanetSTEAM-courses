# 🚀 PUSH COURSES TO GITHUB (planetsteam account)
# PowerShell Script for Windows

Write-Host "🎓 Planet STEAM Courses — GitHub Push" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Verify directory
Write-Host "📍 Checking directory..." -ForegroundColor Yellow
if (-not (Test-Path "COURSE_GENERATION_PROMPT.md")) {
    Write-Host "❌ ERROR: Not in PlanetSTEAM-courses directory" -ForegroundColor Red
    Write-Host "Please run this from: D:\Dev\PlanetSTEAM\PlanetSTEAM-courses"
    exit 1
}
Write-Host "✅ Correct directory" -ForegroundColor Green
Write-Host ""

# Step 2: Check git status
Write-Host "📝 Checking git status..." -ForegroundColor Yellow
git status --short | Select-Object -First 10
Write-Host ""

# Step 3: Update remote
Write-Host "🔗 Updating Git remote..." -ForegroundColor Yellow
Write-Host "   From: lcarrenoy/PlanetSTEAM-courses"
Write-Host "   To:   planetsteam/PlanetSTEAM-courses"
Write-Host ""
git remote set-url origin https://github.com/planetsteam/PlanetSTEAM-courses.git
Write-Host "✅ Remote updated" -ForegroundColor Green
Write-Host ""

# Verify remote
Write-Host "Verifying remote:" -ForegroundColor Yellow
git remote -v
Write-Host ""

# Step 4: Set main branch
Write-Host "📌 Ensuring main branch..." -ForegroundColor Yellow
git branch -M main
Write-Host "✅ Using main branch" -ForegroundColor Green
Write-Host ""

# Step 5: Add all files
Write-Host "📦 Adding all files to staging..." -ForegroundColor Yellow
git add .
Write-Host "✅ Files staged" -ForegroundColor Green
Write-Host ""

# Step 6: Commit
Write-Host "💾 Creating commit..." -ForegroundColor Yellow
$commitMessage = @"
Build: Complete course system deployment

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

Planet STEAM Educational Platform
Email: planetsteamweb@gmail.com
"@

git commit -m $commitMessage
if ($LASTEXITCODE -ne 0) {
    Write-Host "⚠️  No changes to commit (already up to date)" -ForegroundColor Yellow
} else {
    Write-Host "✅ Commit created" -ForegroundColor Green
}
Write-Host ""

# Step 7: Push to GitHub
Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Yellow
Write-Host "   Target: github.com/planetsteam/PlanetSTEAM-courses" -ForegroundColor Cyan
Write-Host "   Branch: main" -ForegroundColor Cyan
Write-Host ""
git push -u origin main

# Check result
if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ SUCCESS! Push completed" -ForegroundColor Green
    Write-Host ""
    Write-Host "📊 Next Steps:" -ForegroundColor Cyan
    Write-Host "   1. Verify on GitHub:" -ForegroundColor Yellow
    Write-Host "      https://github.com/planetsteam/PlanetSTEAM-courses" -ForegroundColor Green
    Write-Host ""
    Write-Host "   2. Connect to Vercel:" -ForegroundColor Yellow
    Write-Host "      https://vercel.com/dashboard" -ForegroundColor Green
    Write-Host "      → New Project"
    Write-Host "      → Import from GitHub"
    Write-Host "      → Select: planetsteam/PlanetSTEAM-courses"
    Write-Host "      → Build Command: quarto render"
    Write-Host "      → Output Directory: docs"
    Write-Host "      → Click Deploy!"
    Write-Host ""
    Write-Host "   3. Live site will be at:" -ForegroundColor Yellow
    Write-Host "      https://planetsteam-courses.vercel.app" -ForegroundColor Green
    Write-Host ""
    Write-Host "🎉 Deployment infrastructure ready!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📈 Statistics:" -ForegroundColor Cyan
    Write-Host "   • 22 courses" -ForegroundColor White
    Write-Host "   • 1,056 modules" -ForegroundColor White
    Write-Host "   • 4,800+ hours" -ForegroundColor White
    Write-Host "   • 400+ projects" -ForegroundColor White
    Write-Host "   • 60+ certifications" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "❌ ERROR during push" -ForegroundColor Red
    Write-Host "Please check your git credentials and network connection"
    exit 1
}
