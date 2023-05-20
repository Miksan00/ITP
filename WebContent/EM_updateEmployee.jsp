<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<title>Update Employee</title>
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
	font-size: 18px;
	line-height: 54px;
	color: #222222;
	margin-left: 21%;
	
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

hr
{
	width:0%;
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

input[type="text"], input[type="number"], input[type="submit"], input[type="email"], select
{
    width: 60%;
    height: 50px;
    border-radius: 20px;
    background-color: #d6d6d6;
    border: 1px solid var(--bg-black-50);
    padding: 10px 25px;
    font-size: 16px;
    color: var(--text-black-700);
    transition: all 0.3s ease;
    box-shadow: 0 0 20px rgba(48, 45, 77, 0.15);
    margin-left:20%;
    }
    
button{
	font-size: 16px;
    font-weight: 500;
    padding: 12px 35px;
    color: white;
    border-radius: 40px;
    display: inline-block;
    white-space: nowrap;
    border: none;
    background: #cc3a3a;
    transition: all 0.3s ease;
}
button:hover{
	transform: scale(1.05);
}

.aa a {
	background-color: #cc3a3a;
	color: white;
	padding: 15px 20px;
	display: block;
	text-align: center;
	margin: 30px 50px;
	margin-right: 1080px;
	border-radius: 30px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
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

#header img{
	height: 100%;
    width: 100%;
}
#header .logo{
	height: 100px;
    width: 310px;
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
	display: block;
	text-align: center;
	margin: 30px 50px;
	margin-right: 1050px;
	border-radius: 30px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
}

footer{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	background-color: #F1F1F1;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	box-shadow: 0 0 20px rgba(48, 46, 77, 0.5);
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
			
				<li><a href="EM_index.jsp">Logout</a></li>
			
			</ul>
		
		</div>		
	</section>
	
	<div class="aa">
<a href="EM_editDeleteList.jsp">View Employee List</a>
</div>

<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from employee where id='"+id+"'");
	while(rs.next())
	{
%>
<div class="container">
<form action="EM_updateEmployeeAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<hr>
<h2>Name</h2>
<input type="text" value="<%=rs.getString(2)%>" name="name">
<hr>
<h2>Age</h2>
<input type="number" value="<%=rs.getString(3)%>" name="age">
<hr>
<h2>City</h2>
<input type="text" value="<%=rs.getString(4)%>" name="city">
<hr>
<h2>Phone Number</h2>
<input type="number" value="<%=rs.getString(6)%>" name="phonenumber">
<hr>
<h2>E-mail</h2>
<input type="email" value="<%=rs.getString(7)%>" name="email">
<hr>
<h2>Address</h2>
<input type="text" value="<%=rs.getString(9)%>" name="address">
<br>
<br>
<br>
<center><button type="submit" class="btn">Submit</button></center>
</form>
</div>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);	
}
%>

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