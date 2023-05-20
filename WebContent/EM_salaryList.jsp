<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Salary List</title>
<link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>

@import url('http://fonts.googleapis.com/css2?family=Spartan:wght@100;200;300;400;500;600;700;800;900&display=swap');

*{
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Spartan', sans-serif;
	
}

h1{
	font-size: 50px;
	line-height: 64px;
	color: #222222
	
}

h2{
	font-size: 23px;
	line-height: 54px;
	color: #222222
	
}

h4{
	font-size: 20px;
	color: #222222
	
}

h6{
	font-weight:700 ;
	font-size: 12px;
	
}

p{
	font-size: 16px;
	color: #465B52;
	margin: 15px 0 20px 0;
		
	
}

.section-p1{
	padding: 40px 80px;
		
	
}

.section-m1{
	margin: 40px 0;
	
}

body{
	width: 100%;
}

#header{
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 20px 80px;
	background-color: #F1F1F1;
	box-shadow: 0 0 20px rgba(48, 46, 77, 0.5);
	border-bottom-left-radius: 15px;
	border-bottom-right-radius: 15px;
	
}
#header .logo{
	height: 100px;
    width: 310px;
}
#header img{
	height: 100%;
    width: 100%;
}



#navbar{
	display: flex;
	align-items: center;
	justify-content: center;

}

#navbar li{
	list-style: none;
	padding: 0 20px;
	position: relative;
	
}

#navbar li a{
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	color: #1A1A1A
	
}

#navbar li a:hover,#navbar li a.active{
	color: #088178
}
#navbar li a:hover::after,
#navbar li a.active::after {
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
	margin-right: 1080px;
	border-radius: 30px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	transition: all 0.3s ease;
}

.aa a:hover{
	transform: scale(1.05);
}

#employees {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
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
	
}

footer.logo{
	margin-bottom: 30px;
}

footer h4{
	font-size: 14px;
	padding-bottom: 20px; 
	
}

footer p{
	font-size: 13px;
	margin: 0 0 8px 0; 
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
	text-align: center;
	
}

img{
	width:100%;
	height:100px;
	
}

</style>
</head>
<body>
	<section id="header">
		<a href="#"><img src="image/tulasimahal.png" alt=""width="130" class="logo"></a>
		<div>
			<ul id="navbar">
			
				<li><a href="EM_employeeHome.jsp">Home</a></li>
				<li><a href="EM_employeeLogin.jsp">Logout</a></li>
			</ul>
		
		</div>		
	</section>
<br>
<center><h2>Salary Information</h2></center>
<br>

<center>
<table id="employees">
<tr>
<th>ID</th>
<th>Name</th>
<th>City</th>
<th>Phone Number</th>
<th>Possition</th>
<th>Salary</th>
</tr>
<tr>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from salaryinfo");
	while(rs.next())
	{
%>
<td><%=rs.getInt(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
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
</center>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
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