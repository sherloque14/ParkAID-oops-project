<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
	out.println("Logging you out");
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
	
	request.getSession().setAttribute("PHONE_VIA_LOGIN","invalidating");
	String test = (String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
	out.println(test);

	
	out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"2; url = home.html\" /><body><b>" + "</b></body></html>");
	
	%>
</body>
</html>