package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.halabo.util.DatabaseConnection;

@WebServlet("/GetDestinationImageServlet")
public class GetDestinationImageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr == null) { resp.sendError(400, "Missing id"); return; }
        int id = Integer.parseInt(idStr);

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(
               "SELECT destination_image FROM destinations WHERE id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getBlob("destination_image") != null) {
                resp.setContentType("image/jpeg");
                try (InputStream in = rs.getBinaryStream("destination_image");
                     OutputStream out = resp.getOutputStream()) {
                    byte[] buf = new byte[4096];
                    int r;
                    while ((r = in.read(buf)) != -1) out.write(buf, 0, r);
                }
            } else {
                resp.sendRedirect("images/default_destination.jpg");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("images/default_destination.jpg");
        }
    }
}
