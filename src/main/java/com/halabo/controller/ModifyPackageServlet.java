package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import com.halabo.util.DatabaseConnection;

@WebServlet("/ModifyPackageServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class ModifyPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String idStr = request.getParameter("id");
        int packageId = (idStr != null && !idStr.isEmpty()) ? Integer.parseInt(idStr) : 0;

        if ("delete".equals(action)) {
            deletePackage(packageId, request, response);
        } else if ("update".equals(action)) {
            updatePackage(packageId, request, response);
        } else {
            response.sendRedirect("modify_package.jsp?message=Invalid+action.&messageType=error");
        }
    }

    private void deletePackage(int packageId, HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "DELETE FROM packages WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, packageId);
                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    response.sendRedirect("modify_package.jsp?message=Package+deleted+successfully.&messageType=success");
                } else {
                    response.sendRedirect("modify_package.jsp?message=Failed+to+delete+package.&messageType=error");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify_package.jsp?message=Server+error+while+deleting.&messageType=error");
        }
    }

    private void updatePackage(int packageId, HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException {
        String packageName = request.getParameter("packageName");
        String destinationIdStr = request.getParameter("destinationId");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");
        String tourType = request.getParameter("tourType");
        String tourCode = request.getParameter("tourCode");
        String minPeople = request.getParameter("minPeople");
        String itinerary = request.getParameter("itinerary");
        String priceDetails = request.getParameter("priceDetails");
        String hotel = request.getParameter("hotel");
        String remarks = request.getParameter("remarks");

        int destinationId = Integer.parseInt(destinationIdStr);

        Part filePart = request.getPart("imageFile");
        boolean hasNewImage = filePart != null && filePart.getSize() > 0;
        String imagePath = null;

        if (hasNewImage) {
            String originalName = java.nio.file.Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String fileName = System.currentTimeMillis() + "_" + originalName;
            String savePath = request.getServletContext().getRealPath("/images");
            File imageDir = new File(savePath);
            if (!imageDir.exists()) imageDir.mkdirs();
            String filePath = savePath + File.separator + fileName;
            filePart.write(filePath);
            imagePath = "images/" + fileName;
        }

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "UPDATE packages SET destination_id=?, package_name=?, description=?, price=?, duration=?, " +
                         "min_people=?, tour_type=?, tour_code=?, itinerary=?, price_details=?, hotel=?, remarks=?";

            if (hasNewImage) sql += ", image_path=?";
            sql += " WHERE id=?";

            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, destinationId);
                stmt.setString(2, packageName);
                stmt.setString(3, description);
                stmt.setString(4, price);
                stmt.setString(5, duration);
                stmt.setString(6, minPeople);
                stmt.setString(7, tourType);
                stmt.setString(8, tourCode);
                stmt.setString(9, itinerary);
                stmt.setString(10, priceDetails);
                stmt.setString(11, hotel);
                stmt.setString(12, remarks);

                if (hasNewImage) {
                    stmt.setString(13, imagePath);
                    stmt.setInt(14, packageId);
                } else {
                    stmt.setInt(13, packageId);
                }

                int rows = stmt.executeUpdate();
                if (rows > 0) {
                    response.sendRedirect("modify_package.jsp?message=Package+updated+successfully.&messageType=success");
                } else {
                    response.sendRedirect("modify_package.jsp?message=Failed+to+update+package.&messageType=error");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("modify_package.jsp?message=Server+error+while+updating.&messageType=error");
        }
    }
}
