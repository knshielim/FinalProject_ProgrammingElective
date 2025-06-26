package com.halabo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ModifyDestinationServlet")
public class ModifyDestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection parameters - adjust these to your database
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/halabo_tour";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        String redirectUrl = "modify_destination.jsp";
        
        if ("update".equals(action)) {
            updateDestination(request, response);
        } else if ("delete".equals(action)) {
            deleteDestination(request, response);
        } else {
            response.sendRedirect(redirectUrl + "?status=error");
        }
    }
    
    private void updateDestination(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        
        Connection connection = null;
        PreparedStatement statement = null;
        
        try {
            // Validate input
            if (idStr == null || name == null || location == null || description == null ||
                idStr.trim().isEmpty() || name.trim().isEmpty() || 
                location.trim().isEmpty() || description.trim().isEmpty()) {
                response.sendRedirect("modify_destination.jsp?status=error");
                return;
            }
            
            int id = Integer.parseInt(idStr);
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            
            // Update query
            String sql = "UPDATE destinations SET name = ?, location = ?, description = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, location);
            statement.setString(3, description);
            statement.setInt(4, id);
            
            int rowsUpdated = statement.executeUpdate();
            
            if (rowsUpdated > 0) {
                response.sendRedirect("modify_destination.jsp?status=updated");
            } else {
                response.sendRedirect("modify_destination.jsp?status=error");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify_destination.jsp?status=error");
        } finally {
            // Close resources
            if (statement != null) {
                try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (connection != null) {
                try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
    
    private void deleteDestination(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        String idStr = request.getParameter("id");
        
        Connection connection = null;
        PreparedStatement statement = null;
        
        try {
            // Validate input
            if (idStr == null || idStr.trim().isEmpty()) {
                response.sendRedirect("modify_destination.jsp?status=error");
                return;
            }
            
            int id = Integer.parseInt(idStr);
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            
            // Delete query
            String sql = "DELETE FROM destinations WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            
            int rowsDeleted = statement.executeUpdate();
            
            if (rowsDeleted > 0) {
                response.sendRedirect("modify_destination.jsp?status=deleted");
            } else {
                response.sendRedirect("modify_destination.jsp?status=error");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify_destination.jsp?status=error");
        } finally {
            // Close resources
            if (statement != null) {
                try { statement.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            if (connection != null) {
                try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    }
}