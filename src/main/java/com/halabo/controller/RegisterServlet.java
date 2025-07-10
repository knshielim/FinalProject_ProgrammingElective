package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
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

        try (Connection conn = DatabaseConnection.getConnection()) { 
            String checkSql = "SELECT COUNT(*) FROM users WHERE username = ? OR email = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) { 
                checkStmt.setString(1, username);
                checkStmt.setString(2, email);
                try (ResultSet rs = checkStmt.executeQuery()) { 
                    if (rs.next() && rs.getInt(1) > 0) {
                        response.sendRedirect("register.jsp?error=user_exists");
                        return;
                    }
                }
            }
            
            String insertSql = "INSERT INTO users (first_name, last_name, username, email, password, phone, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())";
            try (PreparedStatement stmt = conn.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS)) { // stmt auto-closes
                stmt.setString(1, firstName);
                stmt.setString(2, lastName);
                stmt.setString(3, username);
                stmt.setString(4, email);
                stmt.setString(5, password);
                stmt.setString(6, phone);

                int result = stmt.executeUpdate();

                if (result > 0) {
                    try (ResultSet generatedKeys = stmt.getGeneratedKeys()) { 
                        if (generatedKeys.next()) {
                            int userId = generatedKeys.getInt(1);

                            HttpSession session = request.getSession();
                            session.setAttribute("userId", userId);
                            session.setAttribute("username", username);
                            session.setAttribute("firstName", firstName);
                            session.setAttribute("lastName", lastName);
                            session.setAttribute("name", firstName + " " + lastName); 
                            session.setAttribute("email", email);
                            session.setAttribute("phone", phone);
                            session.setAttribute("isLoggedIn", true);
                            
                            session.setAttribute("isAdmin", false); 
                            
                            response.sendRedirect("profile.jsp"); 
                            return;
                        }
                    }
                }
            }

            response.sendRedirect("register.jsp?error=registration_failed"); 

        } catch (SQLException e) {
            e.printStackTrace(); 
            response.sendRedirect("register.jsp?error=database_error");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }
}