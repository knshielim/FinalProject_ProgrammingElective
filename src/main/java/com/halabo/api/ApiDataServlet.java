package com.halabo.api;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.halabo.util.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/api/data")
public class ApiDataServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonArray destinations = new JsonArray();

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sqlDest = "SELECT id, destination_name FROM destinations ORDER BY destination_name";
            try (PreparedStatement stmtDest = conn.prepareStatement(sqlDest);
                 ResultSet rsDest = stmtDest.executeQuery()) {

                while (rsDest.next()) {
                    JsonObject dest = new JsonObject();
                    int destId = rsDest.getInt("id");
                    dest.addProperty("id", destId);
                    dest.addProperty("name", rsDest.getString("destination_name"));

                    String sqlPkg = "SELECT id, package_name, price FROM packages WHERE destination_id = ?";
                    JsonArray packages = new JsonArray();
                    try (PreparedStatement stmtPkg = conn.prepareStatement(sqlPkg)) {
                        stmtPkg.setInt(1, destId);
                        try (ResultSet rsPkg = stmtPkg.executeQuery()) {
                            while (rsPkg.next()) {
                                JsonObject pkg = new JsonObject();
                                pkg.addProperty("id", rsPkg.getInt("id"));
                                pkg.addProperty("name", rsPkg.getString("package_name"));
                                pkg.addProperty("price", rsPkg.getDouble("price"));
                                packages.add(pkg);
                            }
                        }
                    }
                    dest.add("packages", packages);
                    destinations.add(dest);
                }
            }

            PrintWriter out = response.getWriter();
            out.print(destinations.toString());

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().print("[]");
        }
    }
}
