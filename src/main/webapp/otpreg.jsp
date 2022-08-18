<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*,java.net.URL,java.net.URLEncoder,javax.net.ssl.HttpsURLConnection" %>

<%
String email = request.getParameter("email");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String uname = request.getParameter("uname");
String number = request.getParameter("number");
String register = request.getParameter("register");
String address = request.getParameter("address");
String password = request.getParameter("password");

request.getSession().setAttribute("EMAIL_VIA_REGISTER", email);
request.getSession().setAttribute("FNAME_VIA_REGISTER", fname);
request.getSession().setAttribute("LNAME_VIA_REGISTER", lname);
request.getSession().setAttribute("UNAME_VIA_REGISTER", uname);
request.getSession().setAttribute("NUMBER_VIA_REGISTER", number);
request.getSession().setAttribute("REGISTER_VIA_REGISTER", register);
request.getSession().setAttribute("ADDRESS_VIA_REGISTER", address);
request.getSession().setAttribute("PASSWORD_VIA_REGISTER", password);



try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
	Statement st = conn.createStatement();
	ResultSet i = st.executeQuery("SELECT * from user2 WHERE pno= " + "'" + number + "'");
	if (i.next()) {
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
		+ "        content=\"50; url = log.html\" /><body><b>Please Login " + "</b></body></html>");
	} else {
		
		
		
		String message="";
		String apikey="NCRQuMI0p4zwKEdlrSP32nUfoJWY8jAcFhLD5vyZxHtgsi7T1bxwSoMjtr3iuK5INUdqRJmDnL4vpVl8";
		Random rnd = new Random();
		int numInt = rnd.nextInt(999999);
		String num =""+numInt;
		request.getSession().setAttribute("OTP", num);
		URL url = null ;
		String myURL="https://www.fast2sms.com/dev/bulkV2?authorization="+apikey+"&variables_values=" +num +"&route=otp&numbers=" +number;
		try {
	        String u = myURL;
	        url = new URL(u);
	    } catch (Exception e) {
	        e.printStackTrace();	
	        
	    }
		HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
		
		try {
			message = URLEncoder.encode(message,"UTF-8");
			
			
		} catch (UnsupportedEncodingException e) {
			
			
			e.printStackTrace();
		}
		
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", "Chrome");
		con.setRequestProperty("cache-control","no-cache");
		int responseCode = con.getResponseCode();
		
		StringBuffer response1 = new StringBuffer();
		BufferedReader br = new BufferedReader (new InputStreamReader(con.getInputStream()));
		
		while(true) {
			String line = br.readLine();
			if(line == null) {
				break;
				
			}
			response1.append(line);
		}
		
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"2; url = otpreg2.jsp\" /><body><b>Enter OTP " + "</b></body></html>");
		
		
		

	}
} catch (Exception e) {
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
	System.out.print(e);
	e.printStackTrace();
}
%>