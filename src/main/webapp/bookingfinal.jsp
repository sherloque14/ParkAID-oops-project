<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*" %>
<%
int slots=(int)request.getSession().getAttribute("Slots");
String Locate=(String)request.getSession().getAttribute("Location");
String date=(String)request.getSession().getAttribute("date");
int inT=(int)request.getSession().getAttribute("cintime");
int outT=(int)request.getSession().getAttribute("couttime");

String val = (String)request.getParameter("valuePAY");
String promocode="invalid";
promocode = (String)request.getParameter("PROMO");
request.getSession().setAttribute("valuePay",val);
double pay = 0;
pay += 50*(outT-inT)*(Integer.parseInt(val));
String Phone = (String)request.getSession().getAttribute("PHONE_VIA_LOGIN");
if(Phone==null){	
Phone = (String)request.getSession().getAttribute("NUMBER_VIA_REGISTER");	
}


String Cr = (String)request.getParameter("CR");

if(Cr == null){
	Cr="0";
}
else{
pay+=	500;
}
String CW = (String)request.getParameter("CW");
//System.out.println(CW);
if(CW == null){
	CW="0";
}
else{
pay+= 100;	
}
String FR = (String)request.getParameter("FR");
if(FR== null){
	FR="0";
}
else{
pay+= 100;	
}
System.out.println(promocode);
if(promocode==null){
	System.out.println("Promo not entered");
}
else{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn4 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
	Statement st4=conn4.createStatement();
	ResultSet  i4 =st4.executeQuery("SELECT * from offers where pno = '"+Phone+"'");
		
		if(i4.next()){
		String locate = i4.getString("promocode");
		System.out.println(locate);
		if(locate.equals(promocode)){
			pay*=0.8;
			Connection conn5 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
			Statement st5=conn5.createStatement();
			int i5 = st5.executeUpdate(
					"Delete from offers where pno = " + "'" +  Phone + "'" );
			}
			
		}
		
	
}
out.println(pay);
Random rnd = new Random();
int numInt = rnd.nextInt(999999);
String num =""+numInt;
%>

<!--

=========================================================
* Now UI Dashboard - v1.5.0
=========================================================

* Product Page: https://www.creative-tim.com/product/now-ui-dashboard
* Copyright 2019 Creative Tim (http://www.creative-tim.com)

* Designed by www.invisionapp.com Coded by www.creative-tim.com

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

-->
<!DOCTYPE html>

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="shortcut icon" href="assets/images/favicon-32x32.png" type="image/png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">

    <title>Park With Us</title>
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <h1 class="text-warning">Locations</h1>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse collapse justify-content-end" id="navbarMenu">
                <ul class="navbar-nav d-md-none ">
                    <li class="nav-item">
                        <a class="nav-link text-muted active" href="#">
                            <i class="fas fa-home mr-2"></i>Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item bg-light">
                        <a class="nav-link" href="#">
                            <i class="mr-2 fas fa-list "></i> App
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#">
                            <i class="mr-2 fas fa-envelope-open"></i> MailBOX
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link" href="#">
                            <i class="mr-2 fas fa-desktop"></i> UI Elements
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="mr-2 fas fa-asterisk"></i> UI Elements
                        </a>
                    </li>
                </ul>


                <ul class="navbar-nav">
                    <li class="nav-item mr-2">
                        <a class="nav-link text-muted" href="#">
                            <i class="fas fa-search "></i>
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item mr-2">
                        <a class="nav-link" href="#">
                            <i class="fas fa-bell "></i>
                        </a>
                    </li>
                    <li class="nav-item mr-2">
                        <a class="nav-link" href="#">
                            <i class="fas fa-comment"></i>
                        </a>
                    </li>
                    <li class="nav-item mr-5">
                        <a class="nav-link" href="#">
                            <img src="https://cdn1.iconfinder.com/data/icons/avatar-2-2/512/Manager-512.png" width="30" alt="" class=" img-fluid rounded-circle">
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#signOutModal">
                            <i class="fas fa-sign-out-alt"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <section id="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-2 sidebar d-flex flex-column list-group list-group-flush viewport-max ">
                <a href="#" class="list-group-item list-group-item-action text-center">
                        <img src="assets/images/userd.png" alt="" class="img-fluid rounded-circle mr-2"><%try {
                    						Class.forName("com.mysql.jdbc.Driver");
                    						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "Ansh2514@");
                    						Statement st = conn.createStatement();
                    						String pno =(String)request.getSession().getAttribute("PHONE_VIA_LOGIN");
                    						ResultSet i = st.executeQuery("SELECT * from user2 WHERE pno = " + "'" + pno + "'" );
                    						while(i.next()) {
                    							String str0 = i.getString("username");
                    							out.println(str0);
                    							
                    						}
                    						
                    					}
                    					
                    					catch (Exception e) {
                    						out.println(e);
                    					}%></a>
                
                    <a href="userdash.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-columns mr-2 fa-lg"></i>Dashboard</a>
                    <a href="mybooking.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-calendar-check mr-2 fa-lg"></i></i>My Bookings</a>
                    <a href="waitdash.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-pause-circle mr-2 fa-lg"></i>Waiting List</a>
                    <a href="cashback.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-money-bill-alt mr-2 fa-lg"></i>Special Offer</a>
                    <a href="mywallet.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-wallet mr-2 fa-lg"></i>My Wallet</a>
                    <a href="location.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-car mr-2 fa-lg"></i>Park Car</a>
                       <a href="cancellation.jsp" class="list-group-item list-group-item-action menu-items active">
                        <i class="fas fa-window-close mr-2 fa-lg"></i>Cancel Booking</a>
                    <a href="reviewtype.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-user-edit mr-2 fa-lg"></i>Feedback</a>
                    <div class="list-group-item">
