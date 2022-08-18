<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*,java.util.*, java.io.BufferedReader.*, java.io.InputStreamReader.*,java.io.OutputStreamWriter.*, java.net.URL.*,java.net.URLConnection.*, java.net.URLEncoder.*" %>    
<%@page import="java.net.HttpURLConnection.*" %>

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
                
                    <a href="userdash.jsp" class="list-group-item list-group-item-action menu-items active">
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
                       <a href="cancellation.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-window-close mr-2 fa-lg"></i>Cancel Booking</a>
                    <a href="reviewtype.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-user-edit mr-2 fa-lg"></i>Feedback</a>
                    <div class="list-group-item">
                    </div>
                    

                </div>
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg navbar-transparent  bg-primary  navbar-absolute">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-controls="navigation-index"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">
						<form>
							<div class="input-group no-border">
							<%
							Class.forName("com.mysql.jdbc.Driver");
                    		Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
                    		Statement st=conn.createStatement();
                    		ResultSet  i =st.executeQuery("SELECT * from parkings ");
							
                    			
								
								while(i.next()){
								String locate = i.getString("location");
								
								}
								%>
								
								

							</div>
						</form>

					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="panel-header panel-header-sm"></div>
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Locations</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
											<th class="text-center">Location</th>
											<th class="text-center">Date</th>
											<th class="text-center">Duration(hrs)</th>
											<th class="text-center">Worker Assigned</th>
											<th class="text-center">Worker Rating</th>
										
											<th class="text-center">Car Repair</th>
											<th class="text-center">Car Wash</th>
											<th class="text-center">Fuel Refill</th>
											<th class="text-center">Slots</th>
											
											<th class="text-center">Price/Slot</th>
										</thead>
										<tbody>
											<%
										
											String Locate = (String)request.getParameter("location");
											String Date = (String)request.getParameter("Date");
											String In = (String)request.getParameter("Checkin");
											String Out = (String)request.getParameter("Checkout");
											
											Class.forName("com.mysql.jdbc.Driver");
				                    		Connection conn1 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
				                    		Statement st1=conn.createStatement();
				                    		ResultSet  i1 =st.executeQuery("SELECT * from parkings where location = '" +Locate+ "'  and date = '"+ Date +"'" );
				                    		out.println("<tr>");
				                    		int ar[] = new int[12];
				                    	
				                    		String price="";
			                    			String Location="";
			                    			String date="";
			                    			String Worker="";
			                    			String Rating="";
			                    			String a56="0";
			                    			String a67="0";
			                    			String a78="0";
			                    			String a89="0";
			                    			String a910="0";
			                    			String a1011="0";
			                    			String a1112="0";
			                    			String a1213="0";
			                    			String a1314="0";
			                    			String a1415="0";
			                    			String a1516="0";
			                    			String a1617="0";
			                    			String CR="0";
			                    			String CW="0";
			                    			String FR="0";
			                    			int Duration = 0;
			                    			int slots =0;
			                    			
				                    		if(i1.next()){
				                    			price = i1.getString("price");
				                    			Location = i1.getString("location");
				                    			date =  i1.getString("date");
				                    			Worker =  i1.getString("worker");
				                    			Class.forName("com.mysql.jdbc.Driver");
					                    		Connection conn2 = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
					                    		Statement st2=conn2.createStatement();
					                    		ResultSet  i2=st2.executeQuery("SELECT * from workers where fname= '" +Worker+ "'" );
					                    		if(i2.next())
				                    		    Rating =  i2.getString("rating");
					                    		else{
					                    		Rating =  "0";	
					                    		
					                    		}
					                    		CR =  i2.getString("carrepair");
					                    		CW =  i2.getString("carwash");
					                    		FR =  i2.getString("fuel");
					                    		a56 =  i1.getString("s56");
				                    			ar[0]=Integer.parseInt(a56);
				                    			a67 =  i1.getString("s67");
				                    			ar[1]=Integer.parseInt(a67);
				                    			a78 =  i1.getString("s78");
				                    			ar[2]=Integer.parseInt(a78);
				                    			a89 =  i1.getString("s89");
				                    			ar[3]=Integer.parseInt(a89);
				                    			a910 =  i1.getString("s910");
				                    			ar[4]=Integer.parseInt(a910);
				                    			a1011 =  i1.getString("s1011");
				                    			ar[5]=Integer.parseInt(a1011);
				                    			a1112 =  i1.getString("s1112");
				                    			ar[6]=Integer.parseInt(a1112);
				                    			a1213 =  i1.getString("s1213");
				                    			ar[7]=Integer.parseInt(a1213);
				                    			a1314 =  i1.getString("s1314");
				                    			ar[8]=Integer.parseInt(a1314);
				                    			a1415 =  i1.getString("s1415");
				                    			ar[9]=Integer.parseInt(a1415);
				                    			a1516 =  i1.getString("s1516");
				                    			ar[10]=Integer.parseInt(a1516);
				                    			a1617 =  i1.getString("s1617");
				                    			ar[11]= Integer.parseInt(a1617);
				                    			
				                    			System.out.println(In);
				                    			int inTime=Integer.parseInt(In);
				                    			int outTime=Integer.parseInt(Out);
				                    			int min = ar[inTime-5];  
				                    		        //Loop through the array  
				                    		        for (int i3 = inTime-5; i3 <= outTime-5; i3++) {  
				                    		            //Compare elements of array with min  
				                    		           if(ar[i3] <min)  
				                    		               min = ar[i3];  
				                    		        }  
				                    			slots = min;
				                    			Duration = (outTime - inTime);
				                    			request.getSession().setAttribute("Location",Locate);
				                    			request.getSession().setAttribute("date",Date);
				                    			request.getSession().setAttribute("Slots",slots);
				                    			request.getSession().setAttribute("cintime",inTime);
				                    			request.getSession().setAttribute("couttime",outTime);
											}
				                    		out.println("</tr>");
											
											
												out.println("<td class='text-center'>"+Location+"</td>");
												out.println("<td class='text-center'>"+date+"</td>");
												out.println("<td class='text-center'>"+Duration+"</td>");
												out.println("<td class='text-center'>"+Worker+"</td>");
												out.println("<td class='text-center'>"+Rating+"</td>");
												if(CR.equals("1"))
												out.println("<td class='text-center'>Available</td>");
												else{
													out.println("<td class='text-center'>Unvailable</td>");	
												}
												
												if(CW.equals("1"))
													out.println("<td class='text-center'>Available</td>");
												else{
														out.println("<td class='text-center'>Unvailable</td>");	
													}
												
												if(FR.equals("1"))
													out.println("<td class='text-center'>Available</td>");
												else{
														out.println("<td class='text-center'>Unvailable</td>");	
												}
												
												
												out.println("<td class='text-center'>"+slots+"</td>");
												
												out.println("<td class= 'text-center' >"+price+"</td>");
												
											%>	
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
												
						
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Waiting List</h4>
							</div>
							<div class="card-body">
								<div>
								<form action = "waitlist.jsp" method = "post">
								<%
									if(slots <= 0 ){
										out.println("No of slots(Rs. 50 /slot)&nbsp&nbsp<input class='fname' type='number' step =1 min=1 name='waitingPAY'  required>");
										out.println("<br><br>");
										out.println("Waiting List??<br><br><button type='submit'>Enroll Me</button>");	
									}
									else{
										out.println("<style='text-color:red'>***No waiting list generated as slots available***</style>");
									}
								%>
							
											
								
								
								</form>
						</div>
							</div>
						</div>
						
						
						
						
						
						
						
						
						
						
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Confirm Your Booking</h4>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table">
										<thead class=" text-primary">
										
										</thead>
										<tbody>
									<form action="./bookingfinal.jsp" method="post">
								
										<div style ='color:black; text-align:center'>
										<% 
										
										out.println("No of slots(Rs. 50 /slot)&nbsp&nbsp<input class='fname' type='number' step =1 min=1 max = "+ slots +" name='valuePAY'  required>");
										out.println("<br><br>");
										if(CR.equals("1"))
