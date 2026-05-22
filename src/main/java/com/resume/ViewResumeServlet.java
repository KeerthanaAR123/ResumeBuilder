package com.resume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/view-resume")
public class ViewResumeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentUser = (String) request.getSession().getAttribute("username");
        if (currentUser == null || currentUser.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String idx = request.getParameter("idx");
        if (idx == null) {
            response.sendRedirect(request.getContextPath() + "/my-resumes");
            return;
        }

        int index = 0;
        try { index = Integer.parseInt(idx); } catch (NumberFormatException e) { index = 0; }

        var resume = ResumeStore.getInstance().getResume(currentUser, index);
        if (resume == null) {
            response.sendRedirect(request.getContextPath() + "/my-resumes");
            return;
        }

        // copy values to request attributes expected by result.jsp
        for (var en : resume.entrySet()) {
            if (en.getKey().startsWith("_")) continue;
            request.setAttribute(en.getKey(), en.getValue());
        }
        request.setAttribute("resumeTitle", resume.getOrDefault("resumeTitle", "Resume"));
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }
}
