package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

import com.halabo.util.DatabaseConnection;

@WebServlet("/GetProfileImageServlet")
public class GetProfileImageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        if (username == null || username.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing username");
            return;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT profile_image FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            ResultSet rs = stmt.executeQuery();

            if (rs.next() && rs.getBytes("profile_image") != null) {
                byte[] imageBytes = rs.getBytes("profile_image");

                response.setContentType("image/jpeg");
                response.setContentLength(imageBytes.length);

                try (OutputStream os = response.getOutputStream()) {
                    os.write(imageBytes);
                    os.flush();
                }
            } else {
                // Redirect to default image if user has no image
                response.sendRedirect("images/default_profile.png");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("images/default_profile.png");
        }
    }
}
