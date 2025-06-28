package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

import com.halabo.util.DatabaseConnection;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");
        String phone = request.getParameter("phone");

        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=password_mismatch");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            // Check for existing user
            String checkSql = "SELECT COUNT(*) FROM users WHERE username = ? OR email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setString(1, username);
            checkStmt.setString(2, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                response.sendRedirect("register.jsp?error=user_exists");
                return;
            }

            String hashedPassword = hashPassword(password);

            String insertSql = "INSERT INTO users (first_name, last_name, username, email, password, phone, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, username);
            stmt.setString(4, email);
            stmt.setString(5, hashedPassword);
            stmt.setString(6, phone);

            int result = stmt.executeUpdate();

            if (result > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1);

                    // ✅ Set session with all user info
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", userId);
                    session.setAttribute("username", username);
                    session.setAttribute("firstName", firstName);
                    session.setAttribute("lastName", lastName);
                    session.setAttribute("name", firstName + " " + lastName);
                    session.setAttribute("email", email);
                    session.setAttribute("phone", phone);
                    session.setAttribute("isLoggedIn", true);

                    response.sendRedirect("profile.jsp");
                    return;
                }
            }

            response.sendRedirect("register.jsp?error=registration_failed");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=database_error");
        }
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
}
