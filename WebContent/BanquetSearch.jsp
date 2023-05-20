<%-- 
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
<input type="text" name="User" class="form-control" placeholder="Search user name..">
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
</html> --%>


<%-- 

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hotel";
String userid = "root";
String password = "";
String search = request.getParameter("search");



try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
]
<body>
	<div class="container" style="margin-left: 20%; padding-top: 5%">
	<%@include file="header.jsp"%>
<form class="form-inline" method="post" action="BanquetSearch.jsp">
<input type="text" name="User" class="form-control" placeholder="Search here....">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>


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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "SELECT * FROM roomsbooking WHERE guest LIKE '%" + search + "%' OR mobile LIKE '%" + search + "%' OR additional LIKE '%" + search + "%' OR decoration LIKE '%" + search + "%'  OR date LIKE '%" + search + "%'   ";
System.out.println(sql);
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
	int id = 9;
	System.out.println(id);
 %> 




<tr>
<td><%=resultSet.getString("guest") %></td>

<td><%=resultSet.getString("mobile") %></td>

<td><%=resultSet.getString("additional") %></td>
<td><%=resultSet.getString("decoration") %></td>
<td><%=resultSet.getString("date") %></td>



<c:forEach var="user" items="${listbanq}">
<td><a href="editRoomBook?id=<%=resultSet.getInt("id")%>">Edit</a>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <a href="deleteRoomBook?id=<%=resultSet.getInt("id")%>">Delete</a>
</td>

						
					</c:forEach>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace(); 
}
%>
</table>
</div>
</body>

</html> --%>








<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "hotel";
String userid = "root";
String password = "";
String search=request.getParameter("search");

try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
	<div class="container" style="margin-left: 20%; padding-top: 5%">
	<%@include file="header.jsp"%>
<form class="form-inline" method="post" action="BanquetSearch.jsp">
<input type="text" name="search" class="form-control" placeholder="Search user name..">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>


<table class="table table-bordered">
			<thead>
				<tr>

					<th>Guest Name</th>
					<th>Mobile</th>
					<th>Additional </th>
					<th>Decoration</th>
					
					<th>Date</th>
				</tr>
			</thead>
					<tbody>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from banquet WHERE guest LIKE '%" + search + "%' OR mobile LIKE '%" + search + "%' OR additional LIKE '%" + search + "%' OR decoration LIKE '%" + search + "%'  OR date LIKE '%" + search + "%'   ";
System.out.println(sql);
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("guest") %></td>
<td><%=resultSet.getString("mobile") %></td>
<td><%=resultSet.getString("additional") %></td>
<td><%=resultSet.getString("decoration") %></td>
<td><%=resultSet.getString("Date") %></td>

<c:forEach var="user" items="${listbanq}">
<td><a href="editbanq?id=<%=resultSet.getInt("id")%>">Edit</a>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <a href="deletebanq?id=<%=resultSet.getInt("id")%>">Delete</a>
</td>

						
					</c:forEach>



</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</div>
</body>

</html>





















