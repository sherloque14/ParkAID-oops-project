<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
        <%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
                <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
                    <!DOCTYPE html>
                    <html>

                    <head>
                        <meta charset="ISO-8859-1">
                        <title>User</title>
                        <link rel="stylesheet" href="assets/userdash.css">
                        <link rel="user1" href="user1.js">
                    </head>

                    <body>
                        <div class="container">
                            <h1>Welcome


                                <%
         try {
        	 
        	 
        	String email = (String)request.getSession().getAttribute("EMAIL_VIA_LOGIN");
        	 
        	final String usern = "root";
    		final String pasw = "Ansh2514@";
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/users",usern,pasw);
        	 Statement st=conn.createStatement();
        	 ResultSet  i =st.executeQuery("SELECT * from user WHERE email= " + "'" +  email + "'"  );
        	
        	 if(i.next()){
        		String str = i.getString("fname");
         	 	out.println(str);
        	 }
        	 	
        	 	
        	 
         }
         
         catch(Exception e){
        	 System.out.println(e.toString());
         }
         %>
                            </h1>
                        </div>


                        <script>
                            document.querySelector('.img__btn').addEventListener('click', function() {
                                document.querySelector('.cont').classList.toggle('s--signup');
                            });
                        </script>
                        <div class="cont">
                                <a href="logout.jsp"> L O G O U T</a>
                        
                            <div class="form sign-in" width=1920px height=1080px>
                                <h2 style="font-family: verdana;">Hello, User</h2>
                                <h4 align="center">Please make the following selection:
                                    <!-- <label>
        <span>Location</span>
        <input type="text">
      </label> -->
                                    <label for="Location"><span>Location</span></label>
                                    <form action="./location.jsp" method="post">
                                      	<input list="browse" name="location">
                                        <datalist id="browse">
        									<option value="" disabled selected>-Select a Location-</option>
        									<option value="CP">Counnaught Place </option>
        									<option value="OAB">Old Academic Block</option>
        									<option value="NAB">New Academic Block</option>
        									<option value="FQ">Faculty Quarters</option>
        									<option value="M1">Mess 1</option>
        									<option value="M2">Mess 2</option>
        									<option value="SAC">Student Activity Center</option>
      									</datalist>
  										<label for="dates"><span>Select a date:
        								<input type="date" id="dates" name="dates"></span>
      									</label>
      									<label for="times"><span>Check In Time: </span>
        								<input type="time" id="times" name="times"></label>
        								<label for="times"><span>Check Out Time: </span>
        								<input type="time" id="times" name="times"></label>
										<button type="submit" class="submit">Lets Go!</button>
                                    </form>
                            </div>
                            <div class="sub-cont">
                                <div class="img">

                                </div>
                            </div>
                        </div>

                    </body>

                    </html>