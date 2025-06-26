package com.halabo.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Simulated login for demo purpose (replace with DB check in production)
	private final String adminUsername = "admin";
	private final String adminPassword = "admin123";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if (username != null && password != null) {
			if (username.equals(adminUsername) && password.equals(adminPassword)) {
				// Redirect to admin dashboard
				response.sendRedirect("admin_dashboard.jsp");
			} else {
				// Regular users go to homepage or booking page (change as needed)
				response.sendRedirect("index.jsp");
			}
		} else {
			// If login fails or input is missing
			response.sendRedirect("login.jsp?error=missing");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Optionally redirect GET to login page
		response.sendRedirect("login.jsp");
	}
}