=                    </div>
                    
                </div>
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
	
									
								<h4 class="card-title"><a href="booking1.jsp">PROCEED</a> </h4>
							</div>
							<div class="card-body">
							<% out.println("<h5>Date</h5><h6 >    " +date +  "  </h6><br>"); %>
							<% out.println("<h5>Parking Location</h5><h6 >    " +Locate +  "  </h6><br>"); %>
							<% out.println("<h5>No of slots booked</h5><h6 >    " + val  +  "  </h6><br>"); %>
							<% out.println("<h5>Check In Time</h5><h6 >   " + inT  +  "  hrs </h6><br>"); %>
							<% out.println("<h5>Check Out Time</h5><h6 >    " + outT  +  "  hrs </h6><br>"); %>
							<% out.println("<h5>Paid Amount</h5><h6 >    Rs. " + pay +  "  </h6><br>"); %>
							<% out.println("<h5>Receipt Number</h5><h6 >    " + num +  "  </h6><br>"); %>
							<% out.println("<h5>Phone Number</h5><h6 >    " + Phone +  "  </h6><br>"); %>
							
							<%
							String am="";
							if(Cr.equals("1")){
							out.println("<h5>Car Repair</h5><h6 >   Yes   </h6><br>"); am+="1";
							}
							else{
								am+="0";	
							}
							if(CW.equals("1")){
								out.println("<h5>Car Wash</h5><h6 >   Yes   </h6><br>"); am+="1";
							}
							else{
								am+="0";	
							}
							if(FR.equals("1")){
							out.println("<h5>Fuel Refill</h5><h6 >   Yes   </h6><br>"); am+="1";
							}
							else{
								am+="0";
							}
							
							
							request.getSession().setAttribute("PaymentAmount",pay);
							request.getSession().setAttribute("Amneties",am);
							request.getSession().setAttribute("ID",num);
							%>
							</div>
							Please bring screenshot of the above receipt during parking.
							<a href="location.jsp" style = >&nbsp&nbsp&nbsp&nbsp&nbspCancel Transaction</a>
						</div>
						
						
						
						
					</div>
				
				</div>
			</div>
			
		</div>
	</div>
	<!--   Core JS Files   -->
	<script src="../assets/js/core/jquery.min.js"></script>
	<script src="../assets/js/core/popper.min.js"></script>
	<script src="../assets/js/core/bootstrap.min.js"></script>
	<script src="../assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script src="../assets/js/plugins/chartjs.min.js"></script>
	<!--  Notifications Plugin    -->
	<script src="../assets/js/plugins/bootstrap-notify.js"></script>
	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/now-ui-dashboard.min.js?v=1.5.0"
		type="text/javascript"></script>
	<!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/demo/demo.js"></script>
</body>

</html>