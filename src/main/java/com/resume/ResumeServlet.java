package com.resume;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resume")
public class ResumeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("name", safe(request.getParameter("name")));
        request.setAttribute("resumeTitle", safe(request.getParameter("resumeTitle")));
        request.setAttribute("email", safe(request.getParameter("email")));
        request.setAttribute("phone", safe(request.getParameter("phone")));
        request.setAttribute("linkedin", safe(request.getParameter("linkedin")));
        request.setAttribute("github", safe(request.getParameter("github")));
        request.setAttribute("summary", safe(request.getParameter("summary")));
        request.setAttribute("experience", safe(request.getParameter("experience1")));
        request.setAttribute("college", safe(request.getParameter("college")));
        request.setAttribute("department", safe(request.getParameter("department")));
        request.setAttribute("cgpa", safe(request.getParameter("cgpa")));
        request.setAttribute("programmingSkills", safe(request.getParameter("programmingSkills")));
        request.setAttribute("technicalSkills", safe(request.getParameter("technicalSkills")));
        request.setAttribute("databaseTechnologies", safe(request.getParameter("databaseTechnologies")));
        request.setAttribute("toolsPlatforms", safe(request.getParameter("toolsPlatforms")));
        request.setAttribute("softSkills", safe(request.getParameter("softSkills")));
        request.setAttribute("frameworks", safe(request.getParameter("frameworks")));
        request.setAttribute("projectTitle1", safe(request.getParameter("projectTitle1")));
        request.setAttribute("projectDescription1", safe(request.getParameter("projectDescription1")));
        request.setAttribute("projectTitle2", safe(request.getParameter("projectTitle2")));
        request.setAttribute("projectDescription2", safe(request.getParameter("projectDescription2")));
        request.setAttribute("certificationName1", safe(request.getParameter("certificationName1")));
        request.setAttribute("certificationIssuer1", safe(request.getParameter("certificationIssuer1")));
        request.setAttribute("certificationName2", safe(request.getParameter("certificationName2")));
        request.setAttribute("certificationIssuer2", safe(request.getParameter("certificationIssuer2")));

        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    private String safe(String value) {
        return value == null ? "" : value;
    }
}
