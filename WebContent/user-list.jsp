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
	<%@include file="header.jsp"%>
	<div class="container" style="margin-left: 20%; padding-top: 5%">
		<h3 class="text-center">List of Inventory</h3>
		<hr>
		<div class="container text-left">

			<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
				Inventory</a>
		</div>
		<div class="container text-center">

			<a href="<%=request.getContextPath()%>/listcard"
				class="btn btn-success">Card View Inventory</a>
		</div>
		
		<form class="form-inline" method="post" action="InventorySearch.jsp">
<input type="text" name="search" class="form-control" placeholder="Search user name..">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>
		
		
		<div class="container text-right">

				<a href="<%=request.getContextPath()%>/pdfinventory" class="btn btn-success ">Generate Report</a>
			</div>
		<br>
		<table class="table table-bordered">
			<thead>
				<tr>

					<th>Inventory Name</th>
					<th>Supplier Name</th>
					<th>Supllier Id</th>
					<th>Supplier Date</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Images</th>
				<!-- 		<th>Total</th> -->
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="user" items="${listUser}">

					<tr>
						<td><c:out value="${user.inventoryname}" /></td>
						<td><c:out value="${user.suppliername}" /></td>
						<td><c:out value="${user.supllierid}" /></td>
						<td><c:out value="${user.supplierdate}" /></td>
						<td><c:out value="${user.quantity}" /></td>
						<td><c:out value="${user.price}" /></td>
						<td><img src="<c:out value="${user.path}" />" width="200"
							height="200" /></td>
	<td><c:out value="${user.total}" /></td>
						<td><a href="edit?id=<c:out value='${user.id}' />">Edit</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
					</tr>
				</c:forEach>
				<!-- } -->
			</tbody>

		</table>
	</div>
	</div>
</body>
</html>