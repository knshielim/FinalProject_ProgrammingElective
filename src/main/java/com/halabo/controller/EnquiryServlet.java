package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.halabo.util.DatabaseConnection;

@WebServlet("/enquiry")
public class EnquiryServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String destination = request.getParameter("destination");
        String packageType = request.getParameter("package");
        String message = request.getParameter("message");
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO enquiries (fullname, email, destination, package_type, message, created_at) VALUES (?, ?, ?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullname);
            stmt.setString(2, email);
            stmt.setString(3, destination);
            stmt.setString(4, packageType);
            stmt.setString(5, message);
            
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                response.sendRedirect("enquiry.jsp?success=true");
            } else {
                response.sendRedirect("enquiry.jsp?error=true");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("enquiry.jsp?error=true");
        }
    }
}