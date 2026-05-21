<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String name = (String) request.getAttribute("name");
    String resumeTitle = (String) request.getAttribute("resumeTitle");
    String email = (String) request.getAttribute("email");
    String phone = (String) request.getAttribute("phone");
    String linkedin = (String) request.getAttribute("linkedin");
    String github = (String) request.getAttribute("github");
    String summary = (String) request.getAttribute("summary");
    String experience = (String) request.getAttribute("experience");
    String college = (String) request.getAttribute("college");
    String department = (String) request.getAttribute("department");
    String cgpa = (String) request.getAttribute("cgpa");
    String programmingSkills = (String) request.getAttribute("programmingSkills");
    String technicalSkills = (String) request.getAttribute("technicalSkills");
    String databaseTechnologies = (String) request.getAttribute("databaseTechnologies");
    String toolsPlatforms = (String) request.getAttribute("toolsPlatforms");
    String softSkills = (String) request.getAttribute("softSkills");
    String frameworks = (String) request.getAttribute("frameworks");
    String projectTitle1 = (String) request.getAttribute("projectTitle1");
    String projectDescription1 = (String) request.getAttribute("projectDescription1");
    String projectTitle2 = (String) request.getAttribute("projectTitle2");
    String projectDescription2 = (String) request.getAttribute("projectDescription2");
    String certificationName1 = (String) request.getAttribute("certificationName1");
    String certificationIssuer1 = (String) request.getAttribute("certificationIssuer1");
    String certificationName2 = (String) request.getAttribute("certificationName2");
    String certificationIssuer2 = (String) request.getAttribute("certificationIssuer2");

    java.util.List<String> contactLines = new java.util.ArrayList<String>();
    if (phone != null && !phone.isEmpty()) contactLines.add(phone);
    if (email != null && !email.isEmpty()) contactLines.add(email);
    if (linkedin != null && !linkedin.isEmpty()) contactLines.add(linkedin);
    if (github != null && !github.isEmpty()) contactLines.add(github);

    String pdfFileName = "Resume";
    if (resumeTitle != null && !resumeTitle.isEmpty()) {
        pdfFileName = resumeTitle.replace("\r", " ").replace("\n", " ").replace("\"", " ").trim();
        if (pdfFileName.isEmpty()) {
            pdfFileName = "Resume";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Resume Preview</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="page-shell resume-view" id="resumeContent">
    <header class="resume-header centered-header">
        <div class="header-center">
            <h1><%= name != null && !name.isEmpty() ? name : "Your Name" %></h1>
            <% if (!contactLines.isEmpty()) { %>
            <div class="contact-line"><%= String.join(" | ", contactLines) %></div>
            <% } %>
        </div>
    </header>

    <% if (summary != null && !summary.isEmpty()) { %>
    <section class="section summary-section">
        <div class="section-header">
            <h2>Summary</h2>
        </div>
        <p><%= summary %></p>
    </section>
    <% } %>

    <% if (experience != null && !experience.isEmpty()) { %>
    <section class="section experience-section">
        <div class="section-header">
            <h2>Professional Experience</h2>
        </div>
        <p><%= experience %></p>
    </section>
    <% } %>

    <% if ((programmingSkills != null && !programmingSkills.isEmpty()) ||
           (technicalSkills != null && !technicalSkills.isEmpty()) ||
           (databaseTechnologies != null && !databaseTechnologies.isEmpty()) ||
           (toolsPlatforms != null && !toolsPlatforms.isEmpty()) ||
           (softSkills != null && !softSkills.isEmpty()) ||
           (frameworks != null && !frameworks.isEmpty())) { %>
    <section class="section skills-section">
        <div class="section-header">
            <h2>Skills</h2>
        </div>
        <ul class="skill-block">
            <% if (programmingSkills != null && !programmingSkills.isEmpty()) { %>
            <li><strong>Programming:</strong> <%= programmingSkills %></li>
            <% } %>
            <% if (technicalSkills != null && !technicalSkills.isEmpty()) { %>
            <li><strong>Tools & Platforms:</strong> <%= technicalSkills %></li>
            <% } %>
            <% if (databaseTechnologies != null && !databaseTechnologies.isEmpty()) { %>
            <li><strong>Database Technologies:</strong> <%= databaseTechnologies %></li>
            <% } %>
            <% if (toolsPlatforms != null && !toolsPlatforms.isEmpty()) { %>
            <li><strong>Tools & Platforms:</strong> <%= toolsPlatforms %></li>
            <% } %>
            <% if (softSkills != null && !softSkills.isEmpty()) { %>
            <li><strong>Soft Skills:</strong> <%= softSkills %></li>
            <% } %>
            <% if (frameworks != null && !frameworks.isEmpty()) { %>
            <li><strong>Frameworks:</strong> <%= frameworks %></li>
            <% } %>
        </ul>
    </section>
    <% } %>

    <% if ((college != null && !college.isEmpty()) ||
           (department != null && !department.isEmpty()) ||
           (cgpa != null && !cgpa.isEmpty())) { %>
    <section class="section education-section">
        <div class="section-header">
            <h2>Education</h2>
        </div>
        <div class="education-row">
            <div class="education-details">
                <% if (college != null && !college.isEmpty()) { %>
                <p><strong><%= college %></strong></p>
                <% } %>
                <% if (department != null && !department.isEmpty()) { %>
                <p><%= department %></p>
                <% } %>
            </div>
            <% if (cgpa != null && !cgpa.isEmpty()) { %>
            <div class="education-meta">
                <p><strong>CGPA</strong></p>
                <p><%= cgpa %></p>
            </div>
            <% } %>
        </div>
    </section>

    <% if ((projectTitle1 != null && !projectTitle1.isEmpty()) || (projectDescription1 != null && !projectDescription1.isEmpty()) ||
           (projectTitle2 != null && !projectTitle2.isEmpty()) || (projectDescription2 != null && !projectDescription2.isEmpty())) { %>
    <section class="section projects-section">
        <div class="section-header">
            <h2>Projects</h2>
        </div>
        <% if (projectTitle1 != null && !projectTitle1.isEmpty() || projectDescription1 != null && !projectDescription1.isEmpty()) { %>
        <div class="project-block">
            <% if (projectTitle1 != null && !projectTitle1.isEmpty()) { %>
            <p class="project-title"><%= projectTitle1 %></p>
            <% } %>
            <% if (projectDescription1 != null && !projectDescription1.isEmpty()) { %>
            <p class="project-description"><%= projectDescription1 %></p>
            <% } %>
        </div>
        <% } %>
        <% if (projectTitle2 != null && !projectTitle2.isEmpty() || projectDescription2 != null && !projectDescription2.isEmpty()) { %>
        <div class="project-block">
            <% if (projectTitle2 != null && !projectTitle2.isEmpty()) { %>
            <p class="project-title"><%= projectTitle2 %></p>
            <% } %>
            <% if (projectDescription2 != null && !projectDescription2.isEmpty()) { %>
            <p class="project-description"><%= projectDescription2 %></p>
            <% } %>
        </div>
        <% } %>
    </section>
    <% } %>

    <% if ((certificationName1 != null && !certificationName1.isEmpty()) ||
           (certificationName2 != null && !certificationName2.isEmpty())) { %>
    <section class="section certifications-section">
        <div class="section-header">
            <h2>Certifications</h2>
        </div>
        <ul class="certification-list">
            <% if (certificationName1 != null && !certificationName1.isEmpty()) { %>
            <li><%= certificationName1 %><% if (certificationIssuer1 != null && !certificationIssuer1.isEmpty()) { %> - <%= certificationIssuer1 %><% } %></li>
            <% } %>
            <% if (certificationName2 != null && !certificationName2.isEmpty()) { %>
            <li><%= certificationName2 %><% if (certificationIssuer2 != null && !certificationIssuer2.isEmpty()) { %> - <%= certificationIssuer2 %><% } %></li>
            <% } %>
        </ul>
    </section>
    <% } %>

    <div class="resume-actions no-print">
        <button type="button" class="button secondary" onclick="window.history.back()">Edit Resume</button>
        <button type="button" class="button primary" id="downloadResumeBtn">Download Resume</button>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
<script>
    document.getElementById('downloadResumeBtn').addEventListener('click', function() {
        var element = document.getElementById('resumeContent');
        var options = {
            margin: 0.4,
            filename: '<%= pdfFileName %>.pdf',
            image: { type: 'jpeg', quality: 0.98 },
            html2canvas: { scale: 2, useCORS: true },
            jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
        };
        html2pdf().set(options).from(element).save();
    });
</script>
</body>
</html>
