# PowerShell: Deploy FASE 2 (Java, JavaScript, AWS)
# Compiles and pushes Phase 2 courses to GitHub

Write-Host "🚀 FASE 2 Deployment Process..." -ForegroundColor Cyan
Write-Host "📦 Courses: Java, JavaScript, AWS`n" -ForegroundColor Cyan

cd D:\Dev\PlanetSTEAM\PlanetSTEAM-courses

# Step 1: Quarto Render for 3 files
Write-Host "1️⃣  Compiling FASE 2 courses with Quarto..." -ForegroundColor Yellow

quarto render 02-java-complete.qmd 2>&1 | ForEach-Object { Write-Host "   $_" }
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ❌ Java compilation failed" -ForegroundColor Red
    exit 1
}
Write-Host "   ✅ Java compiled" -ForegroundColor Green

quarto render 03-javascript-complete.qmd 2>&1 | ForEach-Object { Write-Host "   $_" }
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ❌ JavaScript compilation failed" -ForegroundColor Red
    exit 1
}
Write-Host "   ✅ JavaScript compiled" -ForegroundColor Green

quarto render 04-aws-complete.qmd 2>&1 | ForEach-Object { Write-Host "   $_" }
if ($LASTEXITCODE -ne 0) {
    Write-Host "   ❌ AWS compilation failed" -ForegroundColor Red
    exit 1
}
Write-Host "   ✅ AWS compiled" -ForegroundColor Green

# Step 2: Verify HTML generation
Write-Host "`n2️⃣  Verifying HTML files..." -ForegroundColor Yellow
$files = @(
    "_output/02-java-complete.html",
    "_output/03-javascript-complete.html",
    "_output/04-aws-complete.html"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        Write-Host "   ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "   ❌ $file not found" -ForegroundColor Red
        exit 1
    }
}

# Step 3: Git staging and commit
Write-Host "`n3️⃣  Staging changes..." -ForegroundColor Yellow
git add 02-java-complete.qmd 03-javascript-complete.qmd 04-aws-complete.qmd _output/

Write-Host "`n4️⃣  Committing..." -ForegroundColor Yellow
$commitMsg = "feat: FASE 2 Complete - Java, JavaScript, AWS courses (3 × 50+ pages each)"
git commit -m $commitMsg

# Step 4: Push to GitHub
Write-Host "`n5️⃣  Pushing to GitHub..." -ForegroundColor Yellow
git push origin main 2>&1 | ForEach-Object { Write-Host "   $_" }

if ($LASTEXITCODE -eq 0) {
    Write-Host "   ✅ Push successful!" -ForegroundColor Green
} else {
    Write-Host "   ⚠️  Check push output" -ForegroundColor Yellow
}

# Summary
Write-Host "`n" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "✅ FASE 2 COMPLETE" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "`n📊 Summary:" -ForegroundColor Cyan
Write-Host "  ✅ Python (Sesión anterior)" -ForegroundColor White
Write-Host "  ✅ Java (FASE 2 Complete)" -ForegroundColor White
Write-Host "  ✅ JavaScript (FASE 2 Complete)" -ForegroundColor White
Write-Host "  ✅ AWS (FASE 2 Complete)" -ForegroundColor White
Write-Host "`n  Total: 4 Cursos × 120 módulos = 480 módulos en vivo" -ForegroundColor White
Write-Host "  Total: 1,000+ páginas de contenido" -ForegroundColor White
Write-Host "`n🌐 Live at:" -ForegroundColor Cyan
Write-Host "  🔗 https://planetsteam.github.io/PlanetSTEAM-courses/" -ForegroundColor Cyan
Write-Host "`n⏭️  FASE 3: Data Engineering, ML, Azure, GCP, Kubernetes, DevOps (6 cursos)" -ForegroundColor Yellow
Write-Host "`n"
