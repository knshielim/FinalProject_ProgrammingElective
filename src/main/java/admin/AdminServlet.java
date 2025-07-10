package admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("add".equals(action)) {
			String destination = request.getParameter("destination");
			String packageName = request.getParameter("packageName");
			String description = request.getParameter("description");
			int price = Integer.parseInt(request.getParameter("price"));

			response.sendRedirect("admin.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		int id = Integer.parseInt(request.getParameter("id"));

		if ("delete".equals(action)) {
		} else if ("edit".equals(action)) {
		}

		response.sendRedirect("admin.jsp");
	}
}
