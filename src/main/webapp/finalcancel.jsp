<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

String id   = request.getParameter("ID");
String phone    = (String)request.getSession().getAttribute("PHONE_VIA_LOGIN");
String current = "0";
String curr = "0";



try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
	Statement st3 = conn.createStatement();
	Statement st = conn.createStatement();
	Statement st1 = conn.createStatement();
	Statement st4 = conn.createStatement();
	float t1=0;
	float t2 = 0;
	Statement st5 = conn.createStatement();
		int i1 = st.executeUpdate(
				"Delete from payments where ID = " + "'" + id + "'"  );
		
		ResultSet rs1 = st4.executeQuery("SELECT * FROM payments where ID = " + id);
		out.println("<html><meta http-equiv=\"refresh\" \r\n"
				+ "        content=\"2; url = userdash.jsp\" /><body><b>" + "</b></body></html>");
		Statement st2 = conn.createStatement();
		ResultSet rs = st2.executeQuery("SELECT * FROM user2 where pno = '" + phone+"'");
		ResultSet i5 = st2.executeQuery("SELECT * from user2 where pno = '"+ phone +"'");
		
		if(i5.next()) {
			current = i5.getString("wallet");
			t1 = Float.parseFloat(current);  	
		}
		curr = rs1.getString("amount");
		t2 = Float.parseFloat(curr);
		t1=t1+t2;
					int i2 = st3.executeUpdate(	"Update user2 SET wallet = " + "'" + t1 + "'"  + "WHERE pno = " + "'" + phone + "'"  );
			
			out.println("<html><meta http-equiv=\"refresh\" \r\n"
					+ "        content=\"2; url = userdash.jsp	\" /><body><b>Done" + "</b></body></html>");

		

	
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}
%>