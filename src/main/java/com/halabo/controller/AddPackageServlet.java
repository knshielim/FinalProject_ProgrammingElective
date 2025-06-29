package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig; // REQUIRED for file uploads
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part; // For handling file uploads

import java.io.IOException;
import java.io.InputStream; // For reading file data
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.halabo.model.Destination; // Import Destination model
import com.halabo.util.DatabaseConnection;

@WebServlet("/addPackage")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB - Threshold for storing in memory vs disk
                 maxFileSize = 1024 * 1024 * 10,      // 10MB - Max file size (10MB)
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB - Max request size
public class AddPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Helper method to fetch all destinations (reused from ModifyDestinationServlet pattern)
    private List<Destination> getAllDestinations(Connection conn) throws SQLException {
        List<Destination> destinations = new ArrayList<>();
        String sql = "SELECT id, destination_name FROM destinations ORDER BY destination_name"; // Only need ID and name
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                // Only populate ID and name for the dropdown
                Destination dest = new Destination();
                dest.setId(rs.getInt("id"));
                dest.setName(rs.getString("destination_name"));
                destinations.add(dest);
            }
        }
        return destinations;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Access Control Check ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=unauthorized");
            return;
        }
        // --- End Access Control Check ---

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            List<Destination> destinations = getAllDestinations(conn);
            request.setAttribute("destinations", destinations); // Pass destinations to JSP
            request.getRequestDispatcher("add_package.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("SQL Error loading destinations for add_package.jsp: " + e.getMessage());
            request.setAttribute("message", "Error loading destinations: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("add_package.jsp").forward(request, response);
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); System.err.println("Error closing connection: " + e.getMessage()); }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Access Control Check ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=unauthorized");
            return;
        }
        // --- End Access Control Check ---
        
        String targetPage = "add_package.jsp"; // Define target page for forwarding

        int destinationId = -1;
        try {
            destinationId = Integer.parseInt(request.getParameter("destinationId"));
        } catch (NumberFormatException e) {
            System.err.println("Invalid Destination ID format: " + request.getParameter("destinationId"));
            request.setAttribute("message", "Invalid Destination ID.");
            request.setAttribute("messageType", "error");
            doGet(request, response); // Go back to the form with error and reload destinations
            return;
        }

        String packageName = request.getParameter("packageName");
        // String imagePath = request.getParameter("imagePath"); // REMOVED: No longer using imagePath string
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

        // Basic validation for mandatory fields
        if (packageName == null || packageName.trim().isEmpty() ||
            description == null || description.trim().isEmpty() ||
            destinationId == -1) {
            request.setAttribute("message", "Package Name, Description, and Destination are required.");
            request.setAttribute("messageType", "error");
            doGet(request, response);
            return;
        }


        Part filePart = null;
        InputStream imageInputStream = null;

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false); // Start transaction

            // --- Handle File Upload (get InputStream for BLOB) ---
            filePart = request.getPart("packageImageFile"); // Name of the file input in your JSP form
            
            if (filePart == null || filePart.getSize() == 0) {
                request.setAttribute("message", "Package image file is required.");
                request.setAttribute("messageType", "error");
                conn.rollback(); // Rollback transaction as image is missing
                doGet(request, response); // Go back to the form with error
                return;
            }

            // --- ADDED DEBUGGING STATEMENTS HERE (similar to AddDestinationServlet) ---
            String uploadedFileName = filePart.getSubmittedFileName();
            long uploadedFileSize = filePart.getSize();
            
            System.out.println("DEBUG (AddPackageServlet): Uploaded file name: " + uploadedFileName);
            System.out.println("DEBUG (AddPackageServlet): Uploaded file size: " + uploadedFileSize + " bytes");
            // --- END ADDED DEBUGGING ---

            imageInputStream = filePart.getInputStream();

            // --- MORE ADDED DEBUGGING ---
            System.out.println("DEBUG (AddPackageServlet): Before setBlob: InputStream available bytes: " + imageInputStream.available());
            // --- END MORE ADDED DEBUGGING ---


            // --- Check for existing package name for this destination (optional, but good practice) ---
            // If package names should be unique *per destination*, uncomment and adapt this
            /*
            try (PreparedStatement checkStmt = conn.prepareStatement("SELECT COUNT(*) FROM packages WHERE destination_id = ? AND package_name = ?")) {
                checkStmt.setInt(1, destinationId);
                checkStmt.setString(2, packageName);
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next() && rs.getInt(1) > 0) {
                    request.setAttribute("message", "A package with name '" + packageName + "' already exists for this destination.");
                    request.setAttribute("messageType", "error");
                    conn.rollback();
                    doGet(request, response);
                    return;
                }
            }
            */

            // --- Database Insertion ---
            // SQL query updated: 'image_path' is replaced with 'package_image'
            // and parameter count adjusted.
            String sql = "INSERT INTO packages (destination_id, package_name, package_image, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                int paramIndex = 1;
                stmt.setInt(paramIndex++, destinationId);
                stmt.setString(paramIndex++, packageName);
                stmt.setBlob(paramIndex++, imageInputStream); // SET THE BLOB HERE
                stmt.setString(paramIndex++, price);
                stmt.setString(paramIndex++, duration);
                stmt.setString(paramIndex++, minPeople);
                stmt.setString(paramIndex++, tourType);
                stmt.setString(paramIndex++, tourCode);
                stmt.setString(paramIndex++, description);
                stmt.setString(paramIndex++, itinerary);
                stmt.setString(paramIndex++, priceDetails);
                stmt.setString(paramIndex++, hotel);
                stmt.setString(paramIndex++, remarks);

                int rowsAffected = stmt.executeUpdate();
                System.out.println("DEBUG (AddPackageServlet): Database rows affected: " + rowsAffected);

                if (rowsAffected > 0) {
                    conn.commit(); // Commit the transaction if successful
                    request.setAttribute("message", "Package '" + packageName + "' added successfully!");
                    request.setAttribute("messageType", "success");
                } else {
                    conn.rollback(); // Rollback if no rows affected
                    request.setAttribute("message", "Failed to add package. Please try again.");
                    request.setAttribute("messageType", "error");
                }
            }

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error (AddPackageServlet): " + ex.getMessage());
                }
            }
            e.printStackTrace();
            String errorMessage = "Database error: " + e.getMessage();
            if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("package_name")) {
                 errorMessage = "Package name '" + packageName + "' already exists for this destination. Please choose a different name.";
            } else if (e.getMessage().contains("Cannot add or update a child row")) {
                errorMessage = "Error: Selected Destination does not exist. Please try again or add a new Destination first.";
            }
            System.err.println("SQL Error (AddPackageServlet): " + errorMessage);
            request.setAttribute("message", errorMessage);
            request.setAttribute("messageType", "error");
        } catch (IOException e) {
             if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error (from IO catch, AddPackageServlet): " + ex.getMessage());
                }
            }
            e.printStackTrace();
            System.err.println("FILE I/O ERROR during package upload: " + e.getMessage());
            request.setAttribute("message", "Error reading image file for package upload: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (ServletException e) {
             if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error (from ServletException catch, AddPackageServlet): " + ex.getMessage());
                }
            }
            e.printStackTrace();
            System.err.println("SERVLET CONFIGURATION ERROR (AddPackageServlet): " + e.getMessage());
            request.setAttribute("message", "Server configuration error during package upload: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } catch (Exception e) {
            // Catch any other unexpected exceptions
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error (from general catch, AddPackageServlet): " + ex.getMessage());
                }
            }
            e.printStackTrace();
            System.err.println("UNEXPECTED ERROR (AddPackageServlet): " + e.getMessage());
            request.setAttribute("message", "An unexpected error occurred: " + e.getMessage());
            request.setAttribute("messageType", "error");
        } finally {
            // Close the InputStream if it was opened
            if (imageInputStream != null) {
                try {
                    imageInputStream.close();
                } catch (IOException e) {
                    System.err.println("Failed to close image input stream in AddPackageServlet: " + e.getMessage());
                }
            }
            // Close the database connection in a finally block
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close database connection in AddPackageServlet: " + e.getMessage());
                }
            }
            // Always forward back to the add_package.jsp to display message and re-populate dropdown
            if (!response.isCommitted()) {
                doGet(request, response); // Re-run doGet to load destinations and forward
            }
        }
    }
}