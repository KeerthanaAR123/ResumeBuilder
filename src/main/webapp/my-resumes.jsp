<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        response.sendRedirect("login.jsp");
        return;
    }
    java.util.List<java.util.Map<String, String>> resumes = (java.util.List<java.util.Map<String, String>>) request.getAttribute("resumes");
    if (resumes == null) resumes = new java.util.ArrayList<>();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Resumes</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="page-shell">
    <header class="dashboard-header">
        <div class="dashboard-copy">
            <p class="eyebrow">My Resumes</p>
            <h1>Resumes for <%= username %></h1>
        </div>
        <div class="header-actions">
            <a class="button primary" href="index.jsp?create=true">Create Resume</a>
            <a class="button secondary" href="index.jsp">Back</a>
        </div>
    </header>

    <section>
        <% if (resumes.isEmpty()) { %>
            <div class="form-panel">
                <p>You don't have any resumes yet. Create one or import a PDF.</p>
                <a class="button primary" href="index.jsp?create=true">Create Resume</a>
            </div>
        <% } else { %>
            <div class="form-panel">
                <ul style="list-style:none;padding:0;margin:0;display:grid;gap:12px;">
                    <% for (int i = 0; i < resumes.size(); i++) {
                        var r = resumes.get(i);
                        String title = r.getOrDefault("resumeTitle", "Resume " + (i+1));
                    %>
                    <li style="background:#fff;padding:18px;border-radius:12px;border:1px solid #e5e7eb;display:flex;justify-content:space-between;align-items:center;">
                        <div>
                            <strong><%= title %></strong>
                            <div style="color:#475569;font-size:0.95rem;">Created: <%= r.getOrDefault("_createdAt", "-") %></div>
                        </div>
                        <div style="display:flex;gap:8px;">
                            <a class="button secondary" href="view-resume?idx=<%= i %>">View</a>
                            <a class="button primary" href="view-resume?idx=<%= i %>&amp;autoDownload=true">Download</a>
                        </div>
                    </li>
                    <% } %>
                </ul>
            </div>
        <% } %>
    </section>
</div>
</body>
</html>
