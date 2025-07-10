package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.halabo.model.User; // Import your User model
import com.halabo.util.DatabaseConnection;

@WebServlet("/viewUsers")
public class ViewUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=" + URLEncoder.encode("Unauthorized access. Please log in as admin.", StandardCharsets.UTF_8));
            return;
        }

        List<User> users = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "SELECT id, first_name, last_name, username, email, phone FROM users ORDER BY username")) {

            try (ResultSet rs = stmt.executeQuery()) { 
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));
                    user.setAdmin(user.getUsername().equals("admin"));
                    
                    users.add(user);
                }
            }

            request.setAttribute("users", users); 
            request.getRequestDispatcher("view_users.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace(); 
            request.setAttribute("message", "Database error: Could not retrieve users. " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("view_users.jsp").forward(request, response);
        }
    }
}