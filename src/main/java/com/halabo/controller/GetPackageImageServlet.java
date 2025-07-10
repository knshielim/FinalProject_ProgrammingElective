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

        if (packageIdStr != null && !packageIdStr.isEmpty()) {
            try {
                packageId = Integer.parseInt(packageIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid package ID format: " + packageIdStr);
            }
        }

        byte[] imageBytes = null;
        String contentType = "image/jpeg"; 

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql;
            PreparedStatement stmt;

            if (packageId != -1) {
                sql = "SELECT package_image, image_path FROM packages WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, packageId);
            } else {
                response.sendRedirect(request.getContextPath() + "/images/default_package.png");
                return;
            }

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                imageBytes = rs.getBytes("package_image");
                String storedFilename = rs.getString("image_path"); 

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
                                contentType = "image/jpeg"; 
                        }
                    }

                    response.setContentType(contentType);
                    response.setContentLength(imageBytes.length);

                    try (OutputStream os = response.getOutputStream()) {
                        os.write(imageBytes);
                        os.flush();
                    }
                    return; 
                }
            }
            response.sendRedirect(request.getContextPath() + "/images/default_package.png");

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error retrieving package image for ID " + packageId + ": " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/images/default_package.png");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("General error retrieving package image for ID " + packageId + ": " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/images/default_package.png");
        }
    }
}