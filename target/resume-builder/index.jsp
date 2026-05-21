<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resume Builder</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="page-shell">
    <header class="dashboard-header">
        <div class="dashboard-copy">
            <p class="eyebrow">Welcome back, Keerthana 👋</p>
            <h1>Manage your career documents.</h1>
        </div>
        <div class="header-actions">
            <button type="button" class="button primary" id="openResumeModal">Create Resume</button>
        </div>
    </header>

    <section class="dashboard-cards">
        <article class="dashboard-card active">
            <div class="card-icon">+</div>
            <h3>Create Resume</h3>
            <p>Build a new resume from scratch with AI.</p>
        </article>
        <article class="dashboard-card">
            <div class="card-icon">⤴</div>
            <h3>Import PDF</h3>
            <p>Upload an existing resume to edit.</p>
        </article>
        <article class="dashboard-card">
            <div class="card-icon">📄</div>
            <h3>My Resumes</h3>
            <p>View all your resume documents.</p>
        </article>
    </section>

    <section class="wizard-panel hidden" id="resumeWizard">
        <div class="wizard-header">
            <div>
                <span class="step-badge">Step <span id="currentStep">1</span>/8</span>
                <h2 id="wizardTitle">Personal</h2>
                <p class="wizard-subtitle">Fill each step one by one to generate a clean resume.</p>
            </div>
        </div>
        <form action="resume" method="post" class="resume-form wizard-form" id="resumeForm" autocomplete="off">
            <input type="hidden" id="resumeTitle" name="resumeTitle">
            <div class="wizard-step" data-step="1">
                <div class="field-group full-width">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" placeholder="Keerthana A R" required>
                </div>
                <div class="field-group full-width">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="keerthana19@gmail.com" required>
                </div>
                <div class="field-group full-width">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" placeholder="+91-9741463496">
                </div>
                <div class="field-group full-width">
                    <label for="linkedin">LinkedIn URL</label>
                    <input type="url" id="linkedin" name="linkedin" placeholder="https://www.linkedin.com/in/keerthanaar19">
                </div>
                <div class="field-group full-width">
                    <label for="github">GitHub URL</label>
                    <input type="url" id="github" name="github" placeholder="https://leetcode.com/u/KeerthanaAR123/">
                </div>
            </div>
            <div class="wizard-step hidden" data-step="2">
                <div class="field-group full-width">
                    <label for="summary">Professional Summary</label>
                    <textarea id="summary" name="summary" rows="5" placeholder="Write 2-4 sentences highlighting your experience and career goals."></textarea>
                </div>
            </div>
            <div class="wizard-step hidden" data-step="3">
                <div class="field-group full-width">
                    <label for="experience1">Professional Experience</label>
                    <textarea id="experience1" name="experience1" rows="5" placeholder="Add work experience, internships, or freelance roles."></textarea>
                </div>
            </div>
            <div class="wizard-step hidden" data-step="4">
                <div class="field-group full-width">
                    <label for="college">Institution / University</label>
                    <input type="text" id="college" name="college" placeholder="VVCE, Mysuru">
                </div>
                <div class="field-group full-width">
                    <label for="department">Degree / Field of Study</label>
                    <input type="text" id="department" name="department" placeholder="B.E. in Information Science Engineering">
                </div>
                <div class="field-group full-width">
                    <label for="cgpa">GPA (Optional)</label>
                    <input type="text" id="cgpa" name="cgpa" placeholder="9.35 / 10">
                </div>
            </div>
            <div class="wizard-step hidden" data-step="5">
                <div class="field-group full-width">
                    <label for="programmingSkills">Programming Skills</label>
                    <input type="text" id="programmingSkills" name="programmingSkills" placeholder="Java, Python, C++, Spring, Angular">
                </div>
                <div class="field-group full-width">
                    <label for="technicalSkills">Tools & Platforms</label>
                    <input type="text" id="technicalSkills" name="technicalSkills" placeholder="Git, GitHub, VS Code, Docker">
                </div>
                <div class="field-group full-width">
                    <label for="databaseTechnologies">Database Technologies</label>
                    <input type="text" id="databaseTechnologies" name="databaseTechnologies" placeholder="MySQL, MongoDB">
                </div>
                <div class="field-group full-width">
                    <label for="frameworks">Frameworks</label>
                    <input type="text" id="frameworks" name="frameworks" placeholder="Spring, Express, Angular">
                </div>
                <div class="field-group full-width">
                    <label for="softSkills">Soft Skills</label>
                    <input type="text" id="softSkills" name="softSkills" placeholder="Teamwork, Communication, Problem Solving">
                </div>
            </div>
            <div class="wizard-step hidden" data-step="6">
                <div class="field-group full-width">
                    <label for="projectTitle1">Project Name</label>
                    <input type="text" id="projectTitle1" name="projectTitle1" placeholder="Placement Prep / AI Integrated Career Development Platform">
                </div>
                <div class="field-group full-width">
                    <label for="projectDescription1">Project Details</label>
                    <textarea id="projectDescription1" name="projectDescription1" rows="4" placeholder="Describe what you built and your impact."></textarea>
                </div>
            </div>
            <div class="wizard-step hidden" data-step="7">
                <div class="field-group full-width">
                    <label for="projectTitle2">Project Name</label>
                    <input type="text" id="projectTitle2" name="projectTitle2" placeholder="Civic Issue Reporter / MEAN Stack">
                </div>
                <div class="field-group full-width">
                    <label for="projectDescription2">Project Details</label>
                    <textarea id="projectDescription2" name="projectDescription2" rows="4" placeholder="Describe what you built and your impact."></textarea>
                </div>
            </div>
            <div class="wizard-step hidden" data-step="8">
                <div class="field-group full-width">
                    <label for="certificationName1">Certification Name</label>
                    <input type="text" id="certificationName1" name="certificationName1" placeholder="Advanced Java Certificate">
                </div>
                <div class="field-group full-width">
                    <label for="certificationIssuer1">Issuing Organization</label>
                    <input type="text" id="certificationIssuer1" name="certificationIssuer1" placeholder="IBM">
                </div>
                <div class="field-group full-width">
                    <label for="certificationName2">Certification Name</label>
                    <input type="text" id="certificationName2" name="certificationName2" placeholder="Python Certificate">
                </div>
                <div class="field-group full-width">
                    <label for="certificationIssuer2">Issuing Organization</label>
                    <input type="text" id="certificationIssuer2" name="certificationIssuer2" placeholder="IBM">
                </div>
            </div>

            <div class="form-actions wizard-actions">
                <button type="button" class="button secondary hidden" id="backStep">Back</button>
                <button type="button" class="button primary" id="nextStep">Next</button>
                <button type="submit" class="button primary hidden" id="submitResume">Create Resume</button>
            </div>
        </form>
    </section>

    <div class="modal-overlay hidden" id="resumeModal">
        <div class="modal-panel">
            <div class="modal-header">
                <h3>New Resume</h3>
                <button type="button" class="close-modal" id="closeResumeModal">&times;</button>
            </div>
            <p>Give your resume a name to get started.</p>
            <div class="field-group full-width">
                <label for="resumeTitleModal">Resume Title</label>
                <input type="text" id="resumeTitleModal" placeholder="e.g. Software Engineer 2025">
            </div>
            <div class="modal-actions">
                <button type="button" class="button secondary" id="cancelResumeModal">Cancel</button>
                <button type="button" class="button primary" id="startWizard">Create Resume</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const modal = document.getElementById('resumeModal');
        const openModal = document.getElementById('openResumeModal');
        const closeModal = document.getElementById('closeResumeModal');
        const cancelModal = document.getElementById('cancelResumeModal');
        const startWizardButton = document.getElementById('startWizard');
        const wizard = document.getElementById('resumeWizard');
        const resumeTitleHidden = document.getElementById('resumeTitle');
        const resumeTitleModal = document.getElementById('resumeTitleModal');
        const steps = Array.from(document.querySelectorAll('.wizard-step'));
        const currentStepLabel = document.getElementById('currentStep');
        const wizardTitle = document.getElementById('wizardTitle');
        const nextStepButton = document.getElementById('nextStep');
        const backStepButton = document.getElementById('backStep');
        const submitButton = document.getElementById('submitResume');

        let currentStep = 1;
        const stepTitles = [
            'Personal',
            'Summary',
            'Experience',
            'Education',
            'Skills',
            'Projects (1/2)',
            'Projects (2/2)',
            'Certifications'
        ];

        function showStep(step) {
            steps.forEach(panel => {
                panel.classList.toggle('hidden', parseInt(panel.dataset.step, 10) !== step);
            });
            currentStepLabel.textContent = step;
            wizardTitle.textContent = stepTitles[step - 1];
            backStepButton.classList.toggle('hidden', step === 1);
            nextStepButton.classList.toggle('hidden', step === steps.length);
            submitButton.classList.toggle('hidden', step !== steps.length);
        }

        openModal.addEventListener('click', () => modal.classList.remove('hidden'));
        closeModal.addEventListener('click', () => modal.classList.add('hidden'));
        cancelModal.addEventListener('click', () => modal.classList.add('hidden'));

        startWizardButton.addEventListener('click', () => {
            const title = resumeTitleModal.value.trim();
            if (!title) {
                resumeTitleModal.focus();
                return;
            }
            resumeTitleHidden.value = title;
            wizard.classList.remove('hidden');
            modal.classList.add('hidden');
            showStep(currentStep);
        });

        nextStepButton.addEventListener('click', () => {
            if (currentStep < steps.length) {
                currentStep += 1;
                showStep(currentStep);
            }
        });
        backStepButton.addEventListener('click', () => {
            if (currentStep > 1) {
                currentStep -= 1;
                showStep(currentStep);
            }
        });

        document.querySelectorAll('input, textarea').forEach(el => el.setAttribute('autocomplete', 'off'));
        showStep(currentStep);
    });
</script>
</body>
</html>