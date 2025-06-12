package com.assignment1.contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    request.setAttribute("name", name);
    request.getRequestDispatcher("confirmation.jsp").forward(request, response);
  }
}

