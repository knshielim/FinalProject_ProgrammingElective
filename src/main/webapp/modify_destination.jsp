<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.halabo.model.Destination, com.halabo.util.DatabaseConnection" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
    List<Destination> destinations = new ArrayList<>();
    try (Connection conn = DatabaseConnection.getConnection()) {
        String sql = "SELECT id, destination_name, caption, description, image_path FROM destinations ORDER BY id ASC";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Destination dest = new Destination(
                    rs.getInt("id"),
                    rs.getString("destination_name"),
                    rs.getString("caption"),
                    rs.getString("description"),
                    rs.getString("image_path")
                );
                destinations.add(dest);
            }
        }
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error retrieving destinations: " + e.getMessage() + "</p>");
        e.printStackTrace();
    }

    request.setAttribute("destinations", destinations);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Destinations - Halabo Indonesia Tour</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="css/admin-destination.css"> <%-- New stylesheet for admin pages --%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="header.jsp"/>

<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
%>

<div class="admin-container">
    <h1>Manage Destinations</h1>

    <div class="top-action">
        <a href="add_destination.jsp" class="add-destination-btn">+ Add New Destination</a>
    </div>

    <c:if test="${not empty message}">
        <div class="form-message ${messageType}">
            <c:out value="${message}" escapeXml="true"/>
        </div>
    </c:if>

    <c:choose>
        <c:when test="${not empty destinations}">
            <div class="responsive-table">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Caption</th>
                            <th>Image</th>
                            <th class="actions-header">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dest" items="${destinations}">
                            <tr>
                                <td><c:out value="${dest.id}"/></td>
                                <td><c:out value="${dest.name}"/></td>
                                <td><c:out value="${dest.caption}"/></td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/${dest.imagePath}"
									     alt="${dest.name}"
									     class="thumbnail"
									     data-filename="${dest.imagePath}"
									     onclick="openImageModal(this)"
									     style="max-width: 90px; height: 60px; object-fit: cover; cursor: pointer;"
									     onerror="this.style.display='none';" />

                                </td>
                                <td class="actions-cell">
                                    <a href="modifyDestination?action=edit&id=${dest.id}" class="edit-btn">Edit</a>
                                    <a href="modifyDestination?action=delete&id=${dest.id}" 
                                       class="delete-btn"
                                       onclick="return confirm('Delete \"${dest.name}\"? This cannot be undone.');">
                                       Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <p class="no-data-message">No destinations found. <a href="add_destination.jsp">Add one now</a>.</p>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="footer.jsp"/>
</body>

<!-- Image Modal -->
<div id="imageModal" class="image-modal" onclick="closeImageModal()">
    <div class="image-modal-content" onclick="event.stopPropagation();">
        <span class="close-button" onclick="closeImageModal()">&times;</span>
        <img id="modalImage" src="" alt="Preview">
        <p id="imageFilename" class="filename-text"></p>
    </div>
</div>

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
