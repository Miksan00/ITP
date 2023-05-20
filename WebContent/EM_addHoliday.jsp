<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Holiday</title>
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
	box-shadow: 0 5px 15px rgba(0,0,0,0.06);
}
#header .logo{
	height: 100px;
    width: 310px;
}
header img{
    height:100%;
    width:100%;
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

{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:21%;
}
hr
{
	width:0%;
}

input[type="text"], input[type="date"], input[type="submit"], select
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

footer{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	background-color: #F1F1F1;
	
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
			
				<li><a href="index.html">Logout</a></li>
			
			</ul>
		
		</div>		
	</section>
	
<div class="aa">
<a href="EM_holidayList.jsp">View Holiday List</a>
</div>
<br>

<div class="container">
<form action="EM_addHolidayAction.jsp" method="post">

<h2>Date</h2>
<input type="date" placeholder="Enter Date" name="date" required pattern="\d{4}-\d{2}-\d{2}" id="myDate">



<hr>
<h2>Reasons</h2>
<input type="text" placeholder="Enter Reasons" name="reasons" required onkeyup="validateReasons(this)">
<br>
<br>
<br>
<br>
<center><button type="submit" class="btn">Submit</button></center>
</form>
</div>

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
			<p>©2023 Batch SLIIT ITP Group TW21 Students </p>
			
		
		</div>
		
	</footer>
<script>
    var today = new Date().toISOString().split('T')[0];
    document.getElementById("myDate").setAttribute('min', today);
    
    
    function validateReasons(input) {
      // Remove special characters except space
      input.value = input.value.replace(/[^a-zA-Z\s]/g, '');
    }
    
</script>

</body>
</html>