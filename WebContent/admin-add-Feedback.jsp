<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	<link rel="stylesheet" href="css/universal_style.css">
	<title>Admin add Feedback</title>
</head>
<body>

	<% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="RoomController"><img Style="max-width:148px;" src="images/Logo.jpg"></a>
			
			<ul class="navbar-nav">
				
				<li class="nav-item">
					<c:url var="logoutLink" value="UserController">
						<c:param name="command" value="LOGOUT"/>
					</c:url>
					<a class="nav-link" href="${logoutLink}" style="color: #F1F1F1;"><i class="fas fa-sign-out-alt"></i> Logout</a>
				</li>
				<li class="nav-item">
					<c:url var="listLink" value="AdminFeedbackController">
					<c:param name="COMMAND" value="LIST"/>
				</c:url>
			<a class="nav-link" href="${listLink}" style="color: #F1F1F1;"><i class="fas fa-sign-out-alt"></i> Admin View Comments</a>
				</li>
			</ul>
		</div>
	</nav>
	
	
	<nav class="navbar navbar-light" style="background-color:#070AAD;">
		<div class="container">
			<h2><i class="fas fa-folder-plus"></i>Admin Add Feedback</h2>
		</div>
	</nav>
	<br>
	<div class="container" style="max-width: 800px; box-shadow: 5px 10px 18px #888888;">
		
		<br>
		
		<div>
			<form action="AdminFeedbackController" method="get">
			
				<input type="hidden" name="COMMAND" value="ADD">
				
			
				<div class="form-group">
					<label for="inputName">Full Name: </label>
					<input type="text" id="inputName" name="fullName" placeholder="Full Name" class="form-control" required="required">	
				</div>
				
				<%-- <div class="form-group">
					<label for="inputName">Nick Name: </label>
					<input type="text" id="nickName" name="NickName" placeholder="Nick Name" class="form-control" required="required">	
				</div> --%>
				
				<div class="form-group">
					<label for="inputAddress">Comment: </label>
					<!-- <input type="text" id="address" name="address" placeholder=" Current Address" class="form-control" required="required"> -->
					<textarea rows="4" cols="50"id="address" name="address" placeholder=" Add Comment" class="form-control" required="required"></textarea>
				</div>
				
				
				
				<div class="form-group">
					<label for="inputDOA">Date: </label>
					<input type="date" id="inputDOA" name="dateOfArrival" placeholder="Date Of Arrival" class="form-control" required="required">
				</div>
				
				
				<div class="form-group">
					<label for="inputEmail">Email: </label>
					<input type="text" id="Email" name="email" placeholder="Enter Email Address" class="form-control" required="required" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?">
				</div>
				
				
				<div class="form-group">
					<label for="inputMobile">Mobile: </label>
					<input type="number" id="Mobile" name="mobile" placeholder="Enter Mobile Number" class="form-control" required="required" pattern="07[1,2,5,6,7,8][0-9]+" maxlength="10">
				</div>
				
				
				
				
					<br>
				
				
				<div class="row">
					<div class="col text-center">
						<input type="submit" value="ADD" class="btn btn-success btn-block">
					</div>
				</div>
					
			</form>
			
			<br><br>
			
			<div style="text-align:center; margin-bottom: 20px;">
				
				<button  class="btn btn-link" type="submit"><a href="all-rooms.jsp">Back to Home</a></button>
			</div>
			
			<br>
		</div>
		
	</div>
	
	<footer class="page-footer font-small navbar-dark bg-dark" style="color:#ffffff; left: 0; bottom: 0; width: 100%; margin-top: 20px;">
		<div class="footer-copyright text-center py-3">© 2023 Copyright</div>
	</footer>
	
</body>
</html>