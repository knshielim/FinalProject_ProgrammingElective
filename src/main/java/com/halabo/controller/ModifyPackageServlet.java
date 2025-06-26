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

@WebServlet("/ModifyPackageServlet")
public class ModifyPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection parameters - adjust these to your database
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/halabo_tour";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("update".equals(action)) {
            updatePackage(request, response);
        } else if ("delete".equals(action)) {
            deletePackage(request, response);
        } else {
            response.sendRedirect("modify_package.jsp?status=error");
        }
    }
    
    private void updatePackage(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        String idStr = request.getParameter("id");
        String title = request.getParameter("title");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String duration = request.getParameter("duration");
        String minPeople = request.getParameter("minPeople");
        String tourType = request.getParameter("tourType");
        String tourCode = request.getParameter("tourCode");
        String description = request.getParameter("description");
        String itinerary = request.getParameter("itinerary");
        String priceDetails = request.getParameter("priceDetails");
        String hotel = request.getParameter("hotel");
        String remarks = request.getParameter("remarks");
        
        Connection connection = null;
        PreparedStatement statement = null;
        
        try {
            // Validate input
            if (idStr == null || title == null || image == null || price == null || 
                duration == null || minPeople == null || tourType == null || 
                tourCode == null || description == null || itinerary == null || 
                priceDetails == null || hotel == null || remarks == null ||
                idStr.trim().isEmpty() || title.trim().isEmpty() || 
                image.trim().isEmpty() || price.trim().isEmpty() ||
                duration.trim().isEmpty() || minPeople.trim().isEmpty() ||
                tourType.trim().isEmpty() || tourCode.trim().isEmpty() ||
                description.trim().isEmpty()) {
                response.sendRedirect("modify_package.jsp?status=error");
                return;
            }
            
            int id = Integer.parseInt(idStr);
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            
            // Update query
            String sql = "UPDATE packages SET title = ?, image = ?, price = ?, duration = ?, " +
                        "min_people = ?, tour_type = ?, tour_code = ?, description = ?, " +
                        "itinerary = ?, price_details = ?, hotel = ?, remarks = ? WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, image);
            statement.setString(3, price);
            statement.setString(4, duration);
            statement.setString(5, minPeople);
            statement.setString(6, tourType);
            statement.setString(7, tourCode);
            statement.setString(8, description);
            statement.setString(9, itinerary);
            statement.setString(10, priceDetails);
            statement.setString(11, hotel);
            statement.setString(12, remarks);
            statement.setInt(13, id);
            
            int rowsUpdated = statement.executeUpdate();
            
            if (rowsUpdated > 0) {
                response.sendRedirect("modify_package.jsp?status=updated");
            } else {
                response.sendRedirect("modify_package.jsp?status=error");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify_package.jsp?status=error");
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
    
    private void deletePackage(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        String idStr = request.getParameter("id");
        
        Connection connection = null;
        PreparedStatement statement = null;
        
        try {
            // Validate input
            if (idStr == null || idStr.trim().isEmpty()) {
                response.sendRedirect("modify_package.jsp?status=error");
                return;
            }
            
            int id = Integer.parseInt(idStr);
            
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASSWORD);
            
            // Delete query
            String sql = "DELETE FROM packages WHERE id = ?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            
            int rowsDeleted = statement.executeUpdate();
            
            if (rowsDeleted > 0) {
                response.sendRedirect("modify_package.jsp?status=deleted");
            } else {
                response.sendRedirect("modify_package.jsp?status=error");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify_package.jsp?status=error");
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