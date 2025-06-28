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

@WebServlet("/viewUsers") // Map this servlet to the URL /viewUsers
public class ViewUsersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Access Control Check ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=" + URLEncoder.encode("Unauthorized access. Please log in as admin.", StandardCharsets.UTF_8));
            return;
        }
        // --- End Access Control Check ---

        List<User> users = new ArrayList<>();

        try (Connection conn = DatabaseConnection.getConnection(); // Use try-with-resources
             PreparedStatement stmt = conn.prepareStatement(
                     // Select user details based on your 'users' table schema
                     // Columns: id, first_name, last_name, username, email, phone
                     "SELECT id, first_name, last_name, username, email, phone FROM users ORDER BY username")) {

            try (ResultSet rs = stmt.executeQuery()) { // Use try-with-resources for ResultSet
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setUsername(rs.getString("username"));
                    user.setEmail(rs.getString("email"));
                    user.setPhone(rs.getString("phone"));

                    // Determine isAdmin status. This should match your login servlet's logic.
                    // For example, if 'admin' is the only admin user:
                    user.setAdmin(user.getUsername().equals("admin"));
                    // OR if you add an 'is_admin' boolean column to your DB:
                    // user.setAdmin(rs.getBoolean("is_admin")); // If you add this column later

                    users.add(user);
                }
            }

            request.setAttribute("users", users); // Set the list of users as a request attribute
            request.getRequestDispatcher("view_users.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace(); // Log the SQL error for debugging
            request.setAttribute("message", "Database error: Could not retrieve users. " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("view_users.jsp").forward(request, response);
        }
        // All resources (conn, stmt, rs) are automatically closed by try-with-resources
    }

    // No doPost needed for a simple view operation
}