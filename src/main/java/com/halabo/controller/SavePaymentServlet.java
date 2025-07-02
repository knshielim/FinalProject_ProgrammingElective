package com.halabo.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;

import com.halabo.model.User;
import com.halabo.util.DatabaseConnection;

@WebServlet("/SavePaymentServlet")
public class SavePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        try {
        	User loggedInUser = (User) session.getAttribute("loggedInUser");
        	if (loggedInUser == null) {
        	    // User is not logged in
        	    response.sendRedirect("login.jsp");
        	    return;
        	}
        	int userId = loggedInUser.getId();

            int packageId = Integer.parseInt(request.getParameter("packageId"));
            String contactName = request.getParameter("name");
            String contactEmail = request.getParameter("email");
            String contactPhone = request.getParameter("phone");
            String travelDate = request.getParameter("date");
            int numberOfTravelers = Integer.parseInt(request.getParameter("travelers"));
            String paymentMethod = request.getParameter("payment-method");
            String specialRequests = request.getParameter("special_requests");

            // For now use a dummy price. You can fetch it from DB based on packageId
            double totalPrice = 500.00;

            try (Connection conn = DatabaseConnection.getConnection()) {
                String sql = "INSERT INTO bookings (user_id, package_id, travel_date, number_of_travelers, total_price, status, special_requests, contact_name, contact_email, contact_phone) " +
                             "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, userId);
                    stmt.setInt(2, packageId);
                    stmt.setDate(3, Date.valueOf(travelDate));
                    stmt.setInt(4, numberOfTravelers);
                    stmt.setDouble(5, totalPrice);
                    stmt.setString(6, "Pending");
                    stmt.setString(7, specialRequests);
                    stmt.setString(8, contactName);
                    stmt.setString(9, contactEmail);
                    stmt.setString(10, contactPhone);
                    stmt.executeUpdate();
                }
            }

            response.sendRedirect("confirmation.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
