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
import com.halabo.util.DatabaseConnection;

@WebServlet("/addPackage")
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
            request.setAttribute("message", "Error loading destinations: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("add_package.jsp").forward(request, response);
        } finally {
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
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

        int destinationId = -1;
        try {
            destinationId = Integer.parseInt(request.getParameter("destinationId"));
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid Destination ID.");
            request.setAttribute("messageType", "error");
            doGet(request, response); // Go back to the form with error
            return;
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

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO packages (destination_id, package_name, image_path, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
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

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                request.setAttribute("message", "Package '" + packageName + "' added successfully!");
                request.setAttribute("messageType", "success");
            } else {
                request.setAttribute("message", "Failed to add package. Please try again.");
                request.setAttribute("messageType", "error");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            String errorMessage = "Database error: " + e.getMessage();
            if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("package_name")) {
                errorMessage = "Package name '" + packageName + "' already exists for this destination. Please choose a different name.";
            } else if (e.getMessage().contains("Cannot add or update a child row")) {
                 errorMessage = "Error: Selected Destination does not exist. Please try again or add a new Destination first.";
            }
            request.setAttribute("message", errorMessage);
            request.setAttribute("messageType", "error");
        } finally {
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        // After processing, forward back to the add_package.jsp to display message and re-populate dropdown
        doGet(request, response); // Re-run doGet to load destinations and forward
    }
}