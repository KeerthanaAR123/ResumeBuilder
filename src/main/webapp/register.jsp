<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String sessionUser = (String) session.getAttribute("username");
    if (sessionUser != null && !sessionUser.isEmpty()) {
        response.sendRedirect("index.jsp");
        return;
    }
    String errorMessage = (String) request.getAttribute("errorMessage");
    String usernameValue = (String) request.getAttribute("usernameValue");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Account - Resume Builder</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="auth-container">
    <div class="auth-card">
        <div class="auth-visual">
            <h2>Resume Builder</h2>
            <p>Start building resumes that stand out.</p>
        </div>
        <div class="auth-form-wrap">
            <div class="auth-form">
                <h3>Create a new account</h3>
                <% if (errorMessage != null) { %>
                    <div class="error-box"><%= errorMessage %></div>
                <% } %>
                <p class="lead">Create an account to save and manage your resumes.</p>
                <form action="register" method="post" autocomplete="off">
                    <div class="field-group full-width">
                        <label for="username">Choose a username</label>
                        <input type="text" id="username" name="username" value="<%= usernameValue != null ? usernameValue : "" %>" required>
                    </div>
                    <div class="field-group full-width">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="field-group full-width">
                        <label for="confirmPassword">Confirm password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    <div class="auth-actions">
                        <a class="auth-link" href="login.jsp">Sign in</a>
                        <button type="submit" class="button primary">Create Account</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
