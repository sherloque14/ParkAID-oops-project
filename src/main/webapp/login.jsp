<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.sql.Connection,java.sql.DriverManager,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login portal</title>
</head>
<body>
	<%
	String pno=request.getParameter("pno");
	String pass=request.getParameter("password");
	request.getSession().setAttribute("PHONE_VIA_LOGIN" , pno);
	try{
		//Class.forName("com.mysql.jdbc.Driver");
		final String usern = "root";
		final String pasw = "Ansh2514@";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",usern,pasw);
		Statement st=conn.createStatement();
		ResultSet  i =st.executeQuery("SELECT * from user2 WHERE pno = " + "'" +  pno + "'" + " and " + "password = " + "'" + pass + "'"  );
		

		if (i.next()) {
			out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"2; url = userdash.jsp\" /><body><b>" + "</b></body></html>");

		} else {
			out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"2; url = log.html\" /><body><b>Phone Number or Password incorrect" + "</b></body></html>");
		}
		
	}
	catch(Exception e){
			out.println(e);
	}

	%>
</body>
</html>