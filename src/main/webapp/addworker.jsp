<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String finame     = request.getParameter("fname");
String laname     = request.getParameter("lname");
String user    = request.getParameter("username");
String email    = request.getParameter("email");
String phone    = request.getParameter("pno");
String Pass     = request.getParameter("password");

String CR = (String)request.getParameter("serve1");

if(CR == null){
	CR="0";
}
else{
	CR="1";
}
String CW = (String)request.getParameter("serve2");
//System.out.println(CW);
if(CW == null){
	CW="0";
}
else{
CW="1";	
}
String FR = (String)request.getParameter("serve3");
if(FR== null){
	FR="0";
}
else{
FR="1";	
}

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
	Statement st = conn.createStatement();
	Random rnd = new Random();
	int numInt = rnd.nextInt(5)+1;
	String num =""+numInt;
	Statement st1 = conn.createStatement();
		int i1 = st.executeUpdate(
				"Insert into workers (fname , lname , email, rating , password,username,pno,carrepair,carwash,fuel ) values( " + "'" +  finame + "',"  + "'" + laname + "',"  + "'" + email + "',"+"'"+num+"'," + "'" + Pass + "',"  + "'" + user + "',"  + "'" + phone + "',"  + "'" + CR + "',"  + "'" + CW + "',"  + "'" + FR + "'"  + ")" );
		
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"5; url = admindash.jsp\" /><body><b>Worker added succesfully" + "</b></body></html>");

	
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>