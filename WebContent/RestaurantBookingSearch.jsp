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
String User=request.getParameter("User");

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
<form class="form-inline" method="post" action="RestaurantBookingSearch.jsp">
<input type="text" name="User" class="form-control" placeholder="Search user name..">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>


<table class="table table-bordered">
			<thead>
				<tr>

					<th>User</th>
						<th>Juice</th>
						<th>Main Item</th>
						<th>Dessert</th>
						<th>Actions</th>
					
				</tr>
			</thead>
					<tbody>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from restaurant WHERE user LIKE '"+ User + "%';";
System.out.println(sql);
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("User") %></td>
<td><%=resultSet.getString("Juice") %></td>
<td><%=resultSet.getString("Main") %></td>
<td><%=resultSet.getString("Dessert") %></td>


<td><a href="editres?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteres?id=<c:out value='${user.id}' />">Delete</a></td>
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