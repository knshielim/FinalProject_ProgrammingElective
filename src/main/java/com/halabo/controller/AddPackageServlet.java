package com.halabo.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Servlet mapping
@WebServlet("/AddPackageServlet")
public class AddPackageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddPackageServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String destination = request.getParameter("destination");
        String packageName = request.getParameter("packageName");
        String duration = request.getParameter("duration");
        String hotel = request.getParameter("hotel");
        String price = request.getParameter("price");
        String description = request.getParameter("description");

        // You can replace this block with your DB logic
        System.out.println("New Package Added:");
        System.out.println("Destination: " + destination);
        System.out.println("Package Name: " + packageName);
        System.out.println("Duration: " + duration);
        System.out.println("Hotel: " + hotel);
        System.out.println("Price: " + price);
        System.out.println("Description: " + description);

        // Redirect to a confirmation or admin home page
        response.sendRedirect("admin_dashboard.jsp");
    }
}
