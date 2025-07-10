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

        if (destinationIdStr != null && !destinationIdStr.isEmpty()) {
            try {
                destinationId = Integer.parseInt(destinationIdStr);
            } catch (NumberFormatException e) {
                System.err.println("Invalid destination ID format: " + destinationIdStr);
            }
        }

        String destinationName = request.getParameter("name"); 

        byte[] imageBytes = null;
        String contentType = "image/jpeg"; 

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql;
            PreparedStatement stmt;

            if (destinationId != -1) {
                sql = "SELECT destination_image, image_path FROM destinations WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, destinationId);
            } else if (destinationName != null && !destinationName.isEmpty()) {
                sql = "SELECT destination_image, image_path FROM destinations WHERE destination_name = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, destinationName);
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing destination ID or Name.");
                return;
            }

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                imageBytes = rs.getBytes("destination_image");
                String storedFilename = rs.getString("image_path");

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
            response.sendRedirect(request.getContextPath() + "/images/default_destination.png");

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error retrieving destination image: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/images/default_destination.png");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("General error retrieving destination image: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/images/default_destination.png");
        }
    }
}