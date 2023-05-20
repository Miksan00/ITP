<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<!-- Coding By CodingNepal - youtube.com/codingnepal -->
<html lang="en" dir="ltr">
  <head>
  <title>Holiday List</title>
    <meta charset="utf-8">
    <title>Dynamic Calendar JavaScript | CodingNepal</title>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google Font Link for Icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <script src="EM_script.js" defer></script>
    
    <style>
    
    /* Import Google font - Poppins */
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Poppins', sans-serif;
}

.wrapper{
  margin-left: 60px;
  width: 450px;
  background: rgb(214, 210, 210);
  border-radius: 10px;
  box-shadow: 0 15px 40px rgba(0,0,0,0.12);
}
.wrapper header{
  display: flex;
  align-items: center;
  padding: 25px 30px 10px;
  justify-content: space-between;
}
header .icons{
  display: flex;
}
header .icons span{
  height: 38px;
  width: 38px;
  margin: 0 1px;
  cursor: pointer;
  color: #878787;
  text-align: center;
  line-height: 38px;
  font-size: 1.9rem;
  user-select: none;
  border-radius: 50%;
}
#headerr img{
width:100%;
height:100%;
}
#headerr .logo{
width:310px;
height:100px;
}

.icons span:last-child{
  margin-right: -10px;
}
header .icons span:hover{
  background: #f2f2f2;
}
header .current-date{
  font-size: 1.45rem;
  font-weight: 500;
}
.calendar{
  padding: 20px;
}
.calendar ul{
  display: flex;
  flex-wrap: wrap;
  list-style: none;
  text-align: center;
}
.calendar .days{
  margin-bottom: 20px;
}
.calendar li{
  color: #333;
  width: calc(100% / 7);
  font-size: 1.07rem;
}
.calendar .weeks li{
  font-weight: 500;
  cursor: default;
}
.calendar .days li{
  z-index: 1;
  cursor: pointer;
  position: relative;
  margin-top: 30px;
}
.days li.inactive{
  color: #aaa;
}
.days li.active{
  color: #fff;
}
.days li::before{
  position: absolute;
  content: "";
  left: 50%;
  top: 50%;
  height: 40px;
  width: 40px;
  z-index: -1;
  border-radius: 50%;
  transform: translate(-50%, -50%);
}
.days li.active::before{
  background: #ff0000;
}
.days li:not(.active):hover::before{
  background: #f2f2f2;
}
#employees {
  margin-left: 650px;
  margin-top: -450px;
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 40%;
}

#employees td, #employees th {
  border: 1px solid #ddd;
  padding: 8px;
}

#employees tr:nth-child(even){background-color: #f2f2f2;}

#employees tr:hover {background-color: #ddd;}

#employees th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
#headerr{
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 80px;
	background-color: #F1F1F1;
	box-shadow: 0 0 20px rgba(48, 46, 77, 0.5);
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	
}

#navbarr{
	display: flex;
	align-items: center;
	justify-content: center;

}

#navbarr li{
	list-style: none;
	padding: 0 20px;
	position: relative;
	
}

#navbarr li a{
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	color: #1A1A1A
	
}

#navbarr li a:hover,#navbarr li a.active{
	color: #088178
}
#navbarr li a:hover::after,
#navbarr li a.active::after {
	content: "";
	width: 30%;
	height: 2px;
	background: #088178;
	position: absolute;
	bottom: -4px;
	left: 20px;
	
}
.aa a {
	background-color: #cc3a3a;
	color: white;
	padding: 15px 20px;
	display: inline-block;
	text-align: center;
	margin: 30px 50px;
	margin-left: 60px;
	border-radius: 30px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	transition: all 0.3s ease;
}

.aa a:hover{
	transform: scale(1.05);
}
footer{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	background-color: #F1F1F1;
	box-shadow: 0 0 20px rgba(48, 46, 77, 0.5);
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	
}

footer .col{
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	margin-bottom: 20px;
	margin-top: 20px;
	margin-left: 20px;
	
}

footer.logo{
	margin-bottom: 30px;
	height:100px;
	width:415.45px;
}
footer img{
height:100%;
width:100%;}

footer h4{
	font-size: 14px;
	padding-bottom: 20px;
	padding-top: 20px;
	
}

footer p{
	font-size: 13px;
	margin: 0px 100px 70px 0px; 
	color: #222222;
	
}

footer a{
	font-size: 14px;
	text-decoration: none;
	color: #222;
	margin-bottom: 10px; 
}

footer.Copyrights{
	width: 100%;
	
}
    
    
    </style>
    
  </head>
  <body>

    <section id="headerr">
      <a href="#"><img src="image/tulasimahal.png" alt=""width="130" class="logo"></a>
      <div>
        <ul id="navbarr">
        
          <li><a href="EM_adminHome.jsp">Home</a></li>
          <li><a href="index.html">Logout</a></li>
        </ul>
      
      </div>		
    </section>
  
  <div class="aa">
  <a href="EM_addHoliday.jsp">Add Holiday</a>
  </div>

    <div class="wrapper">
      <header>
        <p class="current-date"></p>
        <div class="icons">
          <span id="prev" class="material-symbols-rounded">chevron_left</span>
          <span id="next" class="material-symbols-rounded">chevron_right</span>
        </div>
      </header>
      <div class="calendar">
        <ul class="weeks">
          <li>Sun</li>
          <li>Mon</li>
          <li>Tue</li>
          <li>Wed</li>
          <li>Thu</li>
          <li>Fri</li>
          <li>Sat</li>
        </ul>
        <ul class="days"></ul>
      </div>
    </div>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{%>
<center><font color="green" size="4">Successfully Updated</font></center>
<%
}
%>
<%
if("invalid".equals(msg))
{%>
<center><font color="red" size="4">Something went wrong! Try Again!</font></center>
<%
}
%>
<%
if("deleted".equals(msg))
{%>
<center><font color="green" size="4">Successfully Deleted</font></center>
<%
}
%>

    <div>
      <table id="employees">
      <tr>
      <th>Date</th>
      <th>Reasons</th>
      </tr>
      <tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from holiday");
	while(rs.next())
	{
%>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
</tr>
<%
	}
	}
catch(Exception e)
{
	System.out.println(e);	
}
%>
      </table>
      </div>

      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

      <footer class="section-p1">
        <div class="col">
          <img class="logo" src="image/tulasimahal.png" alt="" width="100">
          
          </div>
        
        <div class="Copyrights">
          
          <h4>Copyrights</h4>
          <p>©2023 Batch SLIIT ITP Group TW21 Students  </p>
          
        
        </div>
        
      </footer>
    
  </body>
</html>