package com.resume;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = safe(request.getParameter("username"));
        String password = safe(request.getParameter("password"));
        String confirmPassword = safe(request.getParameter("confirmPassword"));
        String errorMessage = null;

        if (username.isEmpty() || password.isEmpty() || confirmPassword.isEmpty()) {
            errorMessage = "Please fill in all registration fields.";
        } else if (!password.equals(confirmPassword)) {
            errorMessage = "Passwords do not match.";
        } else if (UserStore.getInstance().exists(username)) {
            errorMessage = "That username is already taken.";
        }

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.setAttribute("usernameValue", username);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        UserStore.getInstance().registerUser(username, password);
        response.sendRedirect(request.getContextPath() + "/login.jsp?registered=true");
    }

    private String safe(String value) {
        return value == null ? "" : value.trim();
    }
}
