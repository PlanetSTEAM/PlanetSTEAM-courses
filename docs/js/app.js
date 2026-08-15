// Planet STEAM Academy - SPA Navigation
let coursesData = null;
let currentCourseObj = null;
let currentTrackObj = null;
let currentModule = null;

// Load courses data
async function loadCourses() {
    const response = await fetch('/PlanetSTEAM-courses/data/courses.json');
    coursesData = await response.json();
    renderHome();
}

// Render home with expandible courses
function renderHome() {
    const container = document.getElementById('courses-container');
    container.innerHTML = '';

    coursesData.courses.forEach((course, courseIdx) => {
        const courseCard = document.createElement('div');
        courseCard.className = 'course-card';
        courseCard.innerHTML = `
            <div class="course-header" onclick="toggleCourse('${course.id}')">
                <div>
                    <span class="course-emoji">${course.emoji}</span>
                    <span class="course-name">${course.name}</span>
                </div>
                <span class="expand-icon">▼</span>
            </div>
            <div class="tracks-container" id="tracks-${course.id}" style="display:none;">
                ${course.tracks.map((track, trackIdx) => `
                    <div class="track-item" onclick="openTrack(${courseIdx}, ${trackIdx})">
                        ${track.name}
                    </div>
                `).join('')}
            </div>
        `;
        container.appendChild(courseCard);
    });
}

// Toggle course expansion
function toggleCourse(courseId) {
    const tracksContainer = document.getElementById(`tracks-${courseId}`);
    const isHidden = tracksContainer.style.display === 'none';

    // Hide all others
    document.querySelectorAll('[id^="tracks-"]').forEach(el => {
        el.style.display = 'none';
    });
    document.querySelectorAll('.expand-icon').forEach(el => {
        el.style.transform = 'rotate(0deg)';
    });

    // Show/hide this one
    if (isHidden) {
        tracksContainer.style.display = 'grid';
        event.target.closest('.course-header').querySelector('.expand-icon').style.transform = 'rotate(180deg)';
    }
}

// Open track with modules
function openTrack(courseIdx, trackIdx) {
    currentCourseObj = coursesData.courses[courseIdx];
    currentTrackObj = currentCourseObj.tracks[trackIdx];
    currentModule = 1;

    const panel = document.getElementById('content-panel');
    const header = document.getElementById('panel-header');

    header.innerHTML = `
        <div class="breadcrumb">
            <a href="#" onclick="renderHome(); return false;">← Home</a> /
            <span>${currentCourseObj.name}</span> /
            <span>${currentTrackObj.name}</span>
        </div>
        <h2>${currentTrackObj.name}</h2>
        <p class="track-info">12 Modules • 240+ Hours • Interview Ready</p>
    `;

    const modulesList = document.getElementById('modules-list');
    modulesList.innerHTML = coursesData.modules.map((mod, idx) => `
        <div class="module-item" onclick="openModule(${idx + 1})">
            <span class="mod-number">M${String(idx + 1).padStart(2, '0')}</span>
            <span class="mod-title">${mod}</span>
        </div>
    `).join('');

    // Open first module
    openModule(1);

    // Show panel
    panel.style.display = 'flex';
}

// Open specific module content
async function openModule(moduleNum) {
    currentModule = moduleNum;

    // Highlight current module
    document.querySelectorAll('.module-item').forEach((el, idx) => {
        el.classList.toggle('active', idx + 1 === moduleNum);
    });

    const content = document.getElementById('content-display');
    content.innerHTML = `<div class="loading">Loading content...</div>`;

    if (!currentCourseObj || !currentTrackObj) {
        content.innerHTML = `<div class="error">No track selected</div>`;
        return;
    }

    try {
        const moduleName = coursesData.modules[moduleNum - 1];

        // Convert folder to kebab-case: "04-AWS" → "04-aws-complete"
        const courseFolder = currentCourseObj.folder.toLowerCase().replace(/\s+/g, '-');
        const completeHtmlUrl = `/PlanetSTEAM-courses/${courseFolder}-complete.html`;

        // Attempt to fetch the complete course HTML
        const response = await fetch(completeHtmlUrl);
        if (response.ok) {
            const html = await response.text();
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');

            // Search for h3 heading containing "Module X:"
            const headings = doc.body.querySelectorAll('h3');
            let moduleSection = null;

            for (let heading of headings) {
                if (heading.textContent.includes(`Module ${moduleNum}:`)) {
                    moduleSection = heading;
                    break;
                }
            }

            // Extract module content and display
            if (moduleSection) {
                // Get text until next module section (h3)
                let moduleContent = moduleSection.outerHTML;
                let nextElement = moduleSection.nextElementSibling;

                while (nextElement) {
                    // Stop if we hit another Module heading
                    if (nextElement.tagName === 'H3' && nextElement.textContent.includes('Module')) {
                        break;
                    }
                    moduleContent += nextElement.outerHTML;
                    nextElement = nextElement.nextElementSibling;
                }

                content.innerHTML = moduleContent;
            } else {
                // Module not found - show available modules
                const availableModules = [];
                const allHeadings = doc.body.querySelectorAll('h3');
                allHeadings.forEach(h => {
                    const match = h.textContent.match(/Module (\d+):/);
                    if (match) {
                        availableModules.push(match[0]);
                    }
                });

                content.innerHTML = `
                    <div style="padding: 40px; color: #cbd5e1; text-align: center;">
                        <p>📚 ${moduleName}</p>
                        <p style="margin-top: 20px; font-size: 14px; color: #f87171;">
                            ⚠️ Module ${moduleNum} not available in this course
                        </p>
                        <p style="margin-top: 10px; font-size: 12px; color: #999;">
                            ${currentCourseObj.name} → ${currentTrackObj.name}
                        </p>
                        ${availableModules.length > 0 ? `<p style="margin-top: 10px; font-size: 11px; color: #666;">Available: ${availableModules.join(', ')}</p>` : ''}
                    </div>
                `;
            }
        } else {
            throw new Error(`HTTP ${response.status} - File not found`);
        }
    } catch (e) {
        content.innerHTML = `
            <div style="padding: 40px; color: #cbd5e1; text-align: center;">
                <p>📚 ${coursesData.modules[moduleNum - 1]}</p>
                <p style="margin-top: 20px; font-size: 14px; color: #f87171;">
                    ⚠️ Error loading content
                </p>
                <p style="margin-top: 10px; font-size: 12px; color: #999;">
                    ${currentCourseObj.name} → ${currentTrackObj.name}
                </p>
                <p style="margin-top: 10px; font-size: 11px; color: #666;">
                    ${e.message}
                </p>
            </div>
        `;
    }

    // Update navigation
    updateModuleNav();
}

// Update module navigation buttons
function updateModuleNav() {
    const prevBtn = document.getElementById('prev-module');
    const nextBtn = document.getElementById('next-module');

    prevBtn.disabled = currentModule === 1;
    nextBtn.disabled = currentModule === 12;
}

// Navigation
function previousModule() {
    if (currentModule > 1) {
        openModule(currentModule - 1);
        document.getElementById('modules-list').scrollTo({ behavior: 'smooth', top: 0 });
    }
}

function nextModule() {
    if (currentModule < 12) {
        openModule(currentModule + 1);
        document.getElementById('modules-list').scrollTo({ behavior: 'smooth', top: 0 });
    }
}

// Close panel
function closePanel() {
    document.getElementById('content-panel').style.display = 'none';
    renderHome();
}

// Initialize on load
document.addEventListener('DOMContentLoaded', loadCourses);
