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
                    <a href="location.jsp" class="list-group-item list-group-item-action menu-items active">
                        <i class="fas fa-car mr-2 fa-lg"></i>Park Car</a>
                       <a href="cancellation.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-window-close mr-2 fa-lg"></i>Cancel Booking</a>
                    <a href="reviewtype.jsp" class="list-group-item list-group-item-action menu-items">
                        <i class="fas fa-user-edit mr-2 fa-lg"></i>Feedback</a>
                    <div class="list-group-item">
                    </div>
                    

                </div>
                <form action="getlocation.jsp">
                <br> 
                <style>
                	input{
                	border: 3px solid #f0ad4e;
                	color: text-warning;
                	}
                	input:focus{
                	border: 1px solid black;
                	}
                </style>
                <br><br><br><br><br><br><br>
                <div  style="margin-left: 200px">
                <h4>Enter details to get the perfect parking spot:</h4>
     
							<div class="input-group no-border">
								<%
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
								Statement st = conn.createStatement();
								ResultSet i = st.executeQuery("SELECT * from parkings ");
								out.println("<input list='browsers' placeholder='Location'  required name ='location' style='height:50px; width:250px'>");
								out.println("<datalist id='browsers'>");
								while (i.next()) {
									String locate = i.getString("location");
									out.println("<option value='" + locate + "'>");
								}
								%>

								</datalist>
								&nbsp
								<input type="date" value="Check In(hrs)" name="Date" style="height:50px" required>
								&nbsp
								<input type="number" min="5" max="17" name="Checkin" id = "test1" placeholder="Check In(hrs)" style="width:130px; height:50px; border-c" required >
								&nbsp
								<input type="number" min="5" max="17" name="Checkout" id= "test2" placeholder="Check Out(hrs)" style="width:130px; height:50px" required>
								&nbsp
								<input type="submit" value="Submit" onclick="return Validate()" style="width:130px; height:50px; background: #2c6ed5; color: white;">

							</div>
					</div>
							

						</form>
						<script type="text/javascript">
							function Validate() {
								int OUT = document.getElementById("test2").value;
								int IN = document
										.getElementById("test1").value;
								
								if (OUT-IN > 4) {
									alert("Maximum Time Exceeded only 4 hrs allowed	");
									return false;
								}
								else if(OUT<=IN){
									alert("Wrong Data Provided");
									return false;
								}
								else
								return true;
							}
						</script>
                <!-- MAIN CARDS-->
                <div class="col-lg-10 py-5 bg-light my-3">
                    <div class="row">
                        <div class="col">
                            <h2 class="text-info">User Dashboard /
                                <small class="text-muted">Locations</small>
                            </h2>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-4">
                        <canvas id="lineChart" width="400" height="400"></canvas>
                    </div>
                    <div class="col-sm-4">
                        <canvas id="sampleChart" width="400" height="400"></canvas>
                    </div>
                    <div class="col-sm-4">
                        <canvas id="pieChart" width="400" height="400"></canvas>
                    </div>
                </div>

            </div>
        </div>
    </section>
 
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