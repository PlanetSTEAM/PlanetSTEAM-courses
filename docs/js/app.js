// Planet STEAM Academy - SPA Navigation
let coursesData = null;
let currentCourse = null;
let currentTrack = null;
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

    coursesData.courses.forEach(course => {
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
                ${course.tracks.map(track => `
                    <div class="track-item" onclick="openTrack('${course.id}', '${track.id}', '${track.name}', '${course.name}')">
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
function openTrack(courseId, trackId, trackName, courseName) {
    currentCourse = courseId;
    currentTrack = trackId;
    currentModule = 1;

    const panel = document.getElementById('content-panel');
    const header = document.getElementById('panel-header');

    header.innerHTML = `
        <div class="breadcrumb">
            <a href="#" onclick="renderHome(); return false;">← Home</a> /
            <span>${courseName}</span> /
            <span>${trackName}</span>
        </div>
        <h2>${trackName}</h2>
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

    // Load Quarto compiled HTML
    const trackDir = `T${String(currentTrack).padStart(2, '0')}`;
    const quartoUrl = `/PlanetSTEAM-courses/courses/_output/${currentCourse.split('-')[0]}-${trackDir}.html`;

    const content = document.getElementById('content-display');
    content.innerHTML = `
        <div class="loading">Loading content...</div>
    `;

    try {
        const response = await fetch(quartoUrl);
        if (response.ok) {
            const html = await response.text();
            // Extract body content
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            const body = doc.body.innerHTML;
            content.innerHTML = body;
        } else {
            content.innerHTML = `<div class="error">Content not available</div>`;
        }
    } catch (e) {
        content.innerHTML = `<div class="error">Error loading content</div>`;
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
