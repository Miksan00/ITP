<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@charset "UTF-8";

@import
	url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);

body {
	font-family: 'Open Sans', sans-serif;
	font-weight: 300;
	line-height: 1.42em;
	color: #A7A1AE;
	background-image: url("./home/images/bookings.jpg");
}

h1 {
	font-size: 3em;
	font-weight: 300;
	line-height: 1em;
	text-align: center;
	color: #4DC3FA;
}

h2 {
	font-size: 1em;
	font-weight: 300;
	text-align: center;
	display: block;
	line-height: 1em;
	padding-bottom: 2em;
	color: #FB667A;
}

h2 a {
	font-weight: 700;
	text-transform: uppercase;
	color: #FB667A;
	text-decoration: none;
}

.blue {
	color: black;
}

.yellow {
	color: #FFF842;
}

.container th h1 {
	font-weight: bold;
	font-size: 1em;
	text-align: left;
	color: #333333;
}

.container td {
	font-weight: normal;
	font-size: 1em;
	-webkit-box-shadow: 0 2px 2px -2px #0E1119;
	-moz-box-shadow: 0 2px 2px -2px #0E1119;
	box-shadow: 0 2px 2px -2px #0E1119;
}

.container {
	text-align: left;
	overflow: hidden;
	width: 80%;
	margin: 0 auto;
	display: table;
	padding: 0 0 8em 0;
}

.container td, .container th {
	padding-bottom: 2%;
	padding-top: 2%;
	padding-left: 2%;
}

/* Background-color of the odd rows */
.container tr:nth-child(odd) {
	background-color: white;
}

/* Background-color of the even rows */
.container tr:nth-child(even) {
	background-color: white;
}

.container th {
	background-color: white;
}

.container td:first-child {
	color: #333333;
}

.container tr:hover {
	background-color: #gold;
	-webkit-box-shadow: 0 6px 6px -6px #0E1119;
	-moz-box-shadow: 0 6px 6px -6px #0E1119;
	box-shadow: 0 6px 6px -6px #0E1119;
}

.container td:hover {
	background-color: gold;
	color: #333333;
	font-weight: bold;
	box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px,
		#7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
	transform: translate3d(6px, -6px, 0);
	transition-delay: 0s;
	transition-duration: 0.4s;
	transition-property: all;
	transition-timing-function: line;
}

@media ( max-width : 800px) {
	.container td:nth-child(4), .container th:nth-child(4) {
		display: none;
	}
}
</style>
<div style="width: 100%;
    float: right;background-color: transparent;
    padding: 8px;
        text-align: right;
    ">
<button onclick="window.location.href='MemberView.jsp'" style="background-color:green;color:white;padding:10px 20px;" class="btn-primary">Back to Home
</button>
<button onclick="window.location.href='<%=request.getContextPath()%>/newuserres'" style="background-color:green;color:white;padding:10px 20px;" class="btn-primary">go to Book
</button>
</div>
<h1>
	<span class="blue"><b>Restaurant</b><span class="blue"> <span
			class="yellow"></span><b>Bookings</b></span>
</h1>
<table class="container"  style="color:black; background-color: transparent;">
	<thead>
		<tr>

			<th><h1>User</h1></th>
			<th><h1>Juice</h1></th>
			<th><h1>Main Item</h1></th>
			<th><h1>Desert</h1></th>
			<th><h1>Action</h1></th>
			

		</tr>
	</thead>
	<tbody>
		<c:forEach var="user" items="${listFoods}">

			<tr>
				<td><c:out value="${user.user}" /></td>
				<td><c:out value="${user.juice}" /></td>
				<td><c:out value="${user.main}" /></td>
				<td><c:out value="${user.dessert}" /></td>
				
				
				<td><a style="background-color: blue; color: white;font-size: 1.0em;font-weight: bold;border-radius: 4px;padding: 10px 20px;" 
						href="editres?id=<c:out value='${user.id}' />">Edit</a>
					<a style="background-color: red;color: white;font-size: 1.0em; font-weight: bold; border-radius: 4px; padding: 10px 20px;"
						href="deleteres?id=<c:out value='${user.id}' />">Delete</a>
				</td>


			</tr>
		</c:forEach>
	</tbody>
</table>