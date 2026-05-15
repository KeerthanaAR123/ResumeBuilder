package com.resume;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/resume")

public class ResumeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String skills = request.getParameter("skills");
        String education = request.getParameter("education");
        String projects = request.getParameter("projects");

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        out.println("<html><body>");

        out.println("<h1>Resume Generated Successfully</h1>");

        out.println("<h2>" + name + "</h2>");

        out.println("<p><b>Email:</b> " + email + "</p>");
        out.println("<p><b>Phone:</b> " + phone + "</p>");
        out.println("<p><b>Skills:</b> " + skills + "</p>");
        out.println("<p><b>Education:</b> " + education + "</p>");
        out.println("<p><b>Projects:</b> " + projects + "</p>");

        out.println("</body></html>");
    }
}