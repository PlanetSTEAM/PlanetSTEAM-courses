# 📊 BI Tools Embedding Guide — Tableau & Power BI

**Document Version:** 1.0  
**Created:** August 15, 2026  
**Status:** Template Ready for Configuration

---

## 🎯 Overview

This guide explains how to embed **Tableau** and **Power BI** dashboards into Planet STEAM course modules without breaking the Quarto build process.

---

## 📋 PLACEHOLDER STRUCTURE

### 1️⃣ For Modules with Tableau

In any `.qmd` module file where you need a Tableau dashboard:

```qmd
## 📊 Interactive Dashboard (Tableau)

<!-- TABLEAU PLACEHOLDER - REPLACE WITH YOUR DASHBOARD URL -->
:::  {.callout-note}
**📊 Interactive Tableau Dashboard**

This section will display an interactive Tableau visualization showing real-time data analysis.

**To embed your Tableau dashboard:**
1. Copy your Tableau Public dashboard URL
2. Replace the URL below in the HTML template
3. Rebuild with `quarto render`

Example dashboard URL: 
```
https://public.tableau.com/views/PlanetSTEAM-DataAnalytics/Dashboard1?:language=es-ES&:display_count=n&:origin=viz_share_link
```
:::

### HTML Template (uncomment and modify):

```html
<!-- <div style="width: 100%; height: 600px;">
<iframe 
  src="[YOUR_TABLEAU_URL]&:embed=yes&:showVizHome=no" 
  width="100%" 
  height="600"
  style="border: none; border-radius: 12px;">
</iframe>
</div> -->
```
```

---

### 2️⃣ For Modules with Power BI

In any `.qmd` module where you need a Power BI report:

```qmd
## 📈 Live Report Analysis (Power BI)

<!-- POWER BI PLACEHOLDER - REPLACE WITH YOUR EMBED URL -->
:::  {.callout-note}
**📈 Power BI Embedded Report**

This section will display an embedded Power BI report with interactive filters and drill-down capabilities.

**To embed your Power BI report:**
1. Publish your Power BI report to the cloud
2. Get your Embed URL from Power BI Service
3. Replace the URL below in the HTML template
4. Rebuild with `quarto render`

Example service URL: 
```
https://app.powerbi.com/reportEmbed?reportId=[YOUR_REPORT_ID]&groupId=[YOUR_GROUP_ID]
```
:::

### HTML Template (uncomment and modify):

```html
<!-- <div style="width: 100%; height: 700px;">
<iframe 
  src="[YOUR_POWER_BI_EMBED_URL]" 
  width="100%" 
  height="700"
  style="border: none; border-radius: 12px;">
</iframe>
</div> -->
```
```

---

## 🔄 Courses with BI Tools Content

### Course: BI Tools (Tableau/Power BI)
**Location:** `02-courses/20-bi-tools/`

Modules that should include BI visualizations:

| Module | Level | Content | Tool | Status |
|--------|-------|---------|------|--------|
| 1-5 | Junior | Tableau Basics, Dashboard Design | Tableau | 🔲 Pending |
| 6-8 | Junior | Power BI Basics, Report Building | Power BI | 🔲 Pending |
| 9-10 | Junior | Data Visualization Best Practices | Both | 🔲 Pending |
| 11-12 | Junior | Capstone Project Dashboard | Both | 🔲 Pending |
| 1-5 | Mid-Level | Advanced Tableau Techniques | Tableau | 🔲 Pending |
| 6-8 | Mid-Level | Power BI Advanced Analytics | Power BI | 🔲 Pending |
| 9-10 | Mid-Level | Real-time Dashboards | Both | 🔲 Pending |
| 11-12 | Mid-Level | Enterprise Implementation | Both | 🔲 Pending |
| Senior & Lead | - | Specialized topics | Both | 🔲 Pending |

---

## 📊 Other Courses Using BI Tools

The following courses may include BI visualizations in certain modules:

- **Data Analytics** → Final projects with dashboards
- **Machine Learning** → Model performance dashboards
- **Data Engineering** → Data pipeline monitoring
- **Cloud Courses** → Cloud metrics & monitoring dashboards
- **DevOps** → System performance dashboards

---

## 🛠️ STEP-BY-STEP EMBEDDING

### For Tableau

**Step 1: Create Dashboard in Tableau Desktop**
```
1. Build your dashboard in Tableau Desktop
2. Save as .twbx file locally
```

**Step 2: Publish to Tableau Public**
```
1. Go to Server → Publish Workbook
2. Sign up for free Tableau Public account
3. Publish dashboard (makes it public)
```

**Step 3: Get Embed URL**
```
1. View published dashboard at public.tableau.com
2. Click Share → Copy Link to Dashboard
3. Extract base URL: https://public.tableau.com/views/[YOUR_DASHBOARD]/Dashboard1
```

