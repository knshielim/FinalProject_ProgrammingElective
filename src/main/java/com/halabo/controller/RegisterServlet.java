package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
// Removed: import java.security.MessageDigest;       // No longer needed
// Removed: import java.security.NoSuchAlgorithmException; // No longer needed
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement; // Still needed for Statement.RETURN_GENERATED_KEYS

import com.halabo.util.DatabaseConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password"); // This will be stored as plain text
        String confirmPassword = request.getParameter("confirm-password");
        String phone = request.getParameter("phone");

        // Input validation (basic)
        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            username == null || username.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty() ||
            confirmPassword == null || confirmPassword.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty()) {
            response.sendRedirect("register.jsp?error=empty_fields");
            return;
        }


        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=password_mismatch");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) { // Connection auto-closes
            // Check for existing user by username or email
            String checkSql = "SELECT COUNT(*) FROM users WHERE username = ? OR email = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) { // checkStmt auto-closes
                checkStmt.setString(1, username);
                checkStmt.setString(2, email);
                try (ResultSet rs = checkStmt.executeQuery()) { // rs auto-closes
                    if (rs.next() && rs.getInt(1) > 0) {
                        response.sendRedirect("register.jsp?error=user_exists");
                        return;
                    }
                }
            }

            // Removed: String hashedPassword = hashPassword(password); // No longer hashing

            String insertSql = "INSERT INTO users (first_name, last_name, username, email, password, phone, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())";
            try (PreparedStatement stmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) { // stmt auto-closes
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, username);
                stmt.setString(4, email);
                stmt.setString(5, password); // Store the plain-text password directly
                stmt.setString(6, phone);

                int result = stmt.executeUpdate();

                if (result > 0) {
                    try (ResultSet generatedKeys = stmt.getGeneratedKeys()) { // generatedKeys auto-closes
                        if (generatedKeys.next()) {
                            int userId = generatedKeys.getInt(1);

                            // Set session with user info upon successful registration
                            HttpSession session = request.getSession();
                            session.setAttribute("userId", userId);
                            session.setAttribute("username", username);
                            session.setAttribute("firstName", firstName);
                            session.setAttribute("lastName", lastName);
                            session.setAttribute("name", firstName + " " + lastName); // Full name for convenience
                            session.setAttribute("email", email);
                            session.setAttribute("phone", phone);
                            session.setAttribute("isLoggedIn", true);
                            
                            // Since this is a new registration, the user is not an admin by default
                            session.setAttribute("isAdmin", false); 
                            
                            response.sendRedirect("profile.jsp"); // Redirect to profile page after successful registration
                            return;
                        }
                    }
                }
            }

            // If we reach here, registration failed for some other reason (e.g., result <= 0)
            response.sendRedirect("register.jsp?error=registration_failed"); 

        } catch (SQLException e) {
            e.printStackTrace(); // Log the actual SQL exception for debugging
            response.sendRedirect("register.jsp?error=database_error");
        }
        // Removed: catch (NoSuchAlgorithmException e) - no hashing means no such exception
    }

    // Removed: The hashPassword method is no longer present

    // You might also want to add a doGet if it's used for displaying the registration form initially
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}