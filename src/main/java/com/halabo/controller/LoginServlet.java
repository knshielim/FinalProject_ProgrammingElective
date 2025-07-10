package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
// Removed: import java.security.MessageDigest;
// Removed: import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.halabo.model.User;
import com.halabo.util.DatabaseConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 

        // Basic input validation
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Username and password cannot be empty.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                 "SELECT id, first_name, last_name, username, email, phone, password FROM users WHERE username = ?")) {
            
            stmt.setString(1, username);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password"); 

                    if (storedPassword.equals(password)) { 
                        System.out.println("DEBUG (LoginServlet): Password MATCHED for user: " + username);
                        HttpSession session = request.getSession();

                        User user = new User();
                        user.setId(rs.getInt("id"));
                        user.setFirstName(rs.getString("first_name"));
                        user.setLastName(rs.getString("last_name"));
                        user.setUsername(rs.getString("username"));
                        user.setEmail(rs.getString("email"));
                        user.setPhone(rs.getString("phone"));

                        boolean isAdmin = username.equals("admin"); 
                        user.setAdmin(isAdmin);

                        session.setAttribute("loggedInUser", user);
                        session.setAttribute("isLoggedIn", true);
                        session.setAttribute("isAdmin", isAdmin);

                        if (isAdmin) {
                            response.sendRedirect("admin_dashboard.jsp");
                        } else {
                            response.sendRedirect("home.jsp");
                        }
                    } else {
                        System.out.println("DEBUG (LoginServlet): Password MISMATCH for user: " + username);
                        request.setAttribute("errorMessage", "Invalid username or password.");
                        request.getRequestDispatcher("login.jsp").forward(request, response);
                    }
                } else {
                    System.out.println("DEBUG (LoginServlet): User NOT found in DB: " + username);
                    request.setAttribute("errorMessage", "Invalid username or password.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "A database error occurred during login. Please try again later.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/login.jsp?message=You have been logged out successfully.&messageType=success");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}