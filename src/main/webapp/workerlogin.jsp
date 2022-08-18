<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<%
	String email = request.getParameter("email");
	String pass = request.getParameter("password");
	request.getSession().setAttribute("EMAIL_VIA_LOGIN", email);
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
		Statement st = conn.createStatement();
		ResultSet i = st.executeQuery(
		"SELECT * from workers WHERE email = " + "'" + email + "'" + " and " + "password = " + "'" + pass + "'");

		if (i.next()) {
			out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"5; url = workerdash.jsp\" /><body><b>" + "</b></body></html>");

		} else {
			out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"5; url = worker.html\" /><body><b>Password Wrong" + "</b></body></html>");
		}

	} catch (Exception e) {
		out.println("ERRORED");
	}
	%>
</body>
</html>