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

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO contacts (name, email, message, created_at) VALUES (?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);
            
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                response.sendRedirect("contact.jsp?success=true");
            } else {
                response.sendRedirect("contact.jsp?error=true");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?error=true");
        }
    }
}