<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="hotel.dbconnection.ConnectionProvider"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Add Salary</title>
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
<a href="EM_salaryDetails.jsp">View Salary Information</a>
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


<div class="container">
<form action="EM_addSalaryAction.jsp" method="post">
<h2>ID</h2>
<input type="number" placeholder="Enter Employee ID" name="id" id="id" required>
<h2>Name</h2>
<input type="text" placeholder="Enter Name" name="name" required maxlength="25">
<hr>
<h2>City</h2>
<input type="text" placeholder="Enter City" name="city"maxlength="25" required>
<hr>
<h2>Phone Number</h2>
<input type="text" placeholder="Enter Phone Number" name="phonenumber" id="phonenumber" required>
<hr>
<h2>Position</h2>
<select name="position">
<option value="ITManager">IT Manager</option>
<option value="MarketingManager">Marketing Manager</option>
<option value="StoreManager">Store Manager</option>
<option value="StoreAdministrator">Store Administrator</option>
<option value="Cashier">Cashier</option>
<option value="SalesMan">Sales Man</option>
</select>
<hr>
<h2>Salary</h2>
<input type="number" placeholder="Enter Salary" name="salary" required oninput="validateSalary(this)">
<span id="salary-error"></span>
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
		
	</footer>
	
	
	
	
	<script>
  // Select the input field
  const idInput = document.getElementById("id");

  // Add an event listener to check the input on change
  idInput.addEventListener("change", function() {
    const value = idInput.value;

    // Check if the input is a valid number and is less than or equal to 99999
    if (isNaN(value) || value < 1 || value > 100) {
      // If the input is not valid, set the input field to empty and show an error message
      idInput.value = "";
      idInput.setCustomValidity("Please enter a valid Employee ID between 1 and 100.");
    } else {
      // If the input is valid, clear the error message
      idInput.setCustomValidity("");
    }
  });
  
  
  
  
  
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
	  
	  
	  
	  document.getElementById('phonenumber').addEventListener('input', function() {
	        var phoneNumber = this.value.trim();
	        if (phoneNumber.length === 10 && /^\d+$/.test(phoneNumber)) {
	            // Valid phone number, remove any existing error messages
	            this.setCustomValidity('');
	        } else {
	            // Invalid phone number, set a custom validation message
	            this.setCustomValidity('Please enter a valid 10-digit phone number');
	        }
	    });
	  
	
	  
	  
	 
	  function addDecimal() {
	    var salaryInput = document.getElementsByName("salary")[0];
	    salaryInput.value = parseFloat(salaryInput.value).toFixed(2);
	  }

	 
	    document.getElementById('phonenumber').addEventListener('input', function() {
	        var phoneNumber = this.value.trim();
	        if (/^\d{10}$/.test(phoneNumber)) {
	            // Valid phone number, remove any existing error messages
	            this.setCustomValidity('');
	        } else {
	            // Invalid phone number, set a custom validation message
	            this.setCustomValidity('Please enter a valid 10-digit phone number');
	        }
	    });
	
</script>

</body>
</html>