<!DOCTYPE html>
<html>
<head>
<title>Employee Home</title>
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
height:100px;
width:310px;
}
#header img{
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

/*============================= Home Contant =========================================*/
*{
	box-sizing: border-box;
	padding: 0;
	margin: 0;
}
.container{
	display: flex;
	justify-content: center;
	padding-bottom: 100px;
	padding-top: 60px;
}
.card:hover{
	box-shadow: 0 0 20px rgba(48, 46, 77, 0.5);
}
.card{
	background: #c7b0ab;
	width: 270px;
	height: 350px;
	margin: 15px;
	border-radius: 15px;
}
.card-image{
	background-color: aqua;
	height: 190px;
	margin-bottom: 15px;
	background-size: cover;
	border-radius: 15px;
}
.card-1{
	background-image: url("image/Emp.jpg")
}
.card-2{
	background-image: url("image/Emp salary.jpg")
}
.card-3{
	background-image: url("image/Emp apply.jpg")
}
.card-4{
	background-image: url("image/Emp holiiday.jpg")
}
.card h3{
	text-align: center;
	padding: 10px;
}
.card a{
	background-color: #cc3a3a;
	color: white;
	padding: 15px 20px;
	display: inline-block;
	text-align: center;
	margin: 20px 85px;
	
	border-radius: 30px;
	text-decoration: none;
	font-size: 16px;
	font-weight: 600;
	transition: all 0.3s ease;
}

.card a:hover{
	transform: scale(1.05);
}


/*============================= Footer Contant =========================================*/

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
	height:100px;
	width:415.45px;
}
footer img{
	height:100%;
	width:100%;
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

</style>

<meta charset="ISO-8859-1">
<title>StarFoodCity</title>

</head>

<body>
	<section id="header">
		<a href="#"><img src="image/tulasimahal.png" alt="" width="130" class="logo"></a>
		<div>
			<ul id="navbar">
			
				<li><a href="EM_employeeLogin.jsp">Logout</a></li>
			
			</ul>
		
		</div>		
	</section>
	<br>
	<center><h2>Welcome to Employee Page</h2></center>
	<br>

	<section class="container">
		<div class="card">
			<div class="card-image card-1"></div>
				<h3>Employee Details</h3>
				<a href="EM_employeeList.jsp">VISIT</a>
		</div>
		<div class="card">
			<div class="card-image card-2"></div>
				<h3>Salary Information</h3>
				<a href="EM_salaryList.jsp">VISIT</a>
		</div>
		
		<div class="card">
			<div class="card-image card-3"></div>
				<h3>Apply Leave</h3>
				<a href="EM_applyLeave.jsp">VISIT</a>
		</div>
		
		<div class="card">
			<div class="card-image card-4"></div>
				<h3>Holidays</h3>
				<a href="EM_holidays.jsp">VISIT</a>
		</div>
	</section>
	
	<footer class="section-p1">
		<div class="col">
			<img class="logo" src="image/tulasimahal.png" alt="" width="100">
			
			</div>
		
		<div class="Copyrights">
			
			<h4>Copyrights</h4>
			<p>©2023 Batch SLIIT ITP Group TW21 Students   </p>
			
		
		</div>
		
	</footer>
	
</body>
</html>