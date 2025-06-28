<%@page import="java.sql.*,com.halabo.util.DatabaseConnection"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<html>
	<head>
		<meta charset="UTF-8">
	    <title>Attractions - Halabo Indonesia Tour</title>
	    <link rel="stylesheet" type="text/css" href="styles.css">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<div class="attractions-grid">
		<%
			try(Connection conn = DatabaseConnection.getConnection();
		    	// Make sure to select your new 'image_path' column here
		    	ResultSet rs = conn.createStatement().executeQuery("SELECT id,destination_name,caption,image_path FROM destinations")) {
		    while(rs.next()) {
		%>
			<div class="attraction-card">
			    <a href="destination.jsp?id=<%=rs.getInt("id")%>">
			    	<img src="<%=rs.getString("image_path")%>" alt="<%=rs.getString("destination_name")%>">
			    </a>
			    <h1><%=rs.getString("destination_name")%></h1>
			    <p><%=rs.getString("caption")%></p>
		    </div>
		<%
				}
			} catch (SQLException e) {
                e.printStackTrace();
                // Optionally display an error message on the page
                out.println("<p>Error loading attractions: " + e.getMessage() + "</p>");
            }
		%>
		 </div>
		 <jsp:include page="footer.jsp"/>
	</body>
</html>