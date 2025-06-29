package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.halabo.util.DatabaseConnection;

@WebServlet("/GetDestinationImageServlet")
public class GetDestinationImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String destinationIdStr = request.getParameter("id");
        int destinationId = -1;
        
        // --- DEBUGGING START ---
        System.out.println("DEBUG: GetDestinationImageServlet received request.");
        System.out.println("DEBUG: Parameter 'id' = " + destinationIdStr);
        // --- DEBUGGING END ---

        if (destinationIdStr != null && !destinationIdStr.isEmpty()) {
            try {
                destinationId = Integer.parseInt(destinationIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid destination ID format: " + destinationIdStr);
                // Fall through to default image or error
            }
        }

        String destinationName = request.getParameter("name"); // This parameter is currently not used by your JSP

        byte[] imageBytes = null;
        String contentType = "image/jpeg"; // Default content type

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql;
            PreparedStatement stmt;

            if (destinationId != -1) {
                sql = "SELECT destination_image, image_path FROM destinations WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, destinationId);
                System.out.println("DEBUG: Querying by ID: " + destinationId); // DEBUG
            } else if (destinationName != null && !destinationName.isEmpty()) {
                sql = "SELECT destination_image, image_path FROM destinations WHERE destination_name = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, destinationName);
                System.out.println("DEBUG: Querying by Name: " + destinationName); // DEBUG
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing destination ID or Name.");
                System.err.println("DEBUG: No valid identifier provided. Sending BAD_REQUEST."); // DEBUG
                return;
            }

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                imageBytes = rs.getBytes("destination_image");
                String storedFilename = rs.getString("image_path");

                // --- DEBUGGING START ---
                System.out.println("DEBUG: Data found for ID/Name.");
                if (imageBytes != null) {
                    System.out.println("DEBUG: imageBytes length: " + imageBytes.length);
                } else {
                    System.out.println("DEBUG: imageBytes is NULL.");
                }
                System.out.println("DEBUG: storedFilename: " + storedFilename);
                // --- DEBUGGING END ---

                if (imageBytes != null && imageBytes.length > 0) {
                    if (storedFilename != null && storedFilename.contains(".")) {
                        String fileExtension = storedFilename.substring(storedFilename.lastIndexOf(".") + 1).toLowerCase();
                        switch (fileExtension) {
                            case "png":
                                contentType = "image/png";
                                break;
                            case "gif":
                                contentType = "image/gif";
                                break;
                            default:
                                contentType = "image/jpeg"; // Default to JPEG if unknown
                        }
                    }
                    // --- DEBUGGING START ---
                    System.out.println("DEBUG: Serving image with Content-Type: " + contentType + " and length: " + imageBytes.length);
                    // --- DEBUGGING END ---

                    response.setContentType(contentType);
                    response.setContentLength(imageBytes.length);

                    try (OutputStream os = response.getOutputStream()) {
                        os.write(imageBytes);
                        os.flush();
                    }
                    return; // Image sent, so exit
                }
            }
            
            // --- DEBUGGING START ---
            System.out.println("DEBUG: No image data found or imageBytes was null/empty. Redirecting to default.");
            // --- DEBUGGING END ---
            response.sendRedirect(request.getContextPath() + "/images/default_destination.png");

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error retrieving destination image: " + e.getMessage());
            System.out.println("DEBUG: SQL Error. Redirecting to default."); // DEBUG
            response.sendRedirect(request.getContextPath() + "/images/default_destination.png");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("General error retrieving destination image: " + e.getMessage());
            System.out.println("DEBUG: General Error. Redirecting to default."); // DEBUG
            response.sendRedirect(request.getContextPath() + "/images/default_destination.png");
        }
    }
}