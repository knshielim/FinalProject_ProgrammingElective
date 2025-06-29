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
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB - Threshold for storing in memory vs disk
                 maxFileSize = 1024 * 1024 * 10,      // 10MB - Max file size (10MB)
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB - Max request size
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

        // Basic input validation
        if (destinationName == null || destinationName.isEmpty() ||
            description == null || description.isEmpty()) {
            request.setAttribute("message", "Destination Name and Description are required.");
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher(targetPage).forward(request, response);
            return;
        }

        Part filePart = null;
        InputStream imageInputStream = null;

        Connection conn = null; // Declare connection outside try-with-resources for rollback in catch blocks
        try {
            conn = DatabaseConnection.getConnection(); // Get database connection
            conn.setAutoCommit(false); // Start transaction for consistency

            // --- 1. Check for existing destination name ---
            try (PreparedStatement checkStmt = conn.prepareStatement("SELECT COUNT(*) FROM destinations WHERE destination_name = ?")) {
                checkStmt.setString(1, destinationName);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    request.setAttribute("message", "Destination with name '" + destinationName + "' already exists. Please choose a different name.");
                    request.setAttribute("messageType", "error");
                    request.getRequestDispatcher(targetPage).forward(request, response);
                    return; // Exit if name exists
                }
            }

            // --- 2. Handle File Upload (get InputStream for BLOB) ---
            filePart = request.getPart("imageFile"); // Get the file part from the multipart request

            if (filePart == null || filePart.getSize() == 0) {
                request.setAttribute("message", "Image file is required.");
                request.setAttribute("messageType", "error");
                request.getRequestDispatcher(targetPage).forward(request, response);
                System.out.println("DEBUG: No file part or file is empty (filePart.getSize() == 0)."); // ADDED DEBUG
                return; // Exit if no file uploaded
            }

            // --- ADDED DEBUGGING STATEMENTS HERE ---
            String uploadedFileName = filePart.getSubmittedFileName();
            long uploadedFileSize = filePart.getSize();
            
            System.out.println("DEBUG: Uploaded file name: " + uploadedFileName);
            System.out.println("DEBUG: Uploaded file size: " + uploadedFileSize + " bytes");
            // --- END ADDED DEBUGGING ---

            imageInputStream = filePart.getInputStream(); // Get the InputStream for the image data

            // --- MORE ADDED DEBUGGING ---
            // Note: imageInputStream.available() might not always represent the full size for large streams,
            // but for typical web uploads, it's often close to the actual size at this point.
            System.out.println("DEBUG: Before setBlob: InputStream available bytes: " + imageInputStream.available());
            // --- END MORE ADDED DEBUGGING ---

            // --- 3. Database Insertion ---
            String sql = "INSERT INTO destinations (destination_name, caption, description, destination_image) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, destinationName);
                stmt.setString(2, caption);
                stmt.setString(3, description);
                stmt.setBlob(4, imageInputStream);

                int rowsAffected = stmt.executeUpdate();
                System.out.println("DEBUG: Database rows affected: " + rowsAffected);

                if (rowsAffected > 0) {
                    conn.commit(); // Commit the transaction if successful
                    request.setAttribute("message", "Destination '" + destinationName + "' added successfully!");
                    request.setAttribute("messageType", "success");
                } else {
                    conn.rollback(); // Rollback if no rows affected
                    request.setAttribute("message", "Failed to add destination to database (0 rows affected).");
                    request.setAttribute("messageType", "error");
                }
            }
        } catch (SQLException e) {
            // Handle SQL errors, rollback transaction
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
            // Handle I/O errors (e.g., problems reading the uploaded file)
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
            // Handle servlet-specific errors (e.g., MultipartConfig issues, getPart() failure)
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
            // Catch any other unexpected exceptions
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
            // Close the InputStream if it was opened
            if (imageInputStream != null) {
                try {
                    imageInputStream.close();
                } catch (IOException e) {
                    System.err.println("Failed to close image input stream: " + e.getMessage());
                }
            }
            // Close the database connection in a finally block
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close database connection: " + e.getMessage());
                }
            }
            // Always forward back to the add_destination.jsp to display messages
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