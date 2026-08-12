# 🎓 PLANET STEAM COURSE GENERATION PROMPT
**Master Specification for All Courses**

**Created:** August 15, 2026  
**Version:** 1.0 (Final)  
**Status:** Ready for Implementation

---

# 📋 CORE VISION

Planet STEAM courses are **JOB-READY BOOTCAMPS**, not just educational content.

**Goal:** User completes course → Gets job + passes interviews + earns competitive salary

**Not:** "Learn Python"  
**Yes:** "Become a Data Analyst ready to get hired"

---

# 📐 ARCHITECTURE

## Course Structure (Every Course)

```
1 COURSE = 4 TRACKS × 12 MODULES × Multiple Assessment Levels

Example: Python
├── Track 1: Data Analyst (40-45h, 10 roles)
├── Track 2: Data Engineer (50-60h, 10 roles)
├── Track 3: Backend Developer (50-60h, 10 roles)
└── Track 4: ML/AI Engineer (60-70h, 8 roles)

TOTAL: 48 Modules | 38 Roles | 200-235 Hours
```

## Module Structure (Every Module)

```
EACH MODULE HAS:

1️⃣ LEARNING OUTCOME
   └─ Specific, measurable, exam-aligned

2️⃣ CONCEPTOS PEDAGÓGICOS
   ├─ Clear explanation (no jargon at start)
   ├─ Why this matters
   ├─ Real-world analogies
   └─ Connection to exams & jobs

3️⃣ EJEMPLOS PRÁCTICOS (3-5 examples)
   ├─ Example 1: Básico, fácil
   ├─ Example 2: Intermedio, real case
   ├─ Example 3: Avanzado, empresa
   └─ Example 4: Trampa común (¡CUIDADO!)

4️⃣ EJERCICIOS PROGRESIVOS
   ├─ NIVEL 🌱 BÁSICO (2-3 ejercicios)
   │  └─ Tipo: Identificar/nombrar conceptos
   ├─ NIVEL ⚡ INTERMEDIO (3-4 ejercicios)
   │  └─ Tipo: Resolver problema/código
   └─ NIVEL 🔥 AVANZADO (2-3 ejercicios)
      └─ Tipo: Diseñar solución completa

5️⃣ MOCK EXAM QUESTIONS (3-5 preguntas REALES)
   ├─ Pregunta exacta del certificado/examen
   ├─ 4 opciones (A, B, C, D)
   ├─ Respuesta correcta marcada con ✅
   └─ EXPLICACIÓN DETALLADA:
      ├─ Por qué A es incorrecta
      ├─ Por qué B es incorrecta
      ├─ Por qué C es CORRECTA
      └─ Por qué D es incorrecta

6️⃣ TRAMPA COMÚN (Qué falla la gente)
   ├─ Trampa 1: "Muchos piensan..."
   ├─ Trampa 2: "Confunden..."
   └─ Trampa 3: "No leen bien..."

7️⃣ PROYECTO PRÁCTICO
   ├─ Nombre descriptivo
   ├─ Objetivo claro
   ├─ Dataset/datos incluidos
   ├─ Deliverables específicos
   └─ Cómo se evalúa
```

---

# 🎯 PEDAGOGY REQUIREMENTS

## Learning is NOT about memorization

✅ **DO:**
- Explain CONCEPTS clearly
- Show WHY something works
- Use analogies from real world
- Progress gradually (easy → hard)
- Connect to exams explicitly
- Show common mistakes

❌ **DON'T:**
- Just dump information
- Expect memorization
- Use jargon without explaining
- Jump from beginner to advanced
- Leave questions unanswered

## Exam-Focused

**EVERY exercise and example must align with:**
- Real exam questions
- Actual certification content
- Job interview topics
- Real company use cases

**NOT:** Generic, textbook-style content

---

# 📊 TRACK ASSESSMENT EXAM

## Rules (STRICT)

