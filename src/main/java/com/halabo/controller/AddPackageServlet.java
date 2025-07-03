package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.halabo.util.DatabaseConnection;

@WebServlet("/AddPackageServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class AddPackageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String packageName = request.getParameter("packageName");
        int destinationId = Integer.parseInt(request.getParameter("destinationId"));
        String description = request.getParameter("description");
        String itinerary = request.getParameter("itinerary");
        String priceDetails = request.getParameter("priceDetails");
        String hotel = request.getParameter("hotel");
        String remarks = request.getParameter("remarks");
        String tourType = request.getParameter("tourType");
        String tourCode = request.getParameter("tourCode");
        String minPeople = request.getParameter("minPeople");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");

        Part filePart = request.getPart("imageFile");
        InputStream imageInputStream = filePart.getInputStream();
        String originalFileName = java.nio.file.Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String imagePath = "images/" + System.currentTimeMillis() + "_" + originalFileName;

        String realPath = getServletContext().getRealPath("/") + imagePath;
        File imageFile = new File(realPath);
        imageFile.getParentFile().mkdirs();
        filePart.write(realPath);

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO packages (destination_id, package_name, package_image, image_path, price, duration, min_people, tour_type, tour_code, description, itinerary, price_details, hotel, remarks) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, destinationId);
                stmt.setString(2, packageName);
                stmt.setBlob(3, imageInputStream);
                stmt.setString(4, imagePath);
                stmt.setString(5, price);
                stmt.setString(6, duration);
                stmt.setString(7, minPeople);
                stmt.setString(8, tourType);
                stmt.setString(9, tourCode);
                stmt.setString(10, description);
                stmt.setString(11, itinerary);
                stmt.setString(12, priceDetails);
                stmt.setString(13, hotel);
                stmt.setString(14, remarks);

                int result = stmt.executeUpdate();
                request.setAttribute("message", result > 0 ? "Package added successfully!" : "Failed to add package.");
                request.setAttribute("messageType", result > 0 ? "success" : "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        request.getRequestDispatcher("add_package.jsp").forward(request, response);
    }
}
