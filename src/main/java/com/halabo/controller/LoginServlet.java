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
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import com.halabo.util.DatabaseConnection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Admin credentials for demo purpose
    private final String adminUsername = "admin";
    private final String adminPassword = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Check for admin login first
        if (username != null && password != null) {
            if (username.equals(adminUsername) && password.equals(adminPassword)) {
                // Admin login successful
                HttpSession session = request.getSession();
                session.setAttribute("isAdmin", true);
                session.setAttribute("username", username);
                response.sendRedirect("admin_dashboard.jsp");
                return;
            }
        }
        
        // Regular user login with database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT id, first_name, last_name, email, phone, password FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                String storedPassword = rs.getString("password");
                String hashedInputPassword = hashPassword(password);
                
                if (storedPassword.equals(hashedInputPassword)) {
                    // Login successful
                    HttpSession session = request.getSession();
                    session.setAttribute("userId", rs.getInt("id"));
                    session.setAttribute("username", username);
                    session.setAttribute("firstName", rs.getString("first_name"));
                    session.setAttribute("lastName", rs.getString("last_name"));
                    session.setAttribute("name", rs.getString("first_name") + " " + rs.getString("last_name"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("phone", rs.getString("phone"));
                    session.setAttribute("isLoggedIn", true);
                    
                    // Check if there's a recent booking for this user
                    String bookingSql = "SELECT destination, package_type, travelers, travel_date FROM bookings WHERE email = ? ORDER BY created_at DESC LIMIT 1";
                    PreparedStatement bookingStmt = conn.prepareStatement(bookingSql);
                    bookingStmt.setString(1, rs.getString("email"));
                    ResultSet bookingRs = bookingStmt.executeQuery();
                    
                    if (bookingRs.next()) {
                        session.setAttribute("destination", bookingRs.getString("destination"));
                        session.setAttribute("package", bookingRs.getString("package_type"));
                        session.setAttribute("travelers", bookingRs.getString("travelers"));
                        session.setAttribute("date", bookingRs.getString("travel_date"));
                    }
                    
                    response.sendRedirect("home.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=invalid_credentials");
                }
            } else {
                response.sendRedirect("login.jsp?error=user_not_found");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=database_error");
        }
    }
    
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Handle logout
        String action = request.getParameter("action");
        
        if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect("login.jsp");
        } else {
            // Optionally redirect GET to login page
            response.sendRedirect("login.jsp");
        }
    }
}