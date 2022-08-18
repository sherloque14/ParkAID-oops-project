<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.sql.Connection,java.sql.DriverManager,java.util.*"%>
<%@ page import="java.io.*" %> 
<%
String str = (String)request.getSession().getAttribute("OTP");
String str_verify = request.getParameter("OTP2");
if(str.equals(str_verify)){
	String email=(String)request.getSession().getAttribute("EMAIL_VIA_REGISTER");
	String fname=(String)request.getSession().getAttribute("FNAME_VIA_REGISTER");
	String lname=(String)request.getSession().getAttribute("LNAME_VIA_REGISTER");
	String username=(String)request.getSession().getAttribute("UNAME_VIA_REGISTER");
	String pno=(String)request.getSession().getAttribute("NUMBER_VIA_REGISTER");
	String carno=(String)request.getSession().getAttribute("REGISTER_VIA_REGISTER");
	String address=(String)request.getSession().getAttribute("ADDRESS_VIA_REGISTER");
	String password=(String)request.getSession().getAttribute("PASSWORD_VIA_REGISTER");
	String cpass = password;
	final String usern = "root";
	final String pasw = "Ansh2514@";
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",usern,pasw);
	Statement st=conn.createStatement();
	int i =st.executeUpdate( "INSERT INTO `users`.`user2` (`fname`, `lname`, `username`, `password`, `confirmpassword`, `address`, `email`, `pno`, `carno`,`wallet`) VALUES ('"+ fname +"', '"+ lname +"', '"+username+"', '"+password+"', '"+cpass+"', '"+address+"', '"+email+"', '"+pno+"','"+carno+"', '"+"0"+"');");
	System.out.println(i);
	out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"2; url =log.html\" /><body><b>"
				+ "</b></body></html>"); 
}
else{
	out.println("Wrong OTP generated");
	request.getSession().invalidate();
	request.getSession().setAttribute("OTP","invalidating");
	request.getSession().setAttribute("EMAIL_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("FNAME_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("LNAME_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("UNAME_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("NUMBER_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("REGISTER_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("ADDRESS_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("PASSWORD_VIA_REGISTER","invalidating");
	request.getSession().setAttribute("EMAIL_VIA_LOGIN", "invalidating");

	
	out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"2; url = reg.html\" /><body><b>" + "</b></body></html>");
}
%>