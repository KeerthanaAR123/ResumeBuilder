<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null || username.isEmpty()) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Import PDF</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<div class="page-shell">
    <header class="dashboard-header">
        <div class="dashboard-copy">
            <p class="eyebrow">Import PDF</p>
            <h1>Upload an existing resume</h1>
        </div>
        <div class="header-actions">
            <a class="button secondary" href="index.jsp">Back</a>
        </div>
    </header>

    <div class="form-panel">
        <p>Choose a PDF to import. This app stores a placeholder entry for the uploaded PDF so you can track and edit it later.</p>
        <form action="import-pdf" method="post" enctype="multipart/form-data">
            <div class="field-group full-width">
                <label for="pdfFile">PDF File</label>
                <input type="file" id="pdfFile" name="pdfFile" accept="application/pdf" required>
            </div>
            <div class="form-actions">
                <button class="button primary" type="submit">Upload and Import</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
