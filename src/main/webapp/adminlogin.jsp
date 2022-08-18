<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=request.getParameter("email");
String pass=request.getParameter("password");
request.getSession().setAttribute( "EMAIL_VIA_LOGIN" , email);
try{
	final String usern = "root";
	final String pasw = "Ansh2514@";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",usern,pasw);
	Statement st=conn.createStatement();
	ResultSet  i =st.executeQuery("SELECT * from admins WHERE email = " + "'" +  email + "'" + " and " + "password = " + "'" + pass + "'"  );
	
	if(i.next()){
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"5; url = admindash.jsp\" /></html>");
		
	}
	else{
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"2; url = admin.jsp\" /><body><b>Wrong Password"
					+ "</b></body></html>");	
	}
	
}
catch(Exception e){
		out.println("ERRORED");
}
%>
</body>
</html>