package com.halabo.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Servlet mapping
@WebServlet("/AddDestinationServlet")
public class AddDestinationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AddDestinationServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form parameters
        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String description = request.getParameter("description");

        // You can replace this block with your DB connection logic to insert the destination
        System.out.println("Destination Added:");
        System.out.println("Name: " + name);
        System.out.println("Location: " + location);
        System.out.println("Description: " + description);

        // Redirect to a success or admin home page
        response.sendRedirect("admin_dashboard.jsp"); // or another appropriate page
    }
}
