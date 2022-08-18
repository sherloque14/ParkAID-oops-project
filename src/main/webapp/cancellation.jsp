<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*,java.time.LocalDateTime,java.time.format.DateTimeFormatter" %>
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
                        
                    </div>
                    <ul class="list-group">
                    
                </div>
    <div class="main-panel" id="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="">Cancel My Booking</a>
            	<%
					   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
					   LocalDateTime now = LocalDateTime.now();  
					   out.println(dtf.format(now));  
				%>
					
          </div>
         
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
           
            <ul class="navbar-nav">
              	
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="panel-header panel-header-sm">
      </div>
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <div class="card ">
           	 <div class="card-body">
            	<div class="table-responsive">
             	<table class="table">
             		<thead class=" text-primary">
											<th class="text-center">ID</th>
											<th class="text-center">Phone</th>
											
											<th class="text-center">Amount</th>
											
					</thead>
					<tbody>
					<%
					String Phone = (String)request.getSession().getAttribute("NUMBER_VIA_REGISTER");
					if(Phone==null){
						Phone = (String)request.getSession().getAttribute("PHONE_VIA_LOGIN");	
						}
					Class.forName("com.mysql.jdbc.Driver");
            		Connection conn1 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
            		Statement st1=conn1.createStatement();
            		ResultSet  i1 =st1.executeQuery("SELECT * from payments where pno = '" +Phone+ "'" );
            		while(i1.next()){

            			out.println("<tr><td class='text-center'>"+i1.getString("ID")+"</td>");	
            			out.println("<td class='text-center'>"+i1.getString("pno")+"</td>");
            			
            			out.println("<td class='text-center'>"+i1.getString("amount")+"</td></tr>");
            			
            			
            		}
					%>
					
					
					</tbody>
             	
             	</table>
             	</div>
            </div>
          </div>
          
          
           <div class="card ">
           	 <div class="card-body">
            	<div class="table-responsive">
             		<table class="table">
             			<thead class=" text-primary">
											<th class="text-center"></th>
											
											
					</thead>
					<tbody>
					<form action="./finalcancel.jsp" method="post">

					<div class="form-group">
						ID of the slot <input class="form-control" type="text" name="ID"required> 

					</div>
					<br> 
					</form>
				
					</tbody>
             	
             	</table>
             	</div>
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
  <script src="../assets/js/now-ui-dashboard.min.js?v=1.5.0" type="text/javascript"></script><!-- Now Ui Dashboard DEMO methods, don't include it in your project! -->
  <script src="../assets/demo/demo.js"></script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      demo.initGoogleMaps();
    });
  </script>
</body>

</html>