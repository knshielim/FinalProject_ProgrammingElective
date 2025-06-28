<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.halabo.util.DatabaseConnection" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

List<JsonObject> destinationsList = new ArrayList<>();
Gson gson = new Gson();

// Use try-with-resources for the Connection to ensure it's closed
try (Connection conn = DatabaseConnection.getConnection()) {

    // Fetch Destinations
    String destSql = "SELECT id, destination_name FROM destinations ORDER BY destination_name";
    try (PreparedStatement destStmt = conn.prepareStatement(destSql);
         ResultSet destRs = destStmt.executeQuery()) {

        while (destRs.next()) {
            JsonObject destinationJson = new JsonObject();
            int destinationId = destRs.getInt("id");
            destinationJson.addProperty("id", destinationId);
            destinationJson.addProperty("name", destRs.getString("destination_name"));

            // Fetch Packages for each Destination
            JsonArray packagesArray = new JsonArray();
            String packageSql = "SELECT id, package_name FROM packages WHERE destination_id = ? ORDER BY package_name";
            try (PreparedStatement packageStmt = conn.prepareStatement(packageSql)) { // Use try-with-resources for packageStmt
                packageStmt.setInt(1, destinationId);
                try (ResultSet packageRs = packageStmt.executeQuery()) { // Use try-with-resources for packageRs
                    while (packageRs.next()) {
                        JsonObject packageJson = new JsonObject();
                        packageJson.addProperty("id", packageRs.getInt("id"));
                        packageJson.addProperty("name", packageRs.getString("package_name"));
                        packagesArray.add(packageJson);
                    }
                }
            }
            destinationJson.add("packages", packagesArray);
            destinationsList.add(destinationJson);
        }
    }

    // Output the JSON
    out.print(gson.toJson(destinationsList));

} catch (SQLException e) {
    // Log the error to console/logs for debugging
    System.err.println("SQL Error in api_data.jsp: " + e.getMessage());
    e.printStackTrace();
    // Send an empty JSON array or an error JSON to the client to prevent JS errors
    out.print("[]"); // Sending empty array is safer for client-side JS parsing
    // You might also want to set a HTTP status code for error
    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // HTTP 500
}
// Connection is automatically closed by try-with-resources
%>