out.println("<input type='checkbox' id='CR' name='CR' value='1'><label for='CR'> &nbsp&nbsp(Rs. 500) Car Repair</label><br>");
											
											
											if(CW.equals("1"))
out.println("<input type='checkbox' id='CW' name='CW' value='1'><label for='CW'> &nbsp&nbsp(Rs. 100) Car Wash</label><br>");
											
											
											if(FR.equals("1"))
out.println("<input type='checkbox' id='FR' name='FR' value='1'><label for='FR'> &nbsp&nbsp(Rs. 100) Fuel Refill</label><br>");
											
										%>
										<br><br>
											<input class='fname' type='text'  name='PROMO' placeholder = 'ENTER OFFER CODE' style="width:150px; height:30px; border-c"  >
											<br><br><br>
											<%
											if(slots != 0){
											out.println("<button type='submit' style='width:200px; height:50px; background: #2c6ed5; color: white;'>Proceed to Final Booking </button>");
											}
											else{
												out.println("Unavailable :(");
											}
											%>
										<br><br><br><br>
											<a href="location.jsp">Cancel </a>	
									</div>
								
							      </form>	
		
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		  <div class="modal fade" id="signOutModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog  modal-dialog-centered">
                                <div class="modal-content">
                                    <span class="modal-body"><h2 class="lead">Are you sure you wanna logout?</h2></span>
                                    <div class="modal-footer">
                                        <button class="btn btn-danger" type="button"><a href="logout.jsp" style="text-decoration: none; color:white">Logout</a></button>
                                        <div class="btn btn-primary" type="button" data-dismiss="modal">Stay</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Optional JavaScript -->
                        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                            crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
                            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
                            crossorigin="anonymous"></script>
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                            crossorigin="anonymous"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
                        <script src="line.js"></script>
                        <script src="sample.js"></script>
                        <script src="pie.js"></script>

                        <script>
                            window.addEventListener('load', function () {
                                document.querySelector('.navbar-toggler').innerHTML = '<i class="fas fa-arrow-down"></i>';
                            })

                        </script>
                    </body>

                    </html>