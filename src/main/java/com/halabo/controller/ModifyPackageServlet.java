package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.halabo.model.Destination; // Import Destination model
import com.halabo.model.Package;     // Import your Package model
import com.halabo.util.DatabaseConnection;

@WebServlet("/modifyPackage")
public class ModifyPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Helper method to fetch all packages, including destination name
    private List<Package> getAllPackages(Connection conn) throws SQLException {
        List<Package> packages = new ArrayList<>();
        String sql = "SELECT p.id, p.destination_id, d.destination_name, p.package_name, p.image_path, p.price, " +
                     "p.duration, p.min_people, p.tour_type, p.tour_code, p.description, p.itinerary, " +
                     "p.price_details, p.hotel, p.remarks " +
                     "FROM packages p JOIN destinations d ON p.destination_id = d.id ORDER BY p.package_name";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                // Populate Package object using full constructor
                Package pkg = new Package(
                    rs.getInt("id"),
                    rs.getInt("destination_id"),
                    rs.getString("destination_name"),
                    rs.getString("package_name"),
                    rs.getString("image_path"),
                    rs.getString("price"),
                    rs.getString("duration"),
                    rs.getString("min_people"),
                    rs.getString("tour_type"),
                    rs.getString("tour_code"),
                    rs.getString("description"),
                    rs.getString("itinerary"),
                    rs.getString("price_details"),
                    rs.getString("hotel"),
                    rs.getString("remarks")
                );
                packages.add(pkg);
            }
        }
        return packages;
    }

    // Helper method to fetch a single package by ID, including destination name
    private Package getPackageById(Connection conn, int id) throws SQLException {
        String sql = "SELECT p.id, p.destination_id, d.destination_name, p.package_name, p.image_path, p.price, " +
                     "p.duration, p.min_people, p.tour_type, p.tour_code, p.description, p.itinerary, " +
                     "p.price_details, p.hotel, p.remarks " +
                     "FROM packages p JOIN destinations d ON p.destination_id = d.id WHERE p.id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Populate Package object using full constructor
                    return new Package(
                        rs.getInt("id"),
                        rs.getInt("destination_id"),
                        rs.getString("destination_name"),
                        rs.getString("package_name"),
                        rs.getString("image_path"),
                        rs.getString("price"),
                        rs.getString("duration"),
                        rs.getString("min_people"),
                        rs.getString("tour_type"),
                        rs.getString("tour_code"),
                        rs.getString("description"),
                        rs.getString("itinerary"),
                        rs.getString("price_details"),
                        rs.getString("hotel"),
                        rs.getString("remarks")
                    );
                }
            }
        }
        return null; // Package not found
    }

    // Helper method to fetch all destinations (for dropdowns)
    private List<Destination> getAllDestinationsForDropdown(Connection conn) throws SQLException {
        List<Destination> destinations = new ArrayList<>();
        String sql = "SELECT id, destination_name FROM destinations ORDER BY destination_name";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
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

        String action = request.getParameter("action");
        String packageIdStr = request.getParameter("id");
        int packageId = -1;
        if (packageIdStr != null && !packageIdStr.isEmpty()) { // Also check for empty string
            try {
                packageId = Integer.parseInt(packageIdStr);
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid Package ID format.");
                request.setAttribute("messageType", "error");
                // Log the error but proceed to default list view
                e.printStackTrace();
            }
        }

        // --- Refactored doGet to use a single try-with-resources Connection ---
        try (Connection conn = DatabaseConnection.getConnection()) { // Obtain Connection once
            if ("delete".equals(action)) {
                // Handle DELETE action
                if (packageId != -1) {
                    String sql = "DELETE FROM packages WHERE id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) { // Use same conn
                        stmt.setInt(1, packageId);
                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected > 0) {
                            request.setAttribute("message", "Package deleted successfully!");
                            request.setAttribute("messageType", "success");
                        } else {
                            request.setAttribute("message", "Failed to delete package (not found or database error).");
                            request.setAttribute("messageType", "error");
                        }
                    }
                } else {
                    request.setAttribute("message", "Invalid ID for deletion.");
                    request.setAttribute("messageType", "error");
                }
                // After delete, always show the updated list
                request.setAttribute("packages", getAllPackages(conn)); // Use same conn
                request.getRequestDispatcher("modify_package.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                // Handle EDIT action (when clicking "Edit" from the list)
                if (packageId != -1) {
                    Package packageToEdit = getPackageById(conn, packageId); // Use same conn
                    if (packageToEdit != null) {
                        request.setAttribute("packageToEdit", packageToEdit);
                        request.setAttribute("destinations", getAllDestinationsForDropdown(conn)); // Use same conn
                        request.getRequestDispatcher("editPackage.jsp").forward(request, response);
                    } else {
                        // Package not found
                        request.setAttribute("message", "Package not found for editing.");
                        request.setAttribute("messageType", "error");
                        request.setAttribute("packages", getAllPackages(conn)); // Reload list
                        request.getRequestDispatcher("modify_package.jsp").forward(request, response);
                    }
                } else {
                    // No ID provided for edit, redirect to list
                    request.setAttribute("message", "No package ID provided for editing.");
                    request.setAttribute("messageType", "error");
                    request.setAttribute("packages", getAllPackages(conn)); // Reload list
                    request.getRequestDispatcher("modify_package.jsp").forward(request, response);
                }
            } else {
                // Default action: display the list of packages
                request.setAttribute("packages", getAllPackages(conn)); // Use same conn
                request.getRequestDispatcher("modify_package.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("modify_package.jsp").forward(request, response);
        }
        // conn is auto-closed here by try-with-resources
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

        String action = request.getParameter("action"); // Should be "update" for POST from edit form
        if (!"update".equals(action)) {
            request.setAttribute("message", "Invalid action for POST request.");
            request.setAttribute("messageType", "error");
            // If action is invalid, return to list view (modifyPackage.jsp)
            // Need to pass connections for getAllPackages
            try (Connection conn = DatabaseConnection.getConnection()) {
                request.setAttribute("packages", getAllPackages(conn));
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Database error when trying to display package list after invalid action: " + e.getMessage());
            }
            request.getRequestDispatcher("modify_package.jsp").forward(request, response);
            return;
        }

        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid package ID for update.");
            request.setAttribute("messageType", "error");
            // If ID is invalid, return to list view (modifyPackage.jsp)
            try (Connection conn = DatabaseConnection.getConnection()) {
                request.setAttribute("packages", getAllPackages(conn));
            } catch (SQLException sqlE) {
                sqlE.printStackTrace();
                request.setAttribute("message", "Database error when trying to display package list after invalid ID: " + sqlE.getMessage());
            }
            request.getRequestDispatcher("modify_package.jsp").forward(request, response);
            return;
        }

        int destinationId = -1;
        try {
            destinationId = Integer.parseInt(request.getParameter("destinationId"));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Destination ID for update.");
            request.setAttribute("messageType", "error");
            // Fix: Obtain a connection here using try-with-resources
            try (Connection connForDisplay = DatabaseConnection.getConnection()) {
                request.setAttribute("packageToEdit", getPackageById(connForDisplay, id)); // Pass the managed connection
                request.setAttribute("destinations", getAllDestinationsForDropdown(connForDisplay)); // Pass the managed connection
            } catch (SQLException sqlE) {
                sqlE.printStackTrace(); // Log this secondary error
                request.setAttribute("message", "Database error while preparing form for re-display: " + sqlE.getMessage());
                // messageType is already error
            }
            request.getRequestDispatcher("editPackage.jsp").forward(request, response);
            return; // Exit here, connections will be closed by try-with-resources
        }

        String packageName = request.getParameter("packageName");
        String imagePath = request.getParameter("imagePath");
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

        // Main update logic: Use try-with-resources for Connection and PreparedStatement
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE packages SET destination_id = ?, package_name = ?, image_path = ?, price = ?, " +
                     "duration = ?, min_people = ?, tour_type = ?, tour_code = ?, description = ?, " +
                     "itinerary = ?, price_details = ?, hotel = ?, remarks = ? WHERE id = ?")) {
            stmt.setInt(1, destinationId);
            stmt.setString(2, packageName);
            stmt.setString(3, imagePath);
            stmt.setString(4, price);
            stmt.setString(5, duration);
            stmt.setString(6, minPeople);
            stmt.setString(7, tourType);
            stmt.setString(8, tourCode);
            stmt.setString(9, description);
            stmt.setString(10, itinerary);
            stmt.setString(11, priceDetails);
            stmt.setString(12, hotel);
            stmt.setString(13, remarks);
            stmt.setInt(14, id);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Package '" + packageName + "' updated successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Failed to update package (ID not found or no changes made).");
                request.setAttribute("messageType", "error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            String errorMessage = "Database error: " + e.getMessage();
            if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("package_name")) {
                errorMessage = "Package name '" + packageName + "' already exists for this destination. Please choose a different name.";
            } else if (e.getMessage().contains("Cannot add or update a child row")) {
                 errorMessage = "Error: Selected Destination does not exist. Please try again.";
            }
            request.setAttribute("message", errorMessage);
            request.setAttribute("messageType", "error");
        }
        // conn and stmt are auto-closed here by try-with-resources.

        // After update, redirect back to the list view (modifyPackage.jsp)
        // Using sendRedirect to prevent form resubmission on refresh
        // Pass messages via URL parameters as it's a redirect
        String message = request.getAttribute("message") != null ? request.getAttribute("message").toString() : "";
        String messageType = request.getAttribute("messageType") != null ? request.getAttribute("messageType").toString() : "";

        // Encode parameters to handle spaces and special characters
        response.sendRedirect("modifyPackage?message=" + response.encodeURL(message) + "&messageType=" + response.encodeURL(messageType));
    }
}