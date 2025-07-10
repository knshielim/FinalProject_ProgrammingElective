package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.halabo.util.DatabaseConnection;

@WebServlet("/UploadProfileImageServlet")
@MultipartConfig(maxFileSize = 16177215)
public class UploadProfileImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        Part filePart = request.getPart("profileImage");

        if (username == null || filePart == null) {
            response.sendRedirect("profile.jsp?error=missing_image");
            return;
        }

        try (InputStream inputStream = filePart.getInputStream();
             Connection conn = DatabaseConnection.getConnection()) {

            String sql = "UPDATE users SET profile_image = ? WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setBlob(1, inputStream);
            stmt.setString(2, username);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("profile.jsp?success=image_uploaded");
            } else {
                response.sendRedirect("profile.jsp?error=upload_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?error=exception");
        }
    }
}