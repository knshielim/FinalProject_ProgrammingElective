package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate; 
import java.util.ArrayList;
import java.util.List;

import com.halabo.model.Booking; 
import com.halabo.util.DatabaseConnection;

@WebServlet("/viewBookings") 
public class ViewBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("isAdmin") == null || !(Boolean)session.getAttribute("isAdmin")) {
            response.sendRedirect("login.jsp?error=unauthorized");
            return;
        }

        List<Booking> bookings = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "SELECT b.id, b.user_id, u.username, b.package_id, p.package_name, " +
                         "b.booking_date, b.travel_date, b.number_of_travelers, b.total_price, " +
                         "b.status, b.special_requests, b.contact_name, b.contact_email, b.contact_phone, " +
                         "b.payment_method " +
                         "FROM bookings b " +
                         "JOIN users u ON b.user_id = u.id " +
                         "JOIN packages p ON b.package_id = p.id " +
                         "ORDER BY b.booking_date DESC"; 

            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                bookings.add(new Booking(
                    rs.getInt("id"),
                    rs.getInt("user_id"),
                    rs.getString("username"),
                    rs.getInt("package_id"),
                    rs.getString("package_name"),
                    rs.getTimestamp("booking_date"),
                    rs.getDate("travel_date") != null ? rs.getDate("travel_date").toLocalDate() : null,
                    rs.getInt("number_of_travelers"),
                    rs.getDouble("total_price"),
                    rs.getString("status"),
                    rs.getString("special_requests"),
                    rs.getString("contact_name"),
                    rs.getString("contact_email"),
                    rs.getString("contact_phone"),
                    rs.getString("payment_method")
                ));
            }

            request.setAttribute("bookings", bookings); 
            request.getRequestDispatcher("view_bookings.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: Could not retrieve bookings. " + e.getMessage());
            request.setAttribute("messageType", "error");
            request.getRequestDispatcher("view_bookings.jsp").forward(request, response);
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }

}