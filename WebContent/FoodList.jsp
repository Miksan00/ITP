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
		<div class="container" style="margin-left: 20%; padding-top:5%; background-color: #3d9970">
			<h3 class="text-center"style="color: #333333;font-size: 2em;font-weight: bold;">List of Restaurant Orders</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/newres" class="btn btn-success">Add Order</a>
			</div>
			<div class="container text-right">

				<a href="<%=request.getContextPath()%>/pdfrest" class="btn btn-success">Genarate Report</a>
			</div>
			
			<form class="form-inline" method="post" action="RestaurantBookingSearch.jsp">
<input type="text" name="User" class="form-control" placeholder="Search user name..">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>
			
			<br>
			<table class="table table-bordered" style="color:black; background-color: lightblue">
				<thead>
					<tr style="background-color: #e8f6fd;color:#333333">
					
						<th>User</th>
						<th>Juice</th>
						<th>Main Item</th>
						<th>Dessert</th>
						
						<th>Actions</th>
						
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
							 href="editres?id=<c:out value='${user.id}'  />">Edit</a>
								<a style="background-color: red;color: white;font-size: 1.0em; font-weight: bold; border-radius: 4px; padding: 10px 20px;"
								href="deleteres?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>
</html>