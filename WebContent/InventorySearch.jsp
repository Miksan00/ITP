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
<form class="form-inline" method="post" action="InventorySearch.jsp">
<input type="text" name="search" class="form-control" placeholder="Search user name..">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>


<table class="table table-bordered">
			<thead>
				<tr>

					<th>Inventory Name</th>
					<th>Supplier Name</th>
					<th>Supllier Id</th>
					<th>Supplier Date</th>
					<th>Quantity</th>
					<th>Price</th>
					
						<th>Total</th>
					<th>Actions</th>
					
				</tr>
			</thead>
					<tbody>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from inventory WHERE inventoryname LIKE '%"+ search + "%'";
System.out.println(sql);
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("inventoryname") %></td>
<td><%=resultSet.getString("suppliername") %></td>
<td><%=resultSet.getString("supllierid") %></td>
<td><%=resultSet.getString("supplierdate") %></td>
<td><%=resultSet.getString("quantity") %></td>
<td><%=resultSet.getString("price") %></td>

<td><%=resultSet.getString("total") %></td>
<c:forEach var="user" items="${list}">
<td><a href="edit?id=<%=resultSet.getInt("id")%>">Edit</a>
    &nbsp;&nbsp;&nbsp;&nbsp; 
    <a href="delete?id=<%=resultSet.getInt("id")%>">Delete</a>
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