**Step 4: Update Module**
```qmd
<div style="width: 100%; height: 600px;">
<iframe 
  src="https://public.tableau.com/views/[YOUR_DASHBOARD]/Dashboard1?:embed=yes&:showVizHome=no" 
  width="100%" 
  height="600"
  style="border: none; border-radius: 12px;">
</iframe>
</div>
```

**Step 5: Test**
```bash
quarto render path/to/module.qmd
# Check output HTML - should display dashboard
```

---

### For Power BI

**Step 1: Create Report in Power BI Desktop**
```
1. Build your report in Power BI Desktop
2. Connect to live data or upload CSV
3. Create visualizations & filters
```

**Step 2: Publish to Power BI Service**
```
1. File → Publish
2. Select workspace (My Workspace is fine)
3. Choose dataset storage (import or live)
```

**Step 3: Get Embed URL**
```
1. Open report in Power BI Service
2. Share → Generate Embed Code
3. Copy iframe src URL
4. Extract: https://app.powerbi.com/reportEmbed?...
```

**Step 4: Update Module**
```qmd
<div style="width: 100%; height: 700px;">
<iframe 
  src="https://app.powerbi.com/reportEmbed?reportId=[ID]&groupId=[ID]" 
  width="100%" 
  height="700"
  style="border: none; border-radius: 12px; allow-full-screen;">
</iframe>
</div>
```

**Step 5: Test**
```bash
quarto render path/to/module.qmd
# Check output HTML - should display report
```

---

## ⚠️ Common Issues

### Issue: Iframe not displaying
**Solution:**
- Check URL is correct
- Verify dashboard/report is published (not draft)
- Check if requires authentication
- Try in incognito/private window

### Issue: Quarto build fails
**Solution:**
- Ensure `<iframe>` tag is inside proper Quarto code block
- Use inline HTML if inside markdown section
- Wrap in `:::` callout if needed

### Issue: Authentication required
**Solution:**
- Use Tableau Public (free, no auth needed)
- For Power BI, generate public embed link
- Add `&embed=yes&:showVizHome=no` for Tableau

### Issue: Mobile responsiveness
**Solution:**
```html
<div style="width: 100%; max-width: 900px; margin: 0 auto;">
<iframe 
  src="[YOUR_URL]" 
  width="100%" 
  height="600"
  style="border: none; border-radius: 12px;">
</iframe>
</div>
```

---

## 🎨 Styling Best Practices

### Consistent Styling
```html
<div class="bi-container">
  <iframe 
    src="[YOUR_URL]"
    title="Dashboard"
    style="
      width: 100%;
      height: 600px;
      border: none;
      border-radius: 16px;
      box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
      transition: box-shadow 0.3s ease;
    "
  ></iframe>
</div>
```

### Add to CSS
```css
.bi-container {
  margin: 20px 0;
  padding: 20px;
  background: #f7f8fc;
  border-radius: 16px;
  border-left: 4px solid #F5A623;
}

.bi-container:hover {
  box-shadow: 0 8px 48px rgba(245, 166, 35, 0.3);
}
```

---

## 📝 Module Template

Use this template for any module with BI visualizations:

```qmd
---
title: "Module X: [Title]"
subtitle: "Including Interactive Dashboards"
author: "Planet STEAM"
date: "2026-08-15"
format: html
---

## Learning Outcomes

- ✅ Outcome 1
- ✅ Outcome 2
- ✅ Outcome 3

## Conceptual Foundation

[Explanation text...]

## Practical Examples

[Code examples...]

## 📊 Live Dashboard Example

:::  {.callout-note}
**Interactive Visualization Below**

This dashboard demonstrates real-world application of the concepts above.
:::

<!-- TABLEAU/POWER BI DASHBOARD -->
<div style="width: 100%; max-width: 900px; margin: 30px auto;">
<iframe 
  src="[YOUR_DASHBOARD_URL]" 
  width="100%" 
  height="600"
  style="border: none; border-radius: 16px; box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
</iframe>
</div>

## Exercises

[Exercise content...]

## Project

[Project description...]
```

---

## 🔍 Verification Checklist

Before committing changes:

- [ ] Dashboard/Report published and public
- [ ] Embed URL copied correctly
- [ ] Module `.qmd` file valid Quarto format
- [ ] `quarto render` builds without errors
- [ ] HTML output displays dashboard/report
- [ ] Responsive on mobile (test with DevTools)
- [ ] All styling consistent with design system
- [ ] Commit message includes dashboard info
- [ ] Push to GitHub

---

## 📧 Support & Questions

For questions about embedding BI tools:

**Email:** planetsteamweb@gmail.com  
**GitHub:** https://github.com/lcarrenoy/PlanetSTEAM-courses  
**Documentation:** See `COURSES_INDEX.md` and `COURSE_GENERATION_PROMPT.md`

---

**Last Updated:** August 15, 2026  
**Version:** 1.0 (Initial Release)

