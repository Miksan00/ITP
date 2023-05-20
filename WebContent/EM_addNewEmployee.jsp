<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add New Employee</title>
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
	font-size: 25px;
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

h2,h1
{	
	margin-left:21%;
}
hr
{
	width:0%;
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

footer{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	background-color: #F1F1F1;
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

.gender{
margin-left: 25%;}

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
<a href="EM_editDeleteList.jsp">View Employee List</a>
</div>
<br>
	
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<center><font color="green" size="5">Successfully Updated</font></center>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<center><font color="red" size="5">Something went wrong! Try again</font></center>
<%} %>

<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from employee");
	if(rs.first())
	{
		id=rs.getInt(1);
		id=id+1;
	}%>
	<div class="container">
	<h1 style="color:green;">Employee ID: <%out.println(id); %></h1></div>
	<%
			}
catch(Exception e)
{}
%>

<div class="container">
<form action="EM_addNewEmployeeAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id); %>">
<h2>Name</h2>
<input type="text" placeholder="Enter Name" name="name" maxlength="25" required >
<hr>
<h2>Age</h2>
<input type="number" placeholder="Enter Age" name="age" required min="18" max="60" pattern="[0-9]+" title="Please enter a valid age (up to 60)">

<hr>
<h2>City</h2>
<input type="text" placeholder="Enter City" name="city" maxlength="25" required>
<hr>
<label>
  <h2>Gender</h2>
  <input type="radio" name="gender" value="male" class="gender" required> Male
</label><br> <br>
<label>
  <input type="radio" name="gender" value="female" class="gender" required> Female
</label>
<hr>
<hr>
<h2>Phone Number</h2>
<input type="number" placeholder="Enter Phone Number" name="phonenumber" id="phonenumber" required oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="10">


<hr>
<h2>E-mail</h2>
<input type="email" placeholder="Enter Email" name="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
<hr>
<h2>Position</h2>
<select name="position"   required>
<option value="">-- Select A Position --</option>
<option value="ITManager">IT Manager</option>
<option value="MarketingManager">Marketing Manager</option>
<option value="StoreManager">Store Manager</option>
<option value="StoreAdministrator">Store Administrator</option>
<option value="Cashier">Cashier</option>
<option value="SalesMan">Sales Man</option>
</select>
<hr>
<h2>Address</h2>
<input type="text" placeholder="Enter Address" name="address" required>
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
			<p>©2023 Batch SLIIT ITP Group TW21 Students  </p>
			
		
		</div>
		
		<script>
		
		const nameInput = document.querySelector('input[name="name"]');
		const nameRegex = /^[a-zA-Z]{1,25}$/;

		nameInput.addEventListener('input', function() {
		  if (!nameRegex.test(nameInput.value)) {
		    nameInput.setCustomValidity('Name must contain only letters and be less than 25 characters long');
		  } else {
		    nameInput.setCustomValidity('');
		  }
		});
		
		
		const cityInput = document.querySelector('input[name="city"]');

		  cityInput.addEventListener('input', () => {
		    // get input value
		    const cityValue = cityInput.value;

		    // validate input
		    const lettersOnly = /^[a-zA-Z]+$/;
		    if (!lettersOnly.test(cityValue)) {
		      cityInput.setCustomValidity('Please enter letters only');
		    } else if (cityValue.length > 25) {
		      cityInput.setCustomValidity('Please enter a city name less than or equal to 25 characters');
		    } else {
		      cityInput.setCustomValidity('');
		    }
		  });
		  
		  
		  
		  function validatePhoneNumber(input) {
			  // Remove any non-numeric characters
			  input.value = input.value.replace(/\D/g,'');
			}
			document.getElementById('phonenumber').addEventListener('input', function() {
			  validatePhoneNumber(this);
			});


		
		</script>
		
	</footer>

</body>
</html>