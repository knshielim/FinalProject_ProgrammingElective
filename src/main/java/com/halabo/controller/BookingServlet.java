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
import java.sql.SQLException;
import com.halabo.util.DatabaseConnection;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String destination = request.getParameter("destination");
        String packageType = request.getParameter("package");
        String travelers = request.getParameter("travelers");
        String date = request.getParameter("date");
        String specialRequests = request.getParameter("special-requests");
        
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO bookings (name, email, phone, destination, package_type, travelers, travel_date, special_requests, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, destination);
            stmt.setString(5, packageType);
            stmt.setString(6, travelers);
            stmt.setString(7, date);
            stmt.setString(8, specialRequests);
            
            int result = stmt.executeUpdate();
            
            if (result > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                session.setAttribute("email", email);
                session.setAttribute("phone", phone);
                session.setAttribute("destination", destination);
                session.setAttribute("package", packageType);
                session.setAttribute("travelers", travelers);
                session.setAttribute("date", date);
                
                String redirectURL = "payment.jsp?name=" + java.net.URLEncoder.encode(name, "UTF-8") +
                                   "&email=" + java.net.URLEncoder.encode(email, "UTF-8") +
                                   "&phone=" + java.net.URLEncoder.encode(phone, "UTF-8") +
                                   "&destination=" + java.net.URLEncoder.encode(destination, "UTF-8") +
                                   "&package=" + java.net.URLEncoder.encode(packageType, "UTF-8") +
                                   "&travelers=" + java.net.URLEncoder.encode(travelers, "UTF-8") +
                                   "&date=" + java.net.URLEncoder.encode(date, "UTF-8");
                response.sendRedirect(redirectURL);
            } else {
                response.sendRedirect("booking.jsp?error=true");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=true");
        }
    }
}