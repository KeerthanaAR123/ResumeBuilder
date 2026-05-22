package com.resume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/my-resumes")
public class MyResumesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentUser = (String) request.getSession().getAttribute("username");
        if (currentUser == null || currentUser.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        request.setAttribute("resumes", ResumeStore.getInstance().getResumes(currentUser));
        request.getRequestDispatcher("/my-resumes.jsp").forward(request, response);
    }
}
