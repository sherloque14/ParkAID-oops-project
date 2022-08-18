<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <link rel="shortcut icon" href="assets/images/favicon-32x32.png" type="image/png">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
        crossorigin="anonymous">
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/all.js" integrity="sha384-xymdQtn1n3lH2wcu0qhcdaOpQwyoarkgLVxC/wZ5q7h9gHtxICrpcaSUfygqZGOe"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">
    <title>Admin Dashboard</title>
</head>
<body>
<style>
                            .viewport-max {
                                min-height: 100vh;
                            }

                            .sidebar {
                                border-right: 1px solid rgba(0, 0, 0, .2);
                            }

                            .info {
                                color: black;
                            }

                            .left {
                                position: absolute;
                                left: 0px;
                                width: 300px;
                                padding: 10px;
                            }

                            .right {
                                position: absolute;
                                right: 0px;
                                width: 300px;
                                padding: 10px;
                            }

                            .heading {
                                padding: 10px;
                                background-color: #0077B5;
                            }

                            .first {
                                margin-left: 35px;
                            }

                            .first-1{
                                margin-left: 70px;
                            }

                            .second {
                                margin-left: 250px;
                            }

                            .second-1 {
                                margin-left: 200px;
                            }

                            .last {
                                margin-left: 35px;
                                margin-right: 8px;
                            }

                            .butt {
                                float: right;
                                width: 80px;
                                margin-right: 17px;
                            }
                            .field{
                                width: 210px;
                            }
                        </style>
                        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
                            <div class="container-fluid">
                                <a class="navbar-brand" href="#">
                                    <h1 class="text-warning"><b style="font-family:Arial Bold">Park-Aid | Admin Panel</h1>
                                </a>
                                <button class="navbar-toggler" type="button" data-toggle="collapse"
                                    data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false"
                                    aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>

                                <div class="navbar-collapse collapse justify-content-end" id="navbarMenu">
                                    <ul class="navbar-nav">
                                        <li class="nav-item mr-4 mb-1">
                                            <a class="nav-link" href="#">
                                                <img src="https://cdn1.iconfinder.com/data/icons/avatar-2-2/512/Manager-512.png"
                                                    width="30" alt="" class=" img-fluid rounded-circle">
                                            </a>
                                        </li>
                                        <li class="nav-item mt-1">
                                            <a class="nav-link" href="#" data-toggle="modal"
                                                data-target="#signOutModal">
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
                                    <div class="col-2 sidebar d-flex flex-column list-group list-group-flush viewport-max ">
                                        <a href="#" class="list-group-item list-group-item-action text-center">
                                            <img src="https://cdn1.iconfinder.com/data/icons/avatar-2-2/512/Programmer-512.png"
                                                alt="" class="img-fluid rounded-circle mr-2"><%try {
                    						Class.forName("com.mysql.jdbc.Driver");
                    						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "Ansh2514@");
                    						Statement st = conn.createStatement();
                    						String email =(String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
                    						ResultSet i = st.executeQuery("SELECT * from admins WHERE email = " + "'" + email + "'" );
                    						while(i.next()) {
                    							String str0 = i.getString("username");
                    							out.println(str0);
                    							
                    						}
                    						
                    					}
                    					
                    					catch (Exception e) {
                    						out.println(e);
                    					}%></a>
                    					<a href="admindash.jsp" class="list-group-item list-group-item-action menu-items">
                                            <i class="fas fa-plus-circle mr-2 fa-lg"></i>Dashboard</a>
                                        <a href="addlocadmin.jsp" class="list-group-item list-group-item-action menu-items">
                                            <i class="fas fa-plus-circle mr-2 fa-lg"></i>Add Places</a>
                                        <a href="remlocadmin.jsp"
                                            class="list-group-item list-group-item-action menu-items">
                                            <i class="fas fa-minus-circle mr-2 fa-lg"></i>Remove Places</a>
                                        <a href="addworkeradmin.jsp"
                                            class="list-group-item list-group-item-action menu-items">
                                            <i class="fas fa-plus-circle mr-2 fa-lg"></i>Add Worker</a>
                                        <a href="remworkeradmin.jsp"
                                            class="list-group-item list-group-item-action menu-items">
                                            <i class="fas fa-minus-circle mr-2 fa-lg"></i>Remove Worker</a>
                                        <a href="#worker_list"
                                            class="list-group-item list-group-item-action menu-items">
                                            <i class="fas fa-list-alt mr-2 fa-lg"></i>Worker List</a>
                                        <a href="#location_list"
                                            class="list-group-item list-group-item-action menu-items">
                                            <i class="fas fa-list-alt mr-2 fa-lg"></i>Location List</a>
                                    </div>

                                    <div class="col-10 py-10  bg-light my-3">
                    <div class="row inform-cards">
                        <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                            <div class="card text-white my-2 rounded">
                                <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                    <i class="fas fa-user fa-2x"></i>
                                    <div class="inner-text text-right">
                                        <h4>
                                        <%
                                        try {
                    						Class.forName("com.mysql.jdbc.Driver");
                    						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "Ansh2514@");
                    						Statement st = conn.createStatement();
                    						String pno =(String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
                    						ResultSet i = st.executeQuery("SELECT * from admins WHERE email = " + "'" + pno + "'" );
                    						while(i.next()) {
                    							String str1 = i.getString("fname");
                    							out.println(str1);
                    							
                    						}
                    						
                    					}
                    					
                    					catch (Exception e) {
                    						out.println(e);
                    					}
                                        %>
                                        </h4>
                                        <h7>
                                        <%
                                        try {
                    						Class.forName("com.mysql.jdbc.Driver");
                    						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "Ansh2514@");
                    						Statement st = conn.createStatement();
                    						String pno =(String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
                    						ResultSet i = st.executeQuery("SELECT * from admins WHERE email = " + "'" + pno + "'" );
                    						while(i.next()) {
                    							String str2 = i.getString("lname");
                    							out.println(str2);
                    							
                    						}
                    						
                    					}
                    					
                    					catch (Exception e) {
                    						out.println(e);
                    					}%></h7>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                                <div class="card text-white my-2 rounded">
                                    <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                        <i class="fas fa-envelope mr-2 fa-lg"></i>
                                        <div class="inner-text text-right">
                                            <h5>
                                            <% try {
                    						Class.forName("com.mysql.jdbc.Driver");
                    						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "Ansh2514@");
                    						Statement st = conn.createStatement();
                    						String pno =(String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
                    						ResultSet i = st.executeQuery("SELECT * from admins WHERE email = " + "'" + pno + "'" );
                    						while(i.next()) {
                    							String str3 = i.getString("pno");
                    							out.println(str3);
                    							
                    						}
                    						
                    					}
                    					
                    					catch (Exception e) {
                    						out.println(e);
                    					}%></h5>
                                            <h7>Phone Number</h7>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                                    <div class="card text-white my-2 rounded">
                                        <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                            <i class="fas fa-tty"></i>
                                            <div class="inner-text text-right">
                                                <h4><%try {
                    						Class.forName("com.mysql.jdbc.Driver");
                    						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "Ansh2514@");
                    						Statement st = conn.createStatement();
                    						String pno =(String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
                    						ResultSet i = st.executeQuery("SELECT * from admins WHERE email = " + "'" + pno + "'" );
                    						while(i.next()) {
                    							String str4 = i.getString("email");
                    							out.println(str4);
                    							
                    						}
                    						
                    					}
                    					
                    					catch (Exception e) {
                    						out.println(e);
                    					}%></h4>
                                                <h7>Email</h7>
                                            </div>
                                        </div>
                                        
                                    </div>
                                </div>

                                  <div class="col-sm-6 col-md-4 col-lg-3 p-4">
                                        <div class="card text-white my-2 rounded">
                                            <div class="card-body bg-primary d-flex align-items-center justify-content-between">
                                            <!--  <h6>⭐⭐⭐⭐⭐</h6>-->
                                                <div class="inner-text text-right">
                                                    <h4><% try {
                    						Class.forName("com.mysql.jdbc.Driver");
                    						Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "Ansh2514@");
                    						Statement st = conn.createStatement();
                    						String pno =(String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
                    						ResultSet i = st.executeQuery("SELECT * from admins WHERE email = " + "'" + pno + "'" );
                    						while(i.next()) {
                    							String str5 = i.getString("address");
                    							out.println(str5);
                    							
                    						}
                    						
                    					}
                    					
                    					catch (Exception e) {
                    						out.println(e);
                    					}%></h4>
                                                    <h10>Address</h10>
                                                </div>
                                            </div>
               
                                        </div>
                                    </div>
                    </div>
                       <div class="row inform-cards">
                                            <div class="col-sm-6 col-md-4 col-lg p-4">
                                               
                                            </div>
                                            <div class="row">
                                                <div class="col-12 text-center">
                                                    <form action="./Location.jsp" method="post">
                                                        <div class="title"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="worker_list">
                                            <h2 class="text-center">Worker List</h2>
							<br> <br> <br>
					<%
					try {


						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
						Statement st = conn.createStatement();
						ResultSet i = st.executeQuery("SELECT * from workers ");
						out.println("<table style='width:100%'><tr><th>First Name</th><th>Last Name</th><th>Rating</th><th>Email</th><th>Phone Number</th></tr>");
						while(i.next()) {
							String str1 = i.getString("fname");
							String str5 = i.getString("lname");
							String str2 = i.getString("rating");
							String str3 = i.getString("email");
							String str4 = i.getString("pno");
							
							out.println("<tr><th>"+str1+ "</th><th>"+str5+ "</th><th>"+str2+ "</th><th>"+str3+"</th><th>"+str4+ "</th></tr>");
							
						}
						
						out.println("</table>");
					}
					
					catch (Exception e) {
						System.out.println(e.toString());
					}
					
					%>
						<br> <br> <br>
						<h2 class="text-center">Location List</h2>
						<br> <br> <br>
					<%
					try {


						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DriverManager.getConnection("jdbc:mysql:// localhost:3306/users", "root", "Ansh2514@");
						Statement st = conn.createStatement();
						ResultSet i = st.executeQuery("SELECT * from parkings ");
						out.println("<table style='width:100%'><tr><th>Location</th><th>Date</th><th>Price</th><th>WorkerAssigned</th></tr>");
						while(i.next()) {
							String str1 = i.getString("location");
							String str2 = i.getString("date");
							String str3 = i.getString("price");
							String str4 = i.getString("worker");
					  		out.println("<tr><th>"+str1+ "</th><th>"+str2+ "</th><th>"+str3+"</th><th>"+str4+ "</th></tr>");
							
						}
						
						out.println("</table>");
					}
					
					catch (Exception e) {
						System.out.println(e.toString());
					}
					
					%>
            </div>
    </section>

    <div class="modal fade" id="signOutModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog  modal-dialog-centered">
                                <div class="modal-content">
                                    <span class="modal-body"><h2 class="lead">Are you sure you wanna logout?</h2></span>
                                    <div class="modal-footer">
                                        <button class="btn btn-danger" type="button"><a href="home.html" style="text-decoration: none; color:white">Logout</a></button>
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