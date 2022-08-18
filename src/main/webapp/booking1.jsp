<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*,java.net.URL,java.net.URLEncoder,javax.net.ssl.HttpsURLConnection" %>
<%
double payment =(double)request.getSession().getAttribute("PaymentAmount");
String phone = (String)request.getSession().getAttribute("PHONE_VIA_LOGIN");
if(phone==null){	
phone = (String)request.getSession().getAttribute("NUMBER_VIA_REGISTER");	
}
String current = "0";
double t1=0;
double t2=0;
try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn1 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
	Statement st2 = conn1.createStatement();
	ResultSet i2 = st2.executeQuery("SELECT * from user2 where pno = '"+ phone +"'");
	
	if(i2.next()) {
		current = i2.getString("wallet");
		t1 = Float.parseFloat(current);  
		
		
	}
	t2 = payment;
	if(t1>=t2){
	t1=t1-t2;}
	//else{
		//out.println("<html><meta http-equiv=\"refresh\" \r\n"
			//	+ "        content=\"0; url = http://localhost:8080/carpark/location.jsp\" /><body><b>Not Enough Funds" + "</b></body></html>");
	//}
	
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
	Statement st = conn.createStatement();
	
	Statement st1 = conn.createStatement();
		int i1 = st.executeUpdate(
				"Update user2 SET wallet = " + "'" + t1 + "'"  + "WHERE pno = " + "'" + phone + "'" );
		
		
	
} catch (Exception e) {
	System.out.print(e);
	e.printStackTrace();
}		
%>






<% 
String ID=	(String)request.getSession().getAttribute("ID");
String Phone = (String)request.getSession().getAttribute("NUMBER_VIA_REGISTER");
String am =(String)request.getSession().getAttribute("Amneties");
if(Phone==null){
Phone = (String)request.getSession().getAttribute("PHONE_VIA_LOGIN");	
}
int inT=(int)request.getSession().getAttribute("cintime");
int outT=(int)request.getSession().getAttribute("couttime");
String v = (String)request.getSession().getAttribute("valuePay");;
int slots=(Integer.parseInt(v));
String Locate=(String)request.getSession().getAttribute("Location");
String date=(String)request.getSession().getAttribute("date");

Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
Statement st = conn.createStatement();
int i1 = st.executeUpdate(
"Insert into payments(ID,pno,cintime,couttime,slots,location,date,items,amount ) values(" + "'"
		+ ID + "'," + "'" + Phone + "'," + "'" + inT + "'," + "'" + outT + "'," + "'" + slots
		+ "'," + "'" + Locate + "'," + "'" + date + "'," + "'" + am + "'," +"'"+payment+"'" + ")");

out.println("Payment");


String message="";
String apikey="EM3S9DAuTFZVWxCNRQ0LGUJzlbdqpIca1gmoPyv6tBf4w7kKer8eNBy06h5WIVdgo7s9UjGHpvb2wDXt";
URL url = null ;
String myURL="https://www.fast2sms.com/dev/bulkV2?authorization="+apikey+"&message=Your+payment+of+Rs+"+payment+"+has+been+received.+Payment+ID+="+ID+".+Please+provide+your+valueable+feedback+at+http://localhost:8080/carpark/reviewtype.jsp&language=english&route=q&numbers="+Phone;

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

%>








<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn1 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
Statement st2 = conn1.createStatement();
ResultSet i2 = st2.executeQuery("SELECT * from parkings where location = '"+ Locate +"' and date = '" +date+ "'"  );
int arr[] = new int[11];
if(i2.next()){
arr[0]=i2.getInt("s67");
arr[1]=i2.getInt("s78");
arr[2]=i2.getInt("s89");
arr[3]=i2.getInt("s910");
arr[4]=i2.getInt("s1011");
arr[5]=i2.getInt("s1112");
arr[6]=i2.getInt("s1213");
arr[7]=i2.getInt("s1314");
arr[8]=i2.getInt("s1415");
arr[9]=i2.getInt("s1516");
arr[10]=i2.getInt("s1617");
}

for(int i =0;i<11;i++){
	if(i+6 >=inT && i+6<=outT){
		arr[i]-=slots;
	}
	else{
		
	}
}

Class.forName("com.mysql.jdbc.Driver");
Connection conn3 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
Statement st3 = conn3.createStatement();

Statement st13 = conn3.createStatement();
	int i13 = st3.executeUpdate(
			"Update parkings SET  s67  = " + "'" + arr[0] + "',s78 = "+ "'"+arr[1] +"',s89 ='"+arr[2]+"',s910 = '" + arr[3] +"',s1011 = '" + arr[4]+"',s1112 = '" + arr[5] +"',s1213 = '" + arr[6] +"',s1314 = '" + arr[7] +"',s1415 = "+ "'"+arr[8] +"',s1516 = "+ "'"+arr[9] +"',s1617 = '" + arr[10] +"'" + "WHERE location = " + "'" + Locate + "'and date = '" +date+ "'");
	out.println("<html><meta http-equiv=\"refresh\" \r\n"
			+ "        content=\"1; url = http://localhost:8080/carpark/location.jsp\" /><body><b>" + "</b></body></html>");


%>















