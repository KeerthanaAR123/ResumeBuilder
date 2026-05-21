<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String sessionUser = (String) session.getAttribute("username");
    if (sessionUser != null && !sessionUser.isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }
    String errorMessage = (String) request.getAttribute("errorMessage");
    String usernameValue = (String) request.getAttribute("usernameValue");
    String registered = request.getParameter("registered");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign In - Resume Builder</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="auth-container">
    <div class="auth-card">
        <div class="auth-visual">
            <h2>Resume Builder</h2>
            <p>Create professional resumes quickly and export as PDF.</p>
        </div>
        <div class="auth-form-wrap">
            <div class="auth-form">
                <h3>Sign in</h3>
                <% if (registered != null && registered.equals("true")) { %>
                    <div class="error-box" style="background:#ecfdf5;color:#065f46;border-color:#bbf7d0;">
                        Your account was created successfully. Please sign in.
                    </div>
                <% } %>
                <% if (errorMessage != null) { %>
                    <div class="error-box"><%= errorMessage %></div>
                <% } %>
                <p class="lead">Sign in to access your resumes and editor.</p>
                <form action="login" method="post" autocomplete="off">
                    <div class="field-group full-width">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="<%= usernameValue != null ? usernameValue : "" %>" required>
                    </div>
                    <div class="field-group full-width">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="auth-actions">
                        <a class="auth-link" href="register.jsp">Create account</a>
                        <button type="submit" class="button primary">Sign In</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
