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

import com.halabo.util.DatabaseConnection; // Assuming this utility exists

@WebServlet("/GetPackageImageServlet")
public class GetPackageImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String packageIdStr = request.getParameter("id");
        int packageId = -1;
        
        // --- DEBUGGING START ---
        System.out.println("DEBUG: GetPackageImageServlet received request.");
        System.out.println("DEBUG: Parameter 'id' = " + packageIdStr);
        // --- DEBUGGING END ---

        if (packageIdStr != null && !packageIdStr.isEmpty()) {
            try {
                packageId = Integer.parseInt(packageIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid package ID format: " + packageIdStr);
                // Fall through to default image or error
            }
        }

        // If no valid ID is provided, you might want to try by package_name as a fallback
        // String packageName = request.getParameter("name"); // Uncomment if needed

        byte[] imageBytes = null;
        String contentType = "image/jpeg"; // Default content type

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql;
            PreparedStatement stmt;

            if (packageId != -1) {
                sql = "SELECT package_image, image_path FROM packages WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, packageId);
                System.out.println("DEBUG: Querying package by ID: " + packageId); // DEBUG
            } else {
                // If no ID is provided, you could handle it or send a bad request error
                // For now, redirect to default if no ID
                response.sendRedirect(request.getContextPath() + "/images/default_package.png");
                System.err.println("DEBUG: No valid package ID provided. Redirecting to default."); // DEBUG
                return;
            }

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                imageBytes = rs.getBytes("package_image");
                String storedFilename = rs.getString("image_path"); // Get original filename for type inference

                // --- DEBUGGING START ---
                System.out.println("DEBUG: Package data found for ID: " + packageId);
                if (imageBytes != null) {
                    System.out.println("DEBUG: packageImageBytes length: " + imageBytes.length);
                } else {
                    System.out.println("DEBUG: packageImageBytes is NULL.");
                }
                System.out.println("DEBUG: storedFilename for package: " + storedFilename);
                // --- DEBUGGING END ---

                if (imageBytes != null && imageBytes.length > 0) {
                    // Try to infer content type from filename
                    if (storedFilename != null && storedFilename.contains(".")) {
                        String fileExtension = storedFilename.substring(storedFilename.lastIndexOf(".") + 1).toLowerCase();
                        switch (fileExtension) {
                            case "png":
                                contentType = "image/png";
                                break;
                            case "gif":
                                contentType = "image/gif";
                                break;
                            // Add more cases for other image types if needed
                            default:
                                contentType = "image/jpeg"; // Default to JPEG if unknown
                        }
                    }
                    // --- DEBUGGING START ---
                    System.out.println("DEBUG: Serving package image with Content-Type: " + contentType + " and length: " + imageBytes.length);
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
            System.out.println("DEBUG: No package image data found or imageBytes was null/empty for ID: " + packageId + ". Redirecting to default.");
            // --- DEBUGGING END ---
            // If no image found or imageBytes is null/empty, redirect to a default image
            // Make sure this default_package.png exists in your webapp/images folder
            response.sendRedirect(request.getContextPath() + "/images/default_package.png");

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error retrieving package image for ID " + packageId + ": " + e.getMessage());
            System.out.println("DEBUG: SQL Error for package ID " + packageId + ". Redirecting to default."); // DEBUG
            response.sendRedirect(request.getContextPath() + "/images/default_package.png");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("General error retrieving package image for ID " + packageId + ": " + e.getMessage());
            System.out.println("DEBUG: General Error for package ID " + packageId + ". Redirecting to default."); // DEBUG
            response.sendRedirect(request.getContextPath() + "/images/default_package.png");
        }
    }
}