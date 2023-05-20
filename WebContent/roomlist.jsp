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
			<h3 class="text-center">List of Rooms</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/newroom" class="btn btn-success">Add Room</a>
			</div>
			
				<div class="container text-right">

				<a href="<%=request.getContextPath()%>/roompdf" class="btn btn-success ">Generate Report</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<th>Room Type</th>
						<th>No Of Beds</th>
						<th>Facilities</th>
						<th>Foods</th>
						<th>Cost Per day</th>
						<th>image</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="user" items="${listRooms}">

						<tr>
						<td><c:out value="${user.roomtype}" /></td>
							<td><c:out value="${user.nobeds}" /></td>
							<td><c:out value="${user.facilities}" /></td>
							<td><c:out value="${user.foods}" /></td>
							<td><c:out value="${user.cost}" /></td>
								<td><img src="<c:out value="${user.path}" />"   width="200" height="200"/></td>

							<td><a href="editroom?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteroom?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>