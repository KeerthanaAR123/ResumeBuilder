package com.resume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = safe(request.getParameter("username"));
        String password = safe(request.getParameter("password"));
        String errorMessage = null;

        if (username.isEmpty() || password.isEmpty()) {
            errorMessage = "Please enter both username and password.";
        } else if (!UserStore.getInstance().isValidUser(username, password)) {
            errorMessage = "Invalid username or password.";
        }

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("usernameValue", username);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    private String safe(String value) {
        return value == null ? "" : value.trim();
    }
}
