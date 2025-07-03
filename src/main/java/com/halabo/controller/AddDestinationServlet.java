package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.halabo.util.DatabaseConnection; // Assuming this utility exists for DB connection

@WebServlet("/AddDestinationServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
                 maxFileSize = 1024 * 1024 * 10,      
                 maxRequestSize = 1024 * 1024 * 50)   
public class AddDestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String targetPage = "add_destination.jsp";
        
        String destinationName = request.getParameter("destinationName");
        String caption = request.getParameter("caption");
        String description = request.getParameter("description");

        if (destinationName != null) destinationName = destinationName.trim();
        if (caption != null) caption = caption.trim();
        if (description != null) description = description.trim();

        if (destinationName == null || destinationName.isEmpty() ||
            description == null || description.isEmpty()) {
            request.setAttribute("message", "Destination Name and Description are required.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher(targetPage).forward(request, response);
            return;
        }

        

        Connection conn = null; 
        try {
            conn = DatabaseConnection.getConnection(); 
            conn.setAutoCommit(false); 

            try (PreparedStatement checkStmt = conn.prepareStatement("SELECT COUNT(*) FROM destinations WHERE destination_name = ?")) {
                checkStmt.setString(1, destinationName);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    request.setAttribute("message", "Destination with name '" + destinationName + "' already exists. Please choose a different name.");
                    request.setAttribute("messageType", "error");
                    request.getRequestDispatcher(targetPage).forward(request, response);
                    return; 
                }
            }

            Part filePart = request.getPart("imageFile");

            if (filePart == null || filePart.getSize() == 0) {
                request.setAttribute("message", "Image file is required.");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher(targetPage).forward(request, response);
                return;
            }

            String originalName = java.nio.file.Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileName = System.currentTimeMillis() + "_" + originalName;


            String savePath = getServletContext().getRealPath("/images");
            java.io.File imageDir = new java.io.File(savePath);
            if (!imageDir.exists()) {
                imageDir.mkdirs();
            }

            String filePath = savePath + java.io.File.separator + fileName;

            filePart.write(filePath);

            String imagePath = "images/" + fileName;

            System.out.println("DEBUG: Uploaded file path: " + filePath);
            System.out.println("DEBUG: Image path stored in DB: " + imagePath);

            String sql = "INSERT INTO destinations (destination_name, caption, description, image_path) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, destinationName);
                stmt.setString(2, caption);
                stmt.setString(3, description);
                stmt.setString(4, imagePath);


                int rowsAffected = stmt.executeUpdate();
                System.out.println("DEBUG: Database rows affected: " + rowsAffected);

                if (rowsAffected > 0) {
                    conn.commit(); 
                    request.setAttribute("message", "Destination '" + destinationName + "' added successfully!");
                    request.setAttribute("messageType", "success");
                } else {
                    conn.rollback();
                    request.setAttribute("message", "Failed to add destination to database (0 rows affected).");
                    request.setAttribute("messageType", "error");
                }
            }
        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error: " + ex.getMessage());
                }
            }
            e.printStackTrace();
            System.err.println("SQL Error: " + e.getMessage());
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (IOException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error (from IO catch): " + ex.getMessage());
                }
            }
            e.printStackTrace();
            System.err.println("FILE I/O ERROR during upload: " + e.getMessage());
            request.setAttribute("message", "Error reading image file for upload: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (ServletException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error (from ServletException catch): " + ex.getMessage());
                }
            }
            e.printStackTrace();
            System.err.println("SERVLET CONFIGURATION ERROR: " + e.getMessage());
            request.setAttribute("message", "Server configuration error during upload: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error (from general catch): " + ex.getMessage());
                }
            }
            e.printStackTrace();
            System.err.println("UNEXPECTED ERROR: " + e.getMessage());
            request.setAttribute("message", "An unexpected error occurred: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close database connection: " + e.getMessage());
                }
            }
            if (!response.isCommitted()) {
                request.getRequestDispatcher(targetPage).forward(request, response);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("add_destination.jsp").forward(request, response);
    }
}