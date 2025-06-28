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
import java.net.URLEncoder; // For URL encoding parameters
import java.nio.charset.StandardCharsets; // For UTF-8 encoding

import com.halabo.model.Destination; // Import your Destination model
import com.halabo.util.DatabaseConnection;

@WebServlet("/modifyDestination") // This servlet will handle multiple actions for destinations
public class ModifyDestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Helper method to fetch all destinations
    private List<Destination> getAllDestinations(Connection conn) throws SQLException {
        List<Destination> destinations = new ArrayList<>();
        String sql = "SELECT id, destination_name, caption, description, image_path FROM destinations ORDER BY destination_name";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                destinations.add(new Destination(
                    rs.getInt("id"),
                    rs.getString("destination_name"),
                    rs.getString("caption"),
                    rs.getString("description"),
                    rs.getString("image_path")
                ));
            }
        }
        return destinations;
    }

    // Helper method to fetch a single destination by ID
    private Destination getDestinationById(Connection conn, int id) throws SQLException {
        String sql = "SELECT id, destination_name, caption, description, image_path FROM destinations WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Destination(
                        rs.getInt("id"),
                        rs.getString("destination_name"),
                        rs.getString("caption"),
                        rs.getString("description"),
                        rs.getString("image_path")
                    );
                }
            }
        }
        return null; // Destination not found
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Access Control Check ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=" + URLEncoder.encode("Unauthorized access. Please log in as admin.", StandardCharsets.UTF_8));
            return;
        }
        // --- End Access Control Check ---

        String action = request.getParameter("action");
        String destinationIdStr = request.getParameter("id");
        int destinationId = -1;
        if (destinationIdStr != null && !destinationIdStr.isEmpty()) { // Added check for empty string
            try {
                destinationId = Integer.parseInt(destinationIdStr);
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid destination ID format.");
                request.setAttribute("messageType", "error");
                // Log the error but proceed to default list view
                e.printStackTrace();
            }
        }

        // Retrieve messages passed from a redirect (from doPost)
        String urlMessage = request.getParameter("message");
        String urlMessageType = request.getParameter("messageType");
        if (urlMessage != null && urlMessageType != null) {
            request.setAttribute("message", urlMessage);
            request.setAttribute("messageType", urlMessageType);
        }

        try (Connection conn = DatabaseConnection.getConnection()) { // Obtain Connection once
            if ("delete".equals(action)) {
                // Handle DELETE action
                if (destinationId != -1) {
                    String sql = "DELETE FROM destinations WHERE id = ?";
                    try (PreparedStatement stmt = conn.prepareStatement(sql)) { // Use same conn
                        stmt.setInt(1, destinationId);
                        int rowsAffected = stmt.executeUpdate();
                        if (rowsAffected > 0) {
                            request.setAttribute("message", "Destination deleted successfully!");
                            request.setAttribute("messageType", "success");
                        } else {
                            request.setAttribute("message", "Failed to delete destination (not found or database error).");
                            request.setAttribute("messageType", "error");
                        }
                    }
                } else {
                    request.setAttribute("message", "Invalid ID for deletion.");
                    request.setAttribute("messageType", "error");
                }
                // After delete, always show the updated list
                request.setAttribute("destinations", getAllDestinations(conn)); // Use same conn
                request.getRequestDispatcher("modify_destination.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                // Handle EDIT action (when clicking "Edit" from the list)
                if (destinationId != -1) {
                    Destination destinationToEdit = getDestinationById(conn, destinationId); // Use same conn
                    if (destinationToEdit != null) {
                        request.setAttribute("destinationToEdit", destinationToEdit);
                        request.getRequestDispatcher("editDestination.jsp").forward(request, response);
                    } else {
                        // Destination not found
                        request.setAttribute("message", "Destination not found for editing.");
                        request.setAttribute("messageType", "error");
                        request.setAttribute("destinations", getAllDestinations(conn)); // Reload list
                        request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
                    }
                } else {
                    // No ID provided for edit, redirect to list
                    request.setAttribute("message", "No destination ID provided for editing.");
                    request.setAttribute("messageType", "error");
                    request.setAttribute("destinations", getAllDestinations(conn)); // Reload list
                    request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
                }
            } else {
                // Default action: display the list of destinations
                request.setAttribute("destinations", getAllDestinations(conn)); // Use same conn
                request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
        }
        // conn is auto-closed here by try-with-resources
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // --- Access Control Check ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=" + URLEncoder.encode("Unauthorized access. Please log in as admin.", StandardCharsets.UTF_8));
            return;
        }
        // --- End Access Control Check ---

        String action = request.getParameter("action"); // Should be "update" for POST from edit form
        if (!"update".equals(action)) {
            // If not an update action, show error and redirect back to list view
            String message = "Invalid action for POST request.";
            String messageType = "error";
            response.sendRedirect("modifyDestination?message=" + URLEncoder.encode(message, StandardCharsets.UTF_8) + "&messageType=" + URLEncoder.encode(messageType, StandardCharsets.UTF_8));
            return;
        }

        int id = -1;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            String message = "Invalid destination ID for update.";
            String messageType = "error";
            response.sendRedirect("modifyDestination?message=" + URLEncoder.encode(message, StandardCharsets.UTF_8) + "&messageType=" + URLEncoder.encode(messageType, StandardCharsets.UTF_8));
            return;
        }

        String destinationName = request.getParameter("destinationName");
        String caption = request.getParameter("caption");
        String description = request.getParameter("description");
        String imagePath = request.getParameter("imagePath");

        String message = "";
        String messageType = "";

        // Main update logic: Use try-with-resources for Connection and PreparedStatement
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                     "UPDATE destinations SET destination_name = ?, caption = ?, description = ?, image_path = ? WHERE id = ?")) {
            stmt.setString(1, destinationName);
            stmt.setString(2, caption);
            stmt.setString(3, description);
            stmt.setString(4, imagePath);
            stmt.setInt(5, id);

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                message = "Destination '" + destinationName + "' updated successfully!";
                messageType = "success";
            } else {
                message = "Failed to update destination (ID not found or no changes made).";
                messageType = "error";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            message = "Database error: " + e.getMessage();
            if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("destination_name")) {
                message = "Destination name '" + destinationName + "' already exists. Please choose a different name.";
            }
            messageType = "error";
        }
        // conn and stmt are auto-closed here by try-with-resources.

        // After update, redirect back to the list view
        // Pass messages as query parameters for one-time display after redirect
        response.sendRedirect("modifyDestination?message=" + URLEncoder.encode(message, StandardCharsets.UTF_8) + "&messageType=" + URLEncoder.encode(messageType, StandardCharsets.UTF_8));
    }
}