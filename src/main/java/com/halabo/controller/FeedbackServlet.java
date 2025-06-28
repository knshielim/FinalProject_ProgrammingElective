package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.halabo.util.DatabaseConnection;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String feedback = request.getParameter("feedback");

        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "INSERT INTO feedbacks (name, email, feedback, created_at) VALUES (?, ?, ?, NOW())";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, feedback);

            int result = stmt.executeUpdate();

            if (result > 0) {
                response.sendRedirect("feedback.jsp?success=true");
            } else {
                response.sendRedirect("feedback.jsp?error=true");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("feedback.jsp?error=true");
        }
    }
}
