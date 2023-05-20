
</html><%@ page language="java" contentType="text/html; charset=UTF-8"
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
			<h3 class="text-center">List of Banquet Hall</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/newbanq" class="btn btn-success">Add BanquetHall </a>
			</div>
			
			<div class="container text-right">

				<a href="<%=request.getContextPath()%>/roompdfbanquet" class="btn btn-success">Generate BanquetHall Report </a>
			</div>
			
			
			
			
			
			
			
			
			
			<form class="form-inline" method="post" action="BanquetSearch.jsp">
<input type="text" name="search" class="form-control" placeholder="Search user name..">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>
			
			
			
			
			
			
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
					
						<th>Guest Name</th>
						<th>Mobile</th>
						<th>Hall No</th>
						<th>Decoration</th>
						<th>Date</th>
					
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="user" items="${listBanq}">

						<tr>
					<td><c:out value="${user.guest}" /></td>
							<td><c:out value="${user.mobile}" /></td>
							<td><c:out value="${user.additional}" /></td>
							<td><c:out value="${user.decoration}" /></td>
							<td><c:out value="${user.date}" /></td>
							

							<td><a href="editbanq?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deletebanq?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>

</body>
</html>