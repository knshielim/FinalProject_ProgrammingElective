package com.halabo.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import com.halabo.model.User;
import com.halabo.util.DatabaseConnection;

@WebServlet("/SavePaymentServlet")
public class SavePaymentServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        
        try {
            User loggedInUser = (User) session.getAttribute("loggedInUser");
            if (loggedInUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            int userId = loggedInUser.getId();

            String packageIdStr = request.getParameter("packageId");
            String travelersStr = request.getParameter("travelers");
            String contactName = request.getParameter("name");
            String contactEmail = request.getParameter("email");
            String contactPhone = request.getParameter("phone");
            String travelDate = request.getParameter("date");
            String paymentMethod = request.getParameter("payment-method");
            String specialRequests = request.getParameter("special_requests");

            if (packageIdStr == null || travelersStr == null || contactName == null || 
                contactEmail == null || contactPhone == null || travelDate == null || 
                paymentMethod == null) {
                request.setAttribute("error", "All required fields must be filled.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }
            
            int packageId;
            int numberOfTravelers;
            
            try {
                packageId = Integer.parseInt(packageIdStr);
                numberOfTravelers = Integer.parseInt(travelersStr);
                
                if (packageId <= 0 || numberOfTravelers <= 0) {
                    throw new NumberFormatException("Invalid values");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid package ID or number of travelers.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            LocalDate parsedDate;
            try {
                parsedDate = LocalDate.parse(travelDate);
                if (parsedDate.isBefore(LocalDate.now())) {
                    request.setAttribute("error", "Travel date cannot be in the past.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                }
            } catch (DateTimeParseException e) {
                request.setAttribute("error", "Invalid date format. Please use YYYY-MM-DD.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            double packagePrice = getPackagePrice(packageId);
            if (packagePrice == -1) {
                request.setAttribute("error", "Package not found.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            double totalPrice = packagePrice * numberOfTravelers;
            
            int bookingId = insertBooking(userId, packageId, travelDate, numberOfTravelers, 
                                        totalPrice, specialRequests, contactName, contactEmail, 
                                        contactPhone, paymentMethod);
            
            if (bookingId > 0) {
                session.setAttribute("bookingId", bookingId);
                session.setAttribute("totalPrice", totalPrice);
                session.setAttribute("travelDate", travelDate);
                session.setAttribute("numberOfTravelers", numberOfTravelers);
                
                response.sendRedirect("confirmation.jsp");
            } else {
                request.setAttribute("error", "Failed to save booking. Please try again.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An unexpected error occurred: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private double getPackagePrice(int packageId) {
        String sql = "SELECT price FROM packages WHERE id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, packageId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("price");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return -1; 
    }
    
    private int insertBooking(int userId, int packageId, String travelDate, int numberOfTravelers,
                             double totalPrice, String specialRequests, String contactName,
                             String contactEmail, String contactPhone, String paymentMethod) {
        
        String sql = "INSERT INTO bookings (user_id, package_id, travel_date, number_of_travelers, " +
                     "total_price, status, special_requests, contact_name, contact_email, " +
                     "contact_phone, payment_method, created_at) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
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
            stmt.setString(11, paymentMethod);
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return -1;
    }

    private boolean isValidEmail(String email) {
        return email != null && email.contains("@") && email.contains(".");
    }
}