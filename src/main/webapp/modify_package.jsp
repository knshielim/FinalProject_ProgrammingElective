<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    String action = request.getParameter("action");
    String deleteId = request.getParameter("id");
    if ("delete".equals(action) && deleteId != null) {
        try (Connection conn = DatabaseConnection.getConnection()) {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM packages WHERE id = ?");
            ps.setInt(1, Integer.parseInt(deleteId));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("modify_package.jsp");
        return;
    }

    List<Map<String, String>> packages = new ArrayList<>();
    try (Connection conn = DatabaseConnection.getConnection()) {
        String sql = "SELECT p.id, p.package_name, p.image_path, d.destination_name FROM packages p JOIN destinations d ON p.destination_id = d.id ORDER BY p.id ASC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Map<String, String> row = new HashMap<>();
                row.put("id", rs.getString("id"));
                row.put("name", rs.getString("package_name"));
                row.put("destination", rs.getString("destination_name"));
                row.put("image", rs.getString("image_path"));
                packages.add(row);
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error retrieving packages: " + e.getMessage() + "</p>");
    }

    request.setAttribute("packages", packages);
%>

<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>Manage Packages - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" href="styles.css">
	</head>
	<body>
	
		<jsp:include page="header.jsp"/>
		
		<div class="admin-container">
		    <h1>Manage Tour Packages</h1>
		
		    <div class="top-action">
		        <a href="add_package.jsp" class="add-package-btn">+ Add New Package</a>
		    </div>
		
		    <div class="responsive-table">
		        <table class="admin-table">
		            <thead>
		                <tr>
		                    <th>ID</th>
		                    <th>Package Name</th>
		                    <th>Destination</th>
		                    <th>Image</th>
		                    <th class="actions-header">Actions</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:forEach var="pkg" items="${packages}">
		                    <tr>
		                        <td><c:out value="${pkg.id}"/></td>
		                        <td><c:out value="${pkg.name}"/></td>
		                        <td><c:out value="${pkg.destination}"/></td>
		                        <td>
								    <c:choose>
								        <c:when test="${not empty pkg.image}">
								            <img src="${pageContext.request.contextPath}/${pkg.image}" 
											     alt="${pkg.name}"
											     class="thumbnail"
											     data-filename="${pkg.image}"
											     onclick="openImageModal(this)"
											     style="max-width: 90px; height: 60px; object-fit: cover; cursor: pointer;"
											     onerror="this.style.display='none';" />
								        </c:when>
								        <c:otherwise>No image</c:otherwise>
								    </c:choose>
								</td>

		                        <td class="actions-cell">
		                            <a class="edit-btn" href="edit_package.jsp?package_id=${pkg.id}">Edit</a>
		                            <a class="delete-btn" href="modify_package.jsp?action=delete&id=${pkg.id}" onclick="return confirm('Are you sure you want to delete this package?');">Delete</a>
		                        </td>
		                    </tr>
		                </c:forEach>
		            </tbody>
		        </table>
		    </div>
		</div>

		<jsp:include page="footer.jsp"/>
		
		 <div id="imageModal" class="image-modal" onclick="closeImageModal()">
	        <div class="image-modal-content" onclick="event.stopPropagation();">
	            <span class="close-button" onclick="closeImageModal()">&times;</span>
	            <img id="modalImage" src="" alt="Preview">
	            <p id="imageFilename" class="filename-text"></p>
	        </div>
	    </div>
		
	</body>
	<script>
		function openImageModal(img) {
		    const modal = document.getElementById("imageModal");
		    const modalImg = document.getElementById("modalImage");
		    const filename = img.getAttribute("data-filename");
		    const filenameText = document.getElementById("imageFilename");
		
		    modal.style.display = "flex";
		    modalImg.src = img.src;
		    filenameText.textContent = "Filename: " + filename;
		}
		
		function closeImageModal() {
		    document.getElementById("imageModal").style.display = "none";
		}
	</script>
	
</html>
