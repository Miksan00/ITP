<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>			
	<%@include file="header.jsp" %>
		<div class="container" style="margin-left: 20%; padding-top:5%">
			<h3 class="text-center">List of Room Bookings</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/newRoomBook" class="btn btn-success">Add Booking</a>
		
			</div>
			
			
			
			<div class="container text-right">

				<a href="<%=request.getContextPath()%>/roombookpdf" class="btn btn-success ">Generate Report</a>
			</div>
			
			<form class="form-inline" method="post" action="roombookingSearch.jsp">
<input type="text" name="search" class="form-control" placeholder="Search here....">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>
			
			<br>
			<table class="table table-bordered"> 
				<thead>
					<tr>
					
						<th>Full Name</th>
						<th>NIC</th>
						<th>Mobile</th>
						<th>Email</th>
						<th>Check In</th>
						<th>Check Out</th>
						<th>NO OF Rooms</th>
						<th> Total Members</th>
						<th>Advanced Payment</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				 
					<c:forEach var="user" items="${listRoomBooking}">

						<tr>
							<td><c:out value="${user.user}" /></td>
							<td><c:out value="${user.nic}" /></td>
							<td><c:out value="${user.mobile}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.checkin}" /></td>
							<td><c:out value="${user.checkout}" /></td>
							<td><c:out value="${user.noofrooms}" /></td>
							<td><c:out value="${user.members}" /></td>
							<td><c:out value="${user.advancedPayment}" /></td>

							<td><a href="editRoomBook?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteRoomBook?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
</body>
</html>