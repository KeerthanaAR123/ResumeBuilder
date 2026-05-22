package com.resume;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/import-pdf")
@MultipartConfig
public class ImportServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentUser = (String) request.getSession().getAttribute("username");
        if (currentUser == null || currentUser.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        request.getRequestDispatcher("/import.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentUser = (String) request.getSession().getAttribute("username");
        if (currentUser == null || currentUser.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Part filePart = request.getPart("pdfFile");
        String fileName = "";
        if (filePart != null && filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
        }

        // For now, we store a placeholder entry representing the imported file
        Map<String, String> imported = new HashMap<>();
        imported.put("resumeTitle", fileName != null && !fileName.isEmpty() ? fileName : "Imported PDF");
        imported.put("_importedFileName", fileName != null ? fileName : "");
        imported.put("_owner", currentUser);
        imported.put("_createdAt", java.time.Instant.now().toString());

        ResumeStore.getInstance().addResume(currentUser, imported);

        response.sendRedirect(request.getContextPath() + "/my-resumes");
    }
}