✅ **25 Questions** (not 100, not 50)
✅ **Large Question Bank** (minimum 200 questions per track)
✅ **Each Attempt:** Different questions (random selection)
✅ **Multiple Choice:** 4 options (A, B, C, D)
✅ **Passing Score:** 70%+ (18+ out of 25)
✅ **Time Limit:** 30 minutes (1.2 min per question)
✅ **Unlimited Retakes:** Practice until pass
✅ **Feedback:** Shows score + weak areas + review hints
✅ **Certificate:** "Track Certificate" issued when passing

## Question Bank Structure

```
Example: Data Analyst Track
├─ Setup & Basics: 20 questions
├─ Variables & Types: 25 questions
├─ Control Flow: 20 questions
├─ Functions: 20 questions
├─ Pandas: 35 questions
├─ EDA: 30 questions
├─ Visualization: 25 questions
├─ SQL: 25 questions
├─ Statistics: 30 questions
├─ Projects & Capstone: 25 questions
└─ TOTAL: 250+ questions in bank

Assessment draws 25 random questions
Each attempt = different 25 questions
```

## Question Quality

✅ **Real exam questions** (or based on real exams)
✅ **Clear options** (not ambiguous)
✅ **Detailed explanations** (why correct/incorrect)
✅ **Varied difficulty** (mix of easy/medium/hard)
✅ **Practical focus** (not theoretical only)

---

# 💼 PROJECTS

## Portfolio Projects (Module 10)

**Requirements:**
- ✅ 5 projects per track
- ✅ Progressively harder (1=easy, 5=hard)
- ✅ Real datasets (not toy data)
- ✅ Business scenarios (not academic)
- ✅ Production-quality output
- ✅ GitHub-ready code
- ✅ Includes documentation

## Project Structure

```
EACH PROJECT HAS:

1️⃣ OBJECTIVE
   └─ Clear business problem

2️⃣ DATASET
   ├─ CSV/Parquet/JSON
   ├─ Size: realistic (1MB-100MB)
   ├─ Quality: some messiness (real data)
   └─ Included in course

3️⃣ TASKS (3-5 specific tasks)
   ├─ Data loading
   ├─ Data cleaning
   ├─ Analysis/modeling
   ├─ Visualization
   └─ Report generation

4️⃣ DELIVERABLES
   ├─ Python script (.py)
   ├─ Jupyter Notebook (.ipynb)
   ├─ Results (CSV/images)
   ├─ Report (TXT/PDF)
   └─ README.md

5️⃣ EVALUATION CRITERIA
   ├─ Code quality
   ├─ Correctness of results
   ├─ Documentation
   ├─ Presentation
   └─ Insights/interpretation
```

## Capstone Project (Module 12)

**Requirements:**
- ✅ 1 per track
- ✅ Integrates ALL skills from track
- ✅ Real enterprise-scale data
- ✅ Production-ready output
- ✅ Multiple deliverables
- ✅ Presentation included

---

# 🎤 CERTIFICATIONS

## Official Certifications (Module 11)

**Each track covers 3 official certifications:**

### Data Analyst Track
- PCAP (Python Certified Associate Programmer) - $99
- Google Analytics Certified Associate - Free
- Microsoft Data Analyst (PL-300) - $99

### Data Engineer Track
- AWS Certified Data Analytics Specialty - $150
- Google Cloud Professional Data Engineer - $200
- Microsoft Azure DP-203 - $99

### Backend Developer Track
- AWS Certified Developer Associate - $150
- Microsoft Azure Developer Associate (AZ-204) - $99
- Linux Foundation LFCA - $395

### ML/AI Engineer Track
- TensorFlow Developer Certificate - $100
- AWS Certified Machine Learning Specialty - $300
- Google Cloud Professional ML Engineer - $200

## Certification Preparation

✅ **Module 11 includes:**
- Study guides for each cert
- 30-50 mock questions per cert
- Key topics to focus on
- Test-taking strategies
- Common pitfalls

