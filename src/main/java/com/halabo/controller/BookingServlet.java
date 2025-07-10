package com.halabo.controller;

import com.halabo.util.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        int destinationId = Integer.parseInt(request.getParameter("destination"));
        int packageId = Integer.parseInt(request.getParameter("package"));
        int travelers = Integer.parseInt(request.getParameter("travelers"));
        String travelDateStr = request.getParameter("date");
        String specialRequests = request.getParameter("special-requests");

        double pricePerPerson = 0;
        double totalPrice = 0;

        try (Connection conn = DatabaseConnection.getConnection()) {

            String sqlPrice = "SELECT price FROM packages WHERE id = ?";
            try (PreparedStatement stmtPrice = conn.prepareStatement(sqlPrice)) {
                stmtPrice.setInt(1, packageId);
                ResultSet rs = stmtPrice.executeQuery();
                if (rs.next()) {
                    pricePerPerson = Double.parseDouble(rs.getString("price")); 
                    totalPrice = pricePerPerson * travelers;
                }
            }

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp?redirect=booking");
                return;
            }

            String sql = "INSERT INTO bookings (user_id, package_id, travel_date, number_of_travelers, total_price, special_requests, contact_name, contact_email, contact_phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, userId);
                stmt.setInt(2, packageId);
                stmt.setDate(3, Date.valueOf(travelDateStr));
                stmt.setInt(4, travelers);
                stmt.setDouble(5, totalPrice);
                stmt.setString(6, specialRequests);
                stmt.setString(7, name);
                stmt.setString(8, email);
                stmt.setString(9, phone);

                int result = stmt.executeUpdate();
                if (result > 0) {
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);
                    session.setAttribute("phone", phone);
                    session.setAttribute("destination", destinationId);
                    session.setAttribute("package", packageId);
                    session.setAttribute("travelers", travelers);
                    session.setAttribute("date", travelDateStr);
                    session.setAttribute("total_price", totalPrice);

                    response.sendRedirect("payment.jsp");
                } else {
                    response.sendRedirect("booking.jsp?error=true");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=true");
        }
    }
}
