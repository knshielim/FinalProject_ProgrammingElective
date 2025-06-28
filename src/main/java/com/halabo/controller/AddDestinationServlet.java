package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; // Added for session debugging
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.halabo.util.DatabaseConnection;

@WebServlet("/AddDestinationServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddDestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve form parameters (these come as regular form fields even with multipart)
        String destinationName = request.getParameter("destinationName");
        String caption = request.getParameter("caption");
        String description = request.getParameter("description");

        // Trim inputs to handle accidental spaces
        if (destinationName != null) destinationName = destinationName.trim();
        if (caption != null) caption = caption.trim();
        if (description != null) description = description.trim();

        // Basic validation
        if (destinationName == null || destinationName.isEmpty() ||
            description == null || description.isEmpty()) {
            request.setAttribute("errorMessage", "Destination Name and Description are required.");
            request.setAttribute("messageType", "error"); // Set message type for JSP
            request.getRequestDispatcher("add_destination.jsp").forward(request, response);
            return;
        }

        String imageFileName = null;
        String dbImagePath = null;

        try {
            Part filePart = request.getPart("imageFile");

            // Check if a file was actually uploaded
            if (filePart != null && filePart.getSize() > 0) {
                String originalFileName = filePart.getSubmittedFileName();
                String fileExtension = "";
                int dotIndex = originalFileName.lastIndexOf('.');
                if (dotIndex > 0) {
                    fileExtension = originalFileName.substring(dotIndex);
                }

                // Construct the new file name based on destinationName
                String sanitizedDestinationName = destinationName.replaceAll("[^a-zA-Z0-9_.-]", "_");
                imageFileName = sanitizedDestinationName + "_" + System.currentTimeMillis() + fileExtension;

                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                Path filePath = Paths.get(uploadPath, imageFileName);

                try (InputStream input = filePart.getInputStream()) {
                    Files.copy(input, filePath, StandardCopyOption.REPLACE_EXISTING);
                }

                dbImagePath = "/images/" + imageFileName;
            } else {
                 // Handle case where no file was uploaded but it's required (as per JSP `required` attribute)
                 request.setAttribute("errorMessage", "Image file is required.");
                 request.setAttribute("messageType", "error");
                 request.getRequestDispatcher("add_destination.jsp").forward(request, response);
                 return;
            }

            // --- Database Insertion ---
            try (Connection conn = DatabaseConnection.getConnection()) {
                String sql = "INSERT INTO destinations (name, caption, description, image_path) VALUES (?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, destinationName);
                    stmt.setString(2, caption);
                    stmt.setString(3, description);
                    stmt.setString(4, dbImagePath);

                    int rowsAffected = stmt.executeUpdate();

                    if (rowsAffected > 0) {
                        request.setAttribute("message", "Destination '" + destinationName + "' added successfully!");
                        request.setAttribute("messageType", "success");
                    } else {
                        request.setAttribute("errorMessage", "Failed to add destination to database.");
                        request.setAttribute("messageType", "error");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Database error: " + e.getMessage());
                request.setAttribute("messageType", "error");
            }

        } catch (ServletException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "File upload failed: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (IOException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error saving image file: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An unexpected error occurred: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } finally {
            // Debugging session status before forwarding
            HttpSession session = request.getSession(false); // Get existing session, don't create new
            if (session != null) {
                Boolean isAdminCheck = (Boolean) session.getAttribute("isAdmin");
                System.out.println("DEBUG (AddDestinationServlet): isAdmin in session before forwarding: " + isAdminCheck);
                Object loggedInUser = session.getAttribute("loggedInUser"); // Assuming you store User object
                System.out.println("DEBUG (AddDestinationServlet): loggedInUser in session: " + (loggedInUser != null ? "Present" : "Absent"));
            } else {
                System.out.println("DEBUG (AddDestinationServlet): No session found after processing!");
            }
            request.getRequestDispatcher("add_destination.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("add_destination.jsp");
    }
}