✅ **Aligned with Module Content:**
- Each module prepares for relevant parts of certs
- Example questions match real exam style

---

# 🎓 INTERVIEW PREPARATION

## Interview Q&A (Module 12)

**Total: 140+ questions per track**

```
Group 1: Conceptos Básicos (20 Q&A)
├─ Fundamental concepts
├─ Vocabulary
├─ Quick checks
└─ Easy/Medium difficulty

Group 2: Track-Specific Content (30 Q&A)
├─ Technical depth
├─ Problem-solving
├─ Medium/Hard difficulty
└─ Aligns with main modules

Group 3: Advanced Topics (25 Q&A)
├─ Architecture decisions
├─ Performance optimization
├─ Hard difficulty
├─ Real production scenarios
└─ Rare edge cases

Group 4: Behavioral (25 Q&A)
├─ Communication skills
├─ Problem-solving approach
├─ Team dynamics
├─ Learning mindset
└─ Adaptability

Group 5: Company-Specific (40 Q&A)
├─ 20+ LATAM companies
├─ 2-3 Q&A per company
├─ Real interview questions (if public)
├─ Company culture tips
└─ Salary insights
```

## Companies Covered (80+ LATAM)

```
TRACK-SPECIFIC:

Data Analyst:
- Mercado Libre (15 Q&A)
- OLX (15 Q&A)
- Cornershop (10 Q&A)
- Infobip (15 Q&A)
- Globant (15 Q&A)
- ... (20+ more)

Data Engineer:
- Mercado Libre (15 Q&A)
- Uber (15 Q&A)
- Globant (15 Q&A)
- Infobip (10 Q&A)
- ... (20+ more)

Backend Developer:
- Rappi (15 Q&A)
- Infobip (15 Q&A)
- Globant (15 Q&A)
- ... (20+ more)

ML/AI Engineer:
- OpenAI (15 Q&A)
- Google AI (15 Q&A)
- Globant (15 Q&A)
- AI Startups (10 Q&A)
- ... (20+ more)
```

---

# 💰 JOB READINESS

## CV & LinkedIn Optimization

✅ **GitHub Setup:**
- How to structure portfolio
- README best practices
- Project descriptions
- Contribution guidelines

✅ **LinkedIn Profile:**
- Headline optimization
- Summary writing
- Skills section setup
- Certification links

✅ **Portfolio Website:**
- Showcase projects
- Case studies
- Contact information
- Live demos

## Salary Negotiation

✅ **By Role & Experience:**
- Junior salary ranges
- Mid-level expectations
- Senior compensation
- Location variations (LATAM)

✅ **Negotiation Tactics:**
- When to negotiate
- How to research salary
- What to ask for
- How to respond to offers

## Job Search Strategy

✅ **Where to Apply:**
- Job boards (LinkedIn, Indeed, etc.)
- Company career pages
- Recruiter networks
- Referral programs

✅ **Application Tips:**
- Customizing resume
- Cover letters
- Follow-up strategy
- Networking importance

---

# 📋 COURSE STRUCTURE CHECKLIST

## Before Creating Module

- [ ] Define Learning Outcome (exam-aligned)
- [ ] Research real exam questions
- [ ] Create pedagogical explanations
- [ ] Find 3-5 real-world examples
- [ ] Design exercises (🌱 → ⚡ → 🔥)
- [ ] Create mock exam questions
- [ ] Identify common mistakes
- [ ] Design practical project
- [ ] Test all code examples
- [ ] Verify against real certifications

## Before Publishing Track

- [ ] All 12 modules complete
- [ ] 5 portfolio projects done
- [ ] All projects have datasets
- [ ] All projects have solutions
- [ ] 25+ certification Q&A written
- [ ] Track Assessment questions (200+)
- [ ] Interview Q&A (140+)
- [ ] Capstone project defined
- [ ] All links tested
- [ ] Quality review complete

