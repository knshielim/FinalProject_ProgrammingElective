package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import com.halabo.model.Destination;
import com.halabo.util.DatabaseConnection;

@WebServlet("/modifyDestination")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ModifyDestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Helper method to fetch all destinations with enhanced debugging
    private List<Destination> getAllDestinations(Connection conn) throws SQLException {
        List<Destination> destinations = new ArrayList<>();
        
        // Try multiple possible column name variations
        String[] possibleQueries = {
            "SELECT id, destination_name, caption, description, image_path FROM destinations ORDER BY destination_name",
            "SELECT id, name, caption, description, image_path FROM destinations ORDER BY name",
            "SELECT id, destination_name, caption, description, destination_image FROM destinations ORDER BY destination_name",
            "SELECT * FROM destinations ORDER BY id"
        };
        
        SQLException lastException = null;
        
        for (String sql : possibleQueries) {
            try (PreparedStatement stmt = conn.prepareStatement(sql);
                 ResultSet rs = stmt.executeQuery()) {
                
                System.out.println("DEBUG: Executing query: " + sql);
                
                while (rs.next()) {
                    try {
                        // Try different column name combinations
                        int id = rs.getInt("id");
                        String name = getStringFromResultSet(rs, "destination_name", "name");
                        String caption = getStringFromResultSet(rs, "caption");
                        String description = getStringFromResultSet(rs, "description");
                        String imagePath = getStringFromResultSet(rs, "image_path", "destination_image");
                        
                        destinations.add(new Destination(id, name, caption, description, imagePath));
                        System.out.println("DEBUG: Added destination - ID: " + id + ", Name: " + name);
                    } catch (SQLException e) {
                        System.err.println("DEBUG: Error reading row: " + e.getMessage());
                        continue;
                    }
                }
                
                if (!destinations.isEmpty()) {
                    System.out.println("DEBUG: Successfully retrieved " + destinations.size() + " destinations");
                    break; // Success, exit the loop
                } else {
                    System.out.println("DEBUG: Query executed but no results found");
                }
                
            } catch (SQLException e) {
                System.err.println("DEBUG: Query failed: " + sql + " - Error: " + e.getMessage());
                lastException = e;
                continue; // Try next query
            }
        }
        
        // If all queries failed and we have no destinations, throw the last exception
        if (destinations.isEmpty() && lastException != null) {
            System.err.println("DEBUG: All queries failed, throwing last exception");
            throw lastException;
        }
        
        return destinations;
    }
    
    // Helper method to safely get string from ResultSet with fallback column names
    private String getStringFromResultSet(ResultSet rs, String... columnNames) throws SQLException {
        for (String columnName : columnNames) {
            try {
                return rs.getString(columnName);
            } catch (SQLException e) {
                // Column doesn't exist, try next one
                continue;
            }
        }
        return null; // None of the column names worked
    }

    // Helper method to fetch a single destination by ID with enhanced error handling
    private Destination getDestinationById(Connection conn, int id) throws SQLException {
        String[] possibleQueries = {
            "SELECT id, destination_name, caption, description, image_path FROM destinations WHERE id = ?",
            "SELECT id, name, caption, description, image_path FROM destinations WHERE id = ?",
            "SELECT * FROM destinations WHERE id = ?"
        };
        
        for (String sql : possibleQueries) {
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        String name = getStringFromResultSet(rs, "destination_name", "name");
                        String caption = getStringFromResultSet(rs, "caption");
                        String description = getStringFromResultSet(rs, "description");
                        String imagePath = getStringFromResultSet(rs, "image_path", "destination_image");
                        
                        return new Destination(
                            rs.getInt("id"),
                            name,
                            caption,
                            description,
                            imagePath
                        );
                    }
                }
            } catch (SQLException e) {
                System.err.println("DEBUG: Query failed for getDestinationById: " + sql + " - " + e.getMessage());
                continue;
            }
        }
        return null;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("DEBUG: ModifyDestinationServlet doGet called");

        // Access Control Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=" + URLEncoder.encode("Unauthorized access. Please log in as admin.", StandardCharsets.UTF_8));
            return;
        }

        String action = request.getParameter("action");
        String destinationIdStr = request.getParameter("id");
        int destinationId = -1;
        if (destinationIdStr != null && !destinationIdStr.isEmpty()) {
            try {
                destinationId = Integer.parseInt(destinationIdStr);
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid destination ID format.");
                request.setAttribute("messageType", "error");
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

        Connection conn = null;
        try {
            conn = DatabaseConnection.getConnection();
            System.out.println("DEBUG: Database connection established");
            
            // Test database connection and table existence
            try (PreparedStatement testStmt = conn.prepareStatement("SELECT COUNT(*) FROM destinations")) {
                ResultSet testRs = testStmt.executeQuery();
                if (testRs.next()) {
                    int count = testRs.getInt(1);
                    System.out.println("DEBUG: Total destinations in database: " + count);
                }
            } catch (SQLException e) {
                System.err.println("DEBUG: Error testing destinations table: " + e.getMessage());
            }
            
            if ("delete".equals(action)) {
                if (destinationId != -1) {
                    // Try different possible table structures for delete
                    String[] deleteQueries = {
                        "DELETE FROM destinations WHERE id = ?",
                        "DELETE FROM destination WHERE id = ?"
                    };
                    
                    boolean deleteSuccess = false;
                    for (String sql : deleteQueries) {
                        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                            stmt.setInt(1, destinationId);
                            int rowsAffected = stmt.executeUpdate();
                            if (rowsAffected > 0) {
                                request.setAttribute("message", "Destination deleted successfully!");
                                request.setAttribute("messageType", "success");
                                deleteSuccess = true;
                                break;
                            }
                        } catch (SQLException e) {
                            System.err.println("DEBUG: Delete query failed: " + sql + " - " + e.getMessage());
                            continue;
                        }
                    }
                    
                    if (!deleteSuccess) {
                        request.setAttribute("message", "Failed to delete destination (not found or database error).");
                        request.setAttribute("messageType", "error");
                    }
                } else {
                    request.setAttribute("message", "Invalid ID for deletion.");
                    request.setAttribute("messageType", "error");
                }
                
                List<Destination> destinations = getAllDestinations(conn);
                request.setAttribute("destinations", destinations);
                request.getRequestDispatcher("modify_destination.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                if (destinationId != -1) {
                    Destination destinationToEdit = getDestinationById(conn, destinationId);
                    if (destinationToEdit != null) {
                        request.setAttribute("destinationToEdit", destinationToEdit);
                        request.getRequestDispatcher("edit_destination.jsp").forward(request, response);
                    } else {
                        request.setAttribute("message", "Destination not found for editing.");
                        request.setAttribute("messageType", "error");
                        List<Destination> destinations = getAllDestinations(conn);
                        request.setAttribute("destinations", destinations);
                        request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("message", "No destination ID provided for editing.");
                    request.setAttribute("messageType", "error");
                    List<Destination> destinations = getAllDestinations(conn);
                    request.setAttribute("destinations", destinations);
                    request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
                }
            } else {
                // Default action: display the list of destinations
                List<Destination> destinations = getAllDestinations(conn);
                System.out.println("DEBUG: Retrieved " + destinations.size() + " destinations for display");
                request.setAttribute("destinations", destinations);
                request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("DEBUG: Database error in doGet: " + e.getMessage());
            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("modify_destination.jsp").forward(request, response);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close database connection: " + e.getMessage());
                }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Access Control Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=" + URLEncoder.encode("Unauthorized access. Please log in as admin.", StandardCharsets.UTF_8));
            return;
        }

        String action = request.getParameter("action");
        if (!"update".equals(action)) {
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

        // Trim input values
        if (destinationName != null) destinationName = destinationName.trim();
        if (caption != null) caption = caption.trim();
        if (description != null) description = description.trim();

        // Basic validation
        if (destinationName == null || destinationName.isEmpty() ||
            description == null || description.isEmpty()) {
            String message = "Destination Name and Description are required.";
            String messageType = "error";
            response.sendRedirect("modifyDestination?message=" + URLEncoder.encode(message, StandardCharsets.UTF_8) + "&messageType=" + URLEncoder.encode(messageType, StandardCharsets.UTF_8));
            return;
        }

        String message = "";
        String messageType = "";
        Connection conn = null;
        InputStream imageInputStream = null;

        try {
            conn = DatabaseConnection.getConnection();
            conn.setAutoCommit(false);

            // Check for existing destination name (excluding current destination)
            String[] checkQueries = {
                "SELECT COUNT(*) FROM destinations WHERE destination_name = ? AND id != ?",
                "SELECT COUNT(*) FROM destinations WHERE name = ? AND id != ?"
            };
            
            boolean duplicateFound = false;
            for (String checkSql : checkQueries) {
                try (PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
                    checkStmt.setString(1, destinationName);
                    checkStmt.setInt(2, id);
                    ResultSet rs = checkStmt.executeQuery();
                    if (rs.next() && rs.getInt(1) > 0) {
                        duplicateFound = true;
                        break;
                    }
                } catch (SQLException e) {
                    // Try next query if this one fails
                    continue;
                }
            }
            
            if (duplicateFound) {
                message = "Destination with name '" + destinationName + "' already exists. Please choose a different name.";
                messageType = "error";
                response.sendRedirect("modifyDestination?message=" + URLEncoder.encode(message, StandardCharsets.UTF_8) + "&messageType=" + URLEncoder.encode(messageType, StandardCharsets.UTF_8));
                return;
            }

            // Handle file upload
            Part filePart = request.getPart("newImageFile");
            boolean hasNewImage = (filePart != null && filePart.getSize() > 0);

            String[] updateQueries;
            if (hasNewImage) {
                updateQueries = new String[]{
                    "UPDATE destinations SET destination_name = ?, caption = ?, description = ?, destination_image = ? WHERE id = ?",
                    "UPDATE destinations SET name = ?, caption = ?, description = ?, destination_image = ? WHERE id = ?",
                    "UPDATE destinations SET destination_name = ?, caption = ?, description = ?, image_path = ? WHERE id = ?"
                };
            } else {
                updateQueries = new String[]{
                    "UPDATE destinations SET destination_name = ?, caption = ?, description = ? WHERE id = ?",
                    "UPDATE destinations SET name = ?, caption = ?, description = ? WHERE id = ?"
                };
            }

            boolean updateSuccess = false;
            for (String sql : updateQueries) {
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, destinationName);
                    stmt.setString(2, caption);
                    stmt.setString(3, description);
                    
                    if (hasNewImage) {
                        imageInputStream = filePart.getInputStream();
                        stmt.setBlob(4, imageInputStream);
                        stmt.setInt(5, id);
                    } else {
                        stmt.setInt(4, id);
                    }

                    int rowsAffected = stmt.executeUpdate();
                    if (rowsAffected > 0) {
                        conn.commit();
                        message = "Destination '" + destinationName + "' updated successfully!";
                        messageType = "success";
                        updateSuccess = true;
                        break;
                    }
                } catch (SQLException e) {
                    System.err.println("DEBUG: Update query failed: " + sql + " - " + e.getMessage());
                    continue;
                }
            }
            
            if (!updateSuccess) {
                conn.rollback();
                message = "Failed to update destination (ID not found or no changes made).";
                messageType = "error";
            }

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error: " + ex.getMessage());
                }
            }
            e.printStackTrace();
            message = "Database error: " + e.getMessage();
            if (e.getMessage().contains("Duplicate entry") && e.getMessage().contains("destination_name")) {
                message = "Destination name '" + destinationName + "' already exists. Please choose a different name.";
            }
            messageType = "error";
        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    System.err.println("SQL Rollback Error: " + ex.getMessage());
                }
            }
            e.printStackTrace();
            message = "An unexpected error occurred: " + e.getMessage();
            messageType = "error";
        } finally {
            if (imageInputStream != null) {
                try {
                    imageInputStream.close();
                } catch (IOException e) {
                    System.err.println("Failed to close image input stream: " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    System.err.println("Failed to close database connection: " + e.getMessage());
                }
            }
        }

        // Redirect back to the list view
        response.sendRedirect("modifyDestination?message=" + URLEncoder.encode(message, StandardCharsets.UTF_8) + "&messageType=" + URLEncoder.encode(messageType, StandardCharsets.UTF_8));
    }
}