## Before Launching Course

- [ ] All 4 tracks complete
- [ ] All 48 modules tested
- [ ] All projects work end-to-end
- [ ] All assessments functional
- [ ] All certificates working
- [ ] Interview prep accessible
- [ ] Company-specific Q&A current
- [ ] Salary data accurate
- [ ] Job search guide relevant
- [ ] User feedback collected

---

# 🚀 ROLLOUT STRATEGY

## Phase 1: Python (Complete)
- 4 tracks, 48 modules
- Ready for deployment
- Testing in production

## Phase 2: Other 21 Courses
**Use SAME structure for:**
- Java (4 tracks, 48 modules)
- JavaScript (4 tracks, 48 modules)
- AWS (4 tracks, 48 modules)
- Azure (4 tracks, 48 modules)
- GCP (4 tracks, 48 modules)
- Data Engineering (4 tracks, 48 modules)
- Data Analytics (4 tracks, 48 modules)
- Machine Learning (4 tracks, 48 modules)
- Deep Learning (4 tracks, 48 modules)
- NLP (4 tracks, 48 modules)
- Frontend (4 tracks, 48 modules)
- Mobile Dev (4 tracks, 48 modules)
- DevOps (4 tracks, 48 modules)
- Cloud Architecture (4 tracks, 48 modules)
- Cybersecurity (4 tracks, 48 modules)
- Databases (4 tracks, 48 modules)
- Product Management (4 tracks, 48 modules)
- Leadership (4 tracks, 48 modules)
- UX/Design (4 tracks, 48 modules)
- Blockchain (4 tracks, 48 modules)
- Business Analysis (4 tracks, 48 modules)
- And more...

---

# ✅ QUALITY STANDARDS

## Content Quality

✅ **Clarity:** Explained without jargon
✅ **Accuracy:** Verified against real sources
✅ **Relevance:** Directly applicable to jobs
✅ **Currency:** Updated regularly
✅ **Completeness:** Every topic covered
✅ **Progression:** Easy to hard flow
✅ **Engagement:** Interesting examples

## Code Quality

✅ **Best Practices:** Professional standards
✅ **Tested:** All code runs
✅ **Commented:** Clear explanations
✅ **Reproducible:** Works on user machines
✅ **Efficient:** Not wasteful
✅ **Readable:** Well-formatted

## Assessment Quality

✅ **Valid:** Tests learning outcomes
✅ **Reliable:** Consistent results
✅ **Fair:** Not trick questions
✅ **Comprehensive:** Covers all topics
✅ **Realistic:** Matches real exams

---

# 📊 METRICS TO TRACK

- User completion rate per module
- Assessment pass rate
- Time spent per module
- Project submission rate
- Certification pass rate
- Job placement rate
- Average starting salary
- User satisfaction score
- Employer feedback

---

# 🎯 SUCCESS CRITERIA

**User Success = Job Hired + Good Salary**

✅ Course quality: 90%+ completion rate
✅ Learning: 80%+ pass on track assessment
✅ Skills: Portfolio projects showcase mastery
✅ Certifications: 75%+ get official certs
✅ Interviews: 70%+ pass interviews
✅ Employment: 60%+ get job within 3 months
✅ Salary: Earn competitive rate for role

---

# 📝 USAGE INSTRUCTIONS

This prompt defines the blueprint for ALL Planet STEAM courses.

**When creating a new course:**

1. Copy this prompt
2. Replace "[Course Name]" and "[Track Names]"
3. Follow the structure exactly
4. Maintain pedagogical standards
5. Create real projects
6. Test everything
7. Verify against real certifications/jobs

**DO NOT deviate from structure without approval.**

---

**CREATED:** August 15, 2026  
**VERSION:** 1.0  
**STATUS:** Final & Locked  
**NEXT:** Apply to 21 additional courses

---

*This prompt is the master specification for Planet STEAM course